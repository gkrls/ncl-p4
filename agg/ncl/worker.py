from scapy.all import Ether, IP, UDP, Packet, bind_layers, XByteField, IntField, ShortField, FieldListField

import argparse
import socket
import random
import threading
import multiprocessing
import json
import os
import sys
import time
import queue
import ctypes
import numpy as np
import struct


def get_first_ip(iface="eth0"):
    for s in os.popen('ip addr show').read().split("inet ")[1:]:
        if s.startswith("127.0"):
            continue
        return s.split('/')[0]
    return None


def hexdump(src, length=16, sep='.'):
    FILTER = ''.join([(len(repr(chr(x))) == 3) and chr(x)
                     or sep for x in range(256)])
    lines = []
    for c in range(0, len(src), length):
        chars = src[c:c + length]
        hexstr = ' '.join(["%02x" % ord(x) for x in chars]) if type(
            chars) is str else ' '.join(['{:02x}'.format(x) for x in chars])
        if len(hexstr) > 24:
            hexstr = "%s %s" % (hexstr[:24], hexstr[24:])
        printable = ''.join(["%s" % ((ord(x) <= 127 and FILTER[ord(x)]) or sep) for x in chars]) if type(
            chars) is str else ''.join(['{}'.format((x <= 127 and FILTER[x]) or sep) for x in chars])
        lines.append("%08x:  %-*s  |%s|" % (c, length * 3, hexstr, printable))
    return '\n'.join(lines)


def head(l, lim=4):
    return ",".join(map(str, l[:lim])) + "..."


DEFAULT_DEVICE_MAC = "42:42:42:42:42:42"
DEFAULT_DEVICE_IP = "42.42.42.42"
DEFAULT_DEVICE_PORT = 4242
DEFAULT_DEVICE = f"{DEFAULT_DEVICE_MAC}|{DEFAULT_DEVICE_IP}|{DEFAULT_DEVICE_PORT}"
DEFAULT_TIMEOUT = 1
DEFAULT_BASE_PORT = 4242
DEFAULT_RANK = 1
DEFAULT_WORLD = 2

parser = argparse.ArgumentParser()
parser.add_argument("-R", "--rank", type=int, default=DEFAULT_RANK,
                    help=f"worker rank. Must be >= {DEFAULT_RANK} (default={DEFAULT_RANK})")
parser.add_argument("-I", "--ip", default="wtf", type=str,
                    help="the worker's ip address")
parser.add_argument("-P", "--port", default=DEFAULT_BASE_PORT, type=int,
                    help=f"Base UDP port for ML (default={DEFAULT_BASE_PORT})")
parser.add_argument("-W", "--workers", default=DEFAULT_WORLD, type=int,
                    help=f"number of workers. Must be >= {DEFAULT_WORLD} (default={DEFAULT_WORLD})")
parser.add_argument("-D", "--device", default=DEFAULT_DEVICE, metavar="mac|ip|port",
                    help=f"Switch aggregator info (default={DEFAULT_DEVICE})")


parser.add_argument("-j", "--threads", default=1, type=int,
                    help="number of threads (default=1)")
parser.add_argument("-w", "--window", default=1, type=int,
                    help="per thread burst window (default=1)")
parser.add_argument("-t", "--timeout", default=0, type=float,
                    help="packet loss timeout in seconds")

parser.add_argument("--steps", default=DEFAULT_TIMEOUT, type=int,
                    help=f"how many training steps to perform (default={DEFAULT_TIMEOUT})")
parser.add_argument("--multiplier", default=1, type=int,
                    help="multiply the vector size (default=1)")
parser.add_argument("--starting-version", default=0,
                    choices=[0, 1], type=int, help="override default starting version")
parser.add_argument("--random", action="store_true",
                    help="Generate random values")
parser.add_argument("--drop-mode", type=int, default=0, choices=[0, 1, 2, 3],
                    help="simulate packet loss. (0) no drop, (1) ingress drop, (2) egress drop, (3) ingress+egress drop")
parser.add_argument("--drop-prob", default=10, choices=range(0, 101), type=int,
                    metavar="[0,100]", help="probability to drop a packet if --drop-mode > 0")
