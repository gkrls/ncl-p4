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
parser.add_argument("-N", "--workers", default=DEFAULT_WORLD,
                    help=f"number of workers. Must be >= {DEFAULT_WORLD} (default={DEFAULT_WORLD})")
parser.add_argument("-D", "--device", default=DEFAULT_DEVICE, metavar="mac|ip|port",
                    help=f"Switch aggregator info (default={DEFAULT_DEVICE})")
parser.add_argument("-P", "--port", default=DEFAULT_BASE_PORT, type=int,
                    help=f"Base UDP port for ML (default={DEFAULT_BASE_PORT})")

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
parser.add_argument("--perf", action="store_true",
                    help="run in performance mode")
parser.add_argument("--config", metavar="config:worker", type=str,
                    help="override settings with configuration from config.json")
parser.add_argument("--warmup", metavar="steps", type=int, default=0,
                    help="number of warmup steps to perform (default=0)")


opt = parser.parse_args()
opt.ip = get_first_ip()

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
    opt.workers = len(c['workers'])
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
opt.slots = opt.threads * opt.window * opt.workers
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


def worker():
    return "[Worker.%d]" % opt.rank


def thread(tid):
    return "[Worker.%d.%d]" % (opt.rank, tid)


def unreliable_send_debug(tid, soc, addr, data, **kwargs):
    p = Agg(data)
    simulate_drop = random.randint(1, 100) < opt.drop_prob
    retransmission = 'is_retransmission' in kwargs and kwargs['is_retransmission']
    pre = f"O{'.RE' if retransmission else ''}{'.INGRESS-DROP' if simulate_drop else ''}.<{p.offset},{p.ver},{p.bmp_idx},{p.agg_idx}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} expo: {p.expo} ({len(data)}B)")

    return len(p) if simulate_drop else soc.sendto(data, addr)


def unreliable_recv_debug(tid, soc):
    data, addr = soc.recvfrom(1024)
    p = Agg(data)
    simulate_drop = random.randint(1, 100) < opt.drop_prob
    pre = f"I{'.EGRESS-DROP' if simulate_drop else ''}.<{p.offset},{p.ver},{p.bmp_idx},{p.agg_idx}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} expo: {p.expo} ({len(data)}B)")
    if simulate_drop:
        raise socket.timeout
    return data, addr


def reliable_send_debug(tid, soc, addr, data, **kwargs):
    p = Agg(data)
    pre = f"O.<{p.offset},{p.ver},{p.bmp_idx},{p.agg_idx}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} expo: {p.expo} ({len(data)}B)")

    return soc.sendto(data, addr)


def reliable_recv_debug(tid, soc):
    data, addr = soc.recvfrom(1024)
    p = Agg(data)
    pre = f"I.<{p.offset},{p.ver},{p.bmp_idx},{p.agg_idx}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} expo: {p.expo} ({len(data)}B)")
    return data, addr


def reliable_recv(tid, soc):
    return soc.recvfrom(1024)


def reliable_send(tid, soc, addr, data, **kwargs):
    return soc.sendto(data, addr)


def expected_packet(tid, in_data, offset):
    agg = Agg(in_data)
    if agg.offset != offset:
        print(thread(
            tid), f"I.<{agg.offset},{agg.bmp_idx},{agg.ver}> WRONG_OFFSET: expected {offset}")
        return False, agg.offset, agg.ver
    # if agg.ver != version:
    #     print(thread(
    #         tid), f"I.<{agg.offset},{agg.bmp_idx},{agg.ver}> WRONG_VERSION: expected {version}")
    #     return False, agg.ver, agg.offset

    return True, agg.offset, agg.ver


def expected_packet_perf(tid, in_data, offset):
    got_version = in_data[0]
    got_offset = int.from_bytes(in_data[9:13], byteorder='big', signed=False)
    return (got_version == version) and (got_offset == offset), got_offset, got_version


def get_packet_ver(in_data):
    return in_data[0]


def get_packet_offset(in_data):
    return int.from_bytes(in_data[9:13], byteorder='big', signed=False)


def get_packet_bmp_idx(in_data):
    return int.from_bytes(in_data[1:3], byteorder='big', signed=False)

# def get_packet_info(in_data):
#     return int.from_bytes(in_data[9:13], byteorder='big', signed=False), in_data[0]


SEND = reliable_send if opt.perf else (unreliable_send_debug if (
    opt.drop_mode in [1, 3]) else reliable_send_debug)
RECV = reliable_recv if opt.perf else (unreliable_recv_debug if (
    opt.drop_mode in [2, 3]) else reliable_recv_debug)
EXPECTED = expected_packet_perf if opt.perf else expected_packet

# Keep track of the last version of the slots we used
# VERSION = [opt.starting_version] * opt.threads
# SOCKETS = [socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
#            for _ in range(opt.threads)]
# for i, soc in enumerate(SOCKETS):
#     soc.bind((opt.ip, opt.port + i))
# if opt.timeout > 0:
#     soc.settimeout(opt.timeout)


def get_idx_range(opt, tid, maximum):
    start = tid * opt.values_per_thread
    return start,  min(maximum, start + opt.values_per_thread)

# TODO: This worker assumes no packet loss!
# When we involve retransmissions we need to be checking that the
# incoming packet is the not stale, and ignore it otherwise
# Also, we cannot rely on the socket timeout. We need to do what
# SwitchML does and start opt.window timer threads. This is not
# very easy in python


VERSIONS = multiprocessing.Array('i', [opt.starting_version] * opt.threads)


