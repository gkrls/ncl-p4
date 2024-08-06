from scapy.all import Ether, IP, UDP, Packet, bind_layers, XByteField, IntField, ShortField, FieldListField

import argparse
import socket
import random
import threading
import os
import sys


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


parser = argparse.ArgumentParser()

ML_DEV_ETH = "42:42:42:42:42:42"
ML_DEV_IP = "42.42.42.42"
ML_DEV_PORT = 4242
ML_DEVICE = "%s|%s|%d" % (ML_DEV_ETH, ML_DEV_IP, int(ML_DEV_PORT))
ML_BASE_PORT = 4242
ML_TIMEOUT = 1
ML_MAX_JOBS = 1

parser.add_argument(
    "rank", type=int, help="worker rank. Must be in [1, --workers]")
parser.add_argument("-N", "--workers", default=2,
                    help="number of workers (default=2)")
parser.add_argument("-D", "--device", default="%s" % ML_DEVICE, metavar="mac|ip|port",
                    help="Switch aggregator info (default=%s)" % ML_DEVICE)
parser.add_argument("-P", "--port", default=ML_BASE_PORT, type=int,
                    help="Base UDP port for ML (default=%d)" % ML_BASE_PORT)
parser.add_argument("-t", "--threads", default=1, type=int,
                    help="number of threads (default=1)")
parser.add_argument("-s", "--steps", default=1, type=int,
                    help="how many training steps to perform (default=1)")
parser.add_argument("-w", "--window", default=1, type=int,
                    help="per thread burst window (default=1)")
parser.add_argument("-m", "--multiplier", default=1, type=int,
                    help="multiply the vector size (default=1)")
parser.add_argument("--starting-version", default=0,
                    choices=[0, 1], type=int, help="override default starting version")
parser.add_argument("--timeout", default=0, type=float,
                    help="packet loss timeout in seconds")
parser.add_argument("--random", action="store_true",
                    help="Generate random values")
parser.add_argument("--drop-mode", type=int, default=0, choices=[0, 1, 2, 3],
                    help="simulate packet loss. (0) no drop, (1) ingress drop, (2) egress drop, (3) ingress+egress drop")
parser.add_argument("--drop-prob", default=10, choices=range(0, 101), type=int,
                    metavar="[0,100]", help="probability to drop a packet if --drop-mode > 0")


opt = parser.parse_args()
opt.dev_mac = opt.device.split('|')[0] if opt.device.count('|') else ML_DEV_ETH
opt.dev_ip = opt.device.split('|')[1] if opt.device.count('|') else ML_DEV_IP
opt.dev_port = int(opt.device.split('|')[2]) if opt.device.count(
    '|') > 1 else ML_DEV_PORT
opt.reducers = 32
opt.values_per_packet = opt.reducers
opt.size = opt.threads * opt.values_per_packet * opt.multiplier
opt.values_per_thread = opt.size // opt.threads
opt.packets_per_thread = opt.size // opt.threads // opt.values_per_packet
opt.ip = get_first_ip()
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


def unreliable_send(tid, soc, addr, data, **kwargs):
    p = Agg(data)
    simulate_drop = random.randint(1, 100) < opt.drop_prob
    retransmission = 'is_retransmission' in kwargs and kwargs['is_retransmission']
    pre = f"O{'.RE' if retransmission else ''}{'.INGRESS-DROP' if simulate_drop else ''}.<{p.offset},{p.bmp_idx},{p.ver}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} ({len(data)}B)")

    return len(p) if simulate_drop else soc.sendto(data, addr)


def unreliable_recv(tid, soc):
    data, addr = soc.recvfrom(1024)
    p = Agg(data)
    simulate_drop = random.randint(1, 100) < opt.drop_prob
    pre = f"I{'.EGRESS-DROP' if simulate_drop else ''}.<{p.offset},{p.bmp_idx},{p.ver}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} ({len(data)}B)")
    if simulate_drop:
        raise socket.timeout
    return data, addr


def reliable_send(tid, soc, addr, data, **kwargs):
    p = Agg(data)
    pre = f"O.<{p.offset},{p.bmp_idx},{p.ver}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} ({len(data)}B)")
    return soc.sendto(data, addr)