parser.add_argument("--perf", action="store_true", help="run in performance mode")
parser.add_argument("--config", metavar="config:worker", type=str,
                    help="override settings with configuration from config.json")
parser.add_argument("--warmup", metavar="steps", type=int, default=0,
                    help="number of warmup steps to perform (default=0)")
parser.add_argument("--profile", metavar="steps", type=int, default=0,
                    help="number of profile steps to perform (default=0)")
parser.add_argument("-mt", "--multithreading", default=False, action="store_true",
                    help="Use threads instead of processes")

opt = parser.parse_args()
opt.ip = get_first_ip() if opt.ip is None else opt.ip

if opt.config:
    print(f"Using configuration {opt.config} from config.json")
    cfg, w = opt.config.split(':')[0], opt.config.split(':')[1]
    with open('config.json') as f:
        c = json.load(f)[cfg]

    if cfg == 'asic':
        opt.ip = c['workers'][w]['ip']
    else:
        if opt.ip != c['workers'][w]['ip']:
            print(
                f"error: ip address {c['workers'][w]['ip']} from config.json not found in this server")
            sys.exit(1)
    opt.workers = c['active-workers']  # len(c['workers'])
    opt.rank = c['workers'][w]['rank']
    opt.port = c['udp-port-base']
    opt.dev_mac = c['device']['mac']
    opt.dev_ip = c['device']['ip']
    opt.dev_port = c['device']['port']

    # Allow the command line to override the config on those 3
    if "-j" not in sys.argv and "--threads" not in sys.argv:
        opt.threads = c['threads']
    if "-w" not in sys.argv and "--window" not in sys.argv:
        opt.window = c['burst']
    if "-t" not in sys.argv and "--timeout" not in sys.argv:
        opt.timeout = c['timeout']
else:
    opt.dev_mac = opt.device.split('|')[0] if opt.device.count(
        '|') else DEFAULT_DEVICE_MAC
    opt.dev_ip = opt.device.split(
        '|')[1] if opt.device.count('|') else DEFAULT_DEVICE_IP
    opt.dev_port = int(opt.device.split('|')[2]) if opt.device.count(
        '|') > 1 else DEFAULT_DEVICE_PORT

opt.reducers = 32
opt.values_per_packet = opt.reducers
opt.size = opt.threads * opt.window * opt.values_per_packet * opt.multiplier
opt.values_per_thread = opt.size // opt.threads
opt.packets_per_thread = opt.size // opt.threads // opt.values_per_packet
opt.slots = opt.threads * opt.window  # * opt.workers
opt.aggregators = 2 * opt.slots

if opt.ip is None:
    print("error: Could not find IP")
    sys.exit(1)
if opt.window > opt.packets_per_thread:
    print("warning: requested --window=%d too large. Setting to maximum --window=%d" %
          (opt.window, opt.packets_per_thread))
    opt.window = opt.packets_per_thread
if opt.drop_mode > 0 and opt.timeout == 0:
    print("warning: drop simulation enabled but --timeout=0. Setting default --timeout=1")
    opt.timeout = 1


def worker():
    return "[Worker.%d]" % opt.rank


def thread(tid):
    return "[Worker.%d.%d]" % (opt.rank, tid)


class Ncp(Packet):
    name = "Ncp"
    fields_desc = [
        XByteField("h_src", 0),
        XByteField("h_dst", 0),
        XByteField("d_src", 0),
        XByteField("d_dst", 0),
        XByteField("cid", 0),
        XByteField("act", 0),
        ShortField("act_arg", 0)
    ]


class Agg(Packet):
    name = "Agg"
    fields_desc = [
        XByteField("ver", 0),
        ShortField("bmp_idx", 0),
        ShortField("agg_idx", 0),
        IntField("mask", 0),
        IntField("offset", 0),
        IntField("expo", 0),
        FieldListField("vals", [], IntField("val", 0),
                       count_from=lambda p: opt.values_per_packet),
    ]

    def show(self, *args, **kwargs):
        print(f"###[ {self.name} ]###")
        for field in self.fields_desc:
            if field.name == "vals":
                vals = self.vals
                if len(vals) > 32:
                    vals_str = f"{vals[:4]}...[{len(vals)} elements]"
                else:
                    vals_str = str(vals)
                print(f"  {field.name}={vals_str}")
            else:
                print(f"  {field.name}={getattr(self, field.name)}")