def socket_worker(opt, tid, data):
    # global VERSION
    # print(thread(tid), "STARTING VERSION: ", version.value)
    soc = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
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
    window = []
    for i in range(opt.window):
        lo = start + i * opt.values_per_packet
        hi = lo + opt.values_per_packet
        slot = starting_slot + i
        window.append(Agg(ver=starting_ver, bmp_idx=slot, agg_idx=slot,
                      mask=mask, offset=lo, expo=expo, vals=data[lo:hi]))

    # send burst
    for p in window:
        SEND(tid, soc, device, bytes(p))

    received = 0

    while True:
        in_data, _ = RECV(tid, soc)

        received += opt.values_per_packet

        in_ver = get_packet_ver(in_data)

        if received >= opt.values_per_thread:
            VERSIONS[tid] = 1 - in_ver
            break

        in_offset = get_packet_offset(in_data)

        lo = in_offset + opt.window * opt.values_per_packet
        if lo >= end:
            # this is possible only if e.g. we receive packets
            # with high idx within the window, before packets
            # with lower idx, so the new offset we compute
            # goes out of bounds on this threads idx range
            continue

        hi = lo + opt.values_per_packet
        ver = 1 - in_ver
        bmp_idx = get_packet_bmp_idx(in_data)
        agg_idx = bmp_idx + ver * opt.slots

        p = Agg(ver=ver, bmp_idx=bmp_idx, agg_idx=agg_idx,
                mask=mask, offset=lo, expo=expo, vals=data[lo:hi])

        SEND(tid, soc, device, bytes(p))

    soc.close()

    # for i in range(opt.packets_per_thread):
    #     lo = start + i * opt.values_per_packet
    #     hi = lo + opt.values_per_packet

    #     bmp_idx = slot
    #     agg_idx = slot + version * opt.aggregators

    #     p = Agg(ver=version, bmp_idx=bmp_idx, agg_idx=agg_idx, mask=1 << (opt.rank - 1),
    #             offset=lo, vals=data[lo:hi])

    #     re = False
    #     while True:
    #         SEND(tid, soc, device, bytes(p), is_retransmission=re)
    #         try:
    #             in_data, _ = RECV(tid, soc)
    #             # if not EXPECTED(tid, in_data, version, lo):
    #             #     raise socket.timeout
    #             while not EXPECTED(tid, in_data, version, lo):
    #                 print("unexpected")
    #                 in_data, _ = RECV(tid, soc)
    #             break
    #         except socket.timeout:
    #             re = True
    #             continue

    #         # except Exception as e:
    #         #     print(thread(tid), "in_data: ",
    #         #           None if not in_data else ("\n" + hexdump(in_data)))
    #         #     raise e
    #     version = 1 - version

    # VERSION[tid] = version


print(worker(), "World: %d" % opt.workers, "| IP: %s" % get_first_ip(),
      "| Ports: %d-%d" % (opt.port, opt.port + opt.threads - 1), "| Threads: %d" % opt.threads)
print(worker(), "Device: %s:%s | Reducers: %d | Slots: %d" %
      (opt.dev_ip, opt.dev_port, opt.reducers, opt.slots))
print(worker(), "Packet loss simulation: %s" % (["None", "ingress", "egress", "ingress/egress"][opt.drop_mode]),
      ("%d%%" % opt.drop_prob) if opt.drop_mode > 0 else "")
print(worker(), "Values: %d" % opt.size, "(x%d)," % opt.multiplier, "PerPkt: %d," % opt.values_per_packet,
      "PerTid: %d" % opt.values_per_thread, "| Pkt/Tid: %d" % opt.packets_per_thread, ", Burst: %d" % opt.window)
print(worker())


def AllReduce(opt, data):
    threads = [multiprocessing.Process(name="p%d" % pid, target=socket_worker, args=(
        opt, pid, data)) for pid in range(opt.threads)]
    # threads = [threading.Thread(name="t%d" % tid, target=socket_worker, args=(opt, tid, SOCKETS[tid], data,))
    #            for tid in range(opt.threads)]

    start = time.time()
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    return time.time() - start


if __name__ == "__main__":
    if opt.warmup:
        # print(worker(), f"Running {opt.warmup} warmup step{'s' if opt.warmup > 1 else ''}...")
        DATA = multiprocessing.Array('i', [random.randint(1, 50) for _ in range(
            opt.size)] if opt.random else ([opt.rank] * opt.size), lock=False)
        for s in range(opt.warmup):
            print(worker(), f"Running warmup step {s + 1}...")
            AllReduce(opt, DATA)
        print(worker())
    print(worker(), f"Starting versions: {list(VERSIONS)}")

    avg_t = 0
    avg_r = 0
    for s in range(opt.steps):
        # DATA = multiprocessing.Array('i', )
        DATA = multiprocessing.Array('i', [random.randint(1, 50) for _ in range(
            opt.size)] if opt.random else ([opt.rank] * opt.size), lock=False)

        if not opt.perf:
            print(worker(), "AllReduce #%d |" % (s + 1), head(DATA))
            print(worker())

        t = AllReduce(opt, DATA)
        r = (len(DATA) * opt.workers) / t
        avg_t += t
        avg_r += r
        print(worker(),
              f"AllReduce {len(DATA) * opt.workers}B: {int(t)}:{int((t % 1) * 1000)} seconds, {r:.2f} values/second")
        print(worker(), "next versions:", list(VERSIONS))
    avg_t /= opt.steps
    avg_r /= opt.steps
    print(worker())
    print(worker(),
          f"Average time over {opt.steps} runs: {int(avg_t)}:{int((avg_t % 1) * 1000):03d} seconds")
    print(worker())
    print(worker(),
          f"Average aggregation throughput {avg_r:.2f} values/s")