def reliable_recv(tid, soc):
    data, addr = soc.recvfrom(1024)
    p = Agg(data)
    pre = f"I.<{p.offset},{p.bmp_idx},{p.ver}>"
    print(thread(tid),
          f"{pre}{' ' * (32 - len(pre))}:{head(p.vals, 16)} ({len(data)}B)")
    return data, addr


SEND = unreliable_send if (opt.drop_mode in [1, 3]) else reliable_send
RECV = unreliable_recv if (opt.drop_mode in [2, 3]) else reliable_recv

# Keep track of the last version of the slots we used
VERSION = [opt.starting_version] * opt.threads
SOCKETS = [socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
           for _ in range(opt.threads)]

for i, soc in enumerate(SOCKETS):
    soc.bind((opt.ip, opt.port + i))
    if opt.timeout > 0:
        soc.settimeout(opt.timeout)


def socket_worker(opt, tid, soc, data):
    global VERSION
    port = soc.getsockname()[1]
    device = (opt.dev_ip, opt.dev_port)
    start = tid * opt.values_per_thread
    end = min(len(data), start + opt.values_per_thread)

    version = VERSION[tid]
    slot = tid * opt.window

    print(thread(tid),
          f"Starting slot: {slot}, Range: [{start}:{end}], Port: {port}")

    for i in range(opt.packets_per_thread):
        lo = start + i * opt.values_per_packet
        hi = lo + opt.values_per_packet

        bmp_idx = slot
        agg_idx = slot + version * opt.aggregators

        p = Agg(ver=version, bmp_idx=bmp_idx, agg_idx=agg_idx, mask=1 << (opt.rank - 1),
                offset=lo, vals=data[lo:hi])

        re = False
        while True:
            SEND(tid, soc, device, bytes(p), is_retransmission=re)
            try:
                in_data, src = RECV(tid, soc)
                agg = Agg(in_data)

                if agg.offset != lo:
                    print(thread(tid), f"I.<{agg.offset},{agg.bmp_idx},{agg.ver}> WRONG_OFFSET: expected {lo}")
                    re = True
                    continue
                if agg.ver != version:
                    print(thread(tid), f"I.<{agg.offset},{agg.bmp_idx},{agg.ver}> WRONG_VERSION: expected {version}")
                    re = True
                    continue
                break
            except socket.timeout:
                re = True
                continue

            except Exception as e:
                print(thread(tid), "in_data: ",
                      None if not in_data else ("\n" + hexdump(in_data)))
                raise e

        version = 1 - version

    VERSION[tid] = version


print(worker(), "World: %d" % opt.workers, "| IP: %s" % get_first_ip(),
      "| Ports: %d-%d" % (opt.port, opt.port + opt.threads - 1), "| Threads: %d" % opt.threads)
print(worker(), "Device: %s:%s | Reducers: %d" % (opt.dev_ip, opt.dev_port, opt.reducers))
print(worker(), "Packet loss simulation: %s" % (["None", "ingress", "egress", "ingress/egress"][opt.drop_mode]),
      ("%d%%" % opt.drop_prob) if opt.drop_mode > 0 else "")
print(worker(), "Values: %d" % opt.size, "(x%d)," % opt.multiplier, "PerPkt: %d," % opt.values_per_packet,
      "PerTid: %d" % opt.values_per_thread, "| Pkt/Tid: %d" % opt.packets_per_thread, ", Burst: %d" % opt.window)

def AllReduce(opt, data):
    threads = [threading.Thread(name="t%d" % tid, target=socket_worker, args=(opt, tid, SOCKETS[tid], data,))
               for tid in range(opt.threads)]
    for t in threads:
        t.start()
    for t in threads:
        t.join()


if __name__ == "__main__":
    for s in range(opt.steps):
        data = ([random.randint(1, 50) for _ in range(opt.size)]) if opt.random \
            else ([opt.rank] * opt.size)
        print(worker())
        print(worker(), "AllReduce #%d |" % (s + 1), head(data))
        print(worker())
        AllReduce(opt, data)