NCP_HEADER_SIZE = 1 + 1 + 1 + 1 + 1 + 1 + 2
AGG_HEADER_SIZE = 1 + 2 + 2 + 4 + 4 + 4
AGG_VALUES_SIZE = opt.values_per_packet * 4
PACKET_SIZE = NCP_HEADER_SIZE + AGG_HEADER_SIZE + AGG_VALUES_SIZE

# Format: unsigned char (1 byte), two unsigned shorts (2 bytes each), three unsigned ints (4 bytes each)

# TODO: This worker assumes no packet loss!
# When we involve retransmissions we need to be checking that the
# incoming packet is the not stale, and ignore it otherwise
# Also, we cannot rely on the socket timeout. We need to do what
# SwitchML does and start opt.window timer threads. This is not
# very easy in python


def reliable_send_debug(tid, soc, addr, data, **kwargs):
    p = Agg(data[NCP_HEADER_SIZE:])
    pre = f"O.<{p.offset},{p.ver},{p.bmp_idx},{p.agg_idx}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} expo: {p.expo} ({len(data)}B)")

    return soc.sendto(data, addr)


def reliable_send(tid, soc, addr, data, **kwargs):
    return soc.sendto(data, addr)


def reliable_recv_debug(tid, soc):
    data, addr = soc.recvfrom(PACKET_SIZE)
    p = Agg(data[NCP_HEADER_SIZE:])
    pre = f"I.<{p.offset},{p.ver},{p.bmp_idx},{p.agg_idx}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} expo: {p.expo} ({len(data)}B)")
    return data, addr


def reliable_recv(tid, soc):
    return soc.recvfrom(PACKET_SIZE)


def reliable_recv_into_debug(tid, soc, buffer):
    sz, addr = soc.recvfrom_into(buffer, PACKET_SIZE)
    ver, bmp_idx, agg_idx, mask, offset, expo, vals = read_packet_agg(buffer)

    # p = Agg(buffer[NCP_HEADER_SIZE:])
    pre = f"I.<{offset},{ver},{bmp_idx},{agg_idx}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(vals, 16)} expo: {expo} ({sz}B)")
    return sz, addr


def reliable_recv_into(tid, soc, buffer):
    return soc.recvfrom_into(buffer, PACKET_SIZE)

def get_idx_range(opt, tid, maximum):
    start = tid * opt.values_per_thread
    return start,  min(maximum, start + opt.values_per_thread)


SEND = reliable_send if opt.perf else (unreliable_send_debug if (
    opt.drop_mode in [1, 3]) else reliable_send_debug)
RECV = reliable_recv if opt.perf else (unreliable_recv_debug if (
    opt.drop_mode in [2, 3]) else reliable_recv_debug)

RECV_INTO = reliable_recv_into if opt.perf else reliable_recv_into_debug

VERSIONS = multiprocessing.Array(
    ctypes.c_uint8, [opt.starting_version] * opt.threads, lock=False)

AGG_HEADER_FRMT = '!BHHIII'                            # <-- CONVERT BIG ENDIAN
AGG_VALUES_FRMT_OUT = 'I' * opt.values_per_packet   # <-- KEEP LITTLE ENDIAN
AGG_VALUES_FRMT_IN = 'I' * opt.values_per_packet    # <-- KEEP LITTLE ENDIAN

def create_ncp(buffer, h_src, h_dst, d_src, d_dst, cid, action, action_arg):
    buffer[0] = h_src
    buffer[1] = h_dst
    buffer[2] = d_src
    buffer[3] = d_dst
    buffer[4] = cid
    buffer[5] = action
    struct.pack_into('H', buffer, 6, action_arg)


def create_agg(buffer, ver, bmp_idx, agg_idx, mask, offset, expo, vals):
    """
    Pack the header and values into the buffer.

    :param buffer: The buffer to pack data into.
    :param ver: Version byte.
    :param bmp_idx: Bitmap index (short).
    :param agg_idx: Aggregation index (short).
    :param mask: Mask value (int).
    :param offset: Offset value (int).
    :param expo: Exponent value (int).
    :param vals: List of values (list of ints).
    :return: The buffer with packed data.
    """
    struct.pack_into(AGG_HEADER_FRMT, buffer, NCP_HEADER_SIZE, ver,
                     bmp_idx, agg_idx, mask, offset, expo)
    struct.pack_into(AGG_VALUES_FRMT_OUT, buffer,
                     NCP_HEADER_SIZE + AGG_HEADER_SIZE, *vals)
    # buffer[NCP_HEADER_SIZE + AGG_HEADER_SIZE:] = vals;


def read_packet_ncp(buffer):
    return buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5], struct.unpack_from('H', buffer, 6)[0]


def read_packet_agg(buffer):
    ver, bmp_idx, agg_idx, mask, offset, expo = struct.unpack_from(
        AGG_HEADER_FRMT, buffer, NCP_HEADER_SIZE)
    vals = struct.unpack_from(AGG_VALUES_FRMT_IN, buffer,
                              NCP_HEADER_SIZE + AGG_HEADER_SIZE)
    return ver, bmp_idx, agg_idx, mask, offset, expo, vals


def read_packet_agg_ver(buffer):
    return buffer[NCP_HEADER_SIZE + 0]


def read_packet_agg_bmp_idx(buffer):
    return struct.unpack_from('>H', buffer, NCP_HEADER_SIZE + 1)[0]
    # return int.from_bytes(buffer[1:3], byteorder='big', signed=False)


def read_packet_agg_offset(buffer):
    return struct.unpack_from('>I', buffer, NCP_HEADER_SIZE + 9)[0]
    # return int.from_bytes(buffer[9:13], byteorder='big', signed=False)


def socket_worker(opt, tid, data):

    # os.sched_setaffinity(os.getpid(), {os.getpid() % 24})ss

    soc = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
    soc.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF,
                   min(soc.getsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF), opt.window * PACKET_SIZE * 2))
    soc.bind((opt.ip, opt.port + tid))

    device = (opt.dev_ip, opt.dev_port)
    start, end = get_idx_range(opt, tid, len(data))

    mask = 1 << (opt.rank - 1)
    starting_ver = VERSIONS[tid]
    starting_slot = tid * opt.window

    # Just fix the value of the exponent for now. Normally,
    # we would need to compute it based on per-packet values
    expo = random.randint(1, 50) if opt.random else opt.rank

    # create packets for burst
    # base_packet = Agg(mask=mask, expo=expo)

    window = [bytearray(PACKET_SIZE) for _ in range(max(opt.window, 2))]

    # window = []
    for i in range(opt.window):
        lo = start + i * opt.values_per_packet
        hi = lo + opt.values_per_packet
        bmp_idx = starting_slot + i
        agg_idx = bmp_idx + starting_ver * opt.slots

        create_ncp(window[i], opt.rank, 0, 0, 1, 1, 0, 0)
        create_agg(window[i], starting_ver, bmp_idx,
                   agg_idx, mask, lo, expo, data[lo:hi])

        # p = Ncp(h_src=opt.rank, d_dst=1, cid=1) / Agg(ver=starting_ver, bmp_idx=bmp_idx,
        #                                               agg_idx=agg_idx, mask=mask, offset=lo, expo=expo, vals=list(data[lo:hi]))
        # create_packet(window[i], starting_ver, bmp_idx, agg_idx, mask, lo, expo, list(data[lo:hi]))

    # #send burst
    for i in range(opt.window):
        soc.sendto(window[i], device)
        # SEND(tid, soc, device, p)

    out_p = window[0]
    in_p = window[1]
    # in_p = bytearray(PACKET_SIZE)

    received = 0
    offset_by = opt.window * opt.values_per_packet

    while True:
        RECV_INTO(tid, soc, in_p)
        # soc.recv_into(in_p, PACKET_SIZE)

        received += opt.values_per_packet

        in_ver = read_packet_agg_ver(in_p)
        in_offset = read_packet_agg_offset(in_p)
        in_bmp_idx = read_packet_agg_bmp_idx(in_p)

        if received >= opt.values_per_thread:
            VERSIONS[tid] = 1 - in_ver
            break

        lo = in_offset + offset_by
        if lo >= end:
            # this is possible only if e.g. we receive packets
            # with high idx within the window, before packets
            # with lower idx, so the new offset we compute
            # goes out of bounds on this threads idx range
            continue

        hi = lo + opt.values_per_packet
        ver = 1 - in_ver
        bmp_idx = in_bmp_idx
        agg_idx = bmp_idx + ver * opt.slots

        # create_ncp(p, opt.rank, 0, 0, 1, 1, 0, 0)
        create_agg(out_p, ver, bmp_idx, agg_idx, mask, lo, expo, data[lo:hi])
        # SEND(tid, soc, device, out_p)
        soc.sendto(out_p, device)

    soc.close()


print(worker(), "World: %d" % opt.workers, "| IP: %s" % opt.ip, "| Ports: %d-%d" % (opt.port,
      opt.port + opt.threads - 1), "| %s: %d" % ("Threads" if opt.multithreading else "Processes", opt.threads))
print(worker(), "Device: %s:%s | Reducers: %d | Slots: %d" %
      (opt.dev_ip, opt.dev_port, opt.reducers, opt.slots))
print(worker(), "Packet loss simulation: %s" % (["None", "ingress", "egress", "ingress/egress"][opt.drop_mode]),
      ("%d%%" % opt.drop_prob) if opt.drop_mode > 0 else "")
print(worker(), "Values: %d" % opt.size, "(x%d)," % opt.multiplier, "PerPkt: %d," % opt.values_per_packet,
      "PerTid: %d" % opt.values_per_thread, "| Pkt/Tid: %d" % opt.packets_per_thread, ", Burst: %d" % opt.window)
print(worker())


def AllReduce(opt, data):
    if opt.multithreading:
        threads = [threading.Thread(name="t%d" % tid, target=socket_worker, args=(opt, tid, data,))
                   for tid in range(opt.threads)]
    else:
        threads = [multiprocessing.Process(name="p%d" % pid, target=socket_worker, args=(
            opt, pid, data)) for pid in range(opt.threads)]

    start = time.time()
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    return time.time() - start


if __name__ == "__main__":
    if opt.warmup:
        # DATA = multiprocessing.Array(ctypes.c_uint32, [random.randint(1, 50) for _ in range(
        #     opt.size)] if opt.random else ([opt.rank] * opt.size), lock=False)
        DATA = np.random.randint(
            1, 50, size=opt.size, dtype=ctypes.c_uint32) if opt.random else np.full(opt.size, opt.rank, dtype=ctypes.c_uint32)

        for s in range(opt.warmup):
            print(worker(), f"Running warmup step {s + 1}...")
            AllReduce(opt, DATA)
        print(worker())
    print(worker(), f"Starting versions: {list(VERSIONS)}")

    avg_t = 0
    avg_r = 0
    for s in range(opt.steps):
        # DATA = multiprocessing.Array(ctypes.c_uint32, [random.randint(1, 50) for _ in range(
        #     opt.size)] if opt.random else ([opt.rank] * opt.size), lock=False)

        DATA = np.random.randint(
            1, 50, size=opt.size, dtype=ctypes.c_uint32) if opt.random else np.full(opt.size, opt.rank, dtype=ctypes.c_uint32)

        if not opt.perf:
            print(worker())
            print(worker(), "AllReduce #%d |" % (s + 1), head(DATA))
            print(worker())

        t = AllReduce(opt, DATA)
        r = (len(DATA) * opt.workers) / t
        avg_t += t
        avg_r += r
        print(worker(),
              f"AllReduce {len(DATA) * opt.workers} | ({len(DATA)}/{len(DATA) * 4}B per worker) : {int(t)}:{int((t % 1) * 1000):03d} seconds, {r:.2f} values/second")
        # print(worker(), "next versions:", list(VERSIONS))
    avg_t /= opt.steps
    avg_r /= opt.steps
    print(worker())
    print(worker(),
          f"Average time over {opt.steps} runs: {int(avg_t)}:{int((avg_t % 1) * 1000):03d} seconds")
    print(worker())
    print(worker(),
          f"Average aggregation throughput {avg_r:.2f} values/s")
