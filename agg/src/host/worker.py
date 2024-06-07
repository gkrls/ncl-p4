import argparse
import os
import sys
import json
from scapy.all import XByteField, ShortField, IntField, FieldListField
from scapy.all import Packet, Ether, IP, UDP
from scapy.all import bind_layers, srp1
import pprint
import psutil

parser = argparse.ArgumentParser()
parser.add_argument('-r', '--rank', required=True, type=int,
                    help="the worker's rank (1-based)")
parser.add_argument('-c', '--config', help="path to config.json. Absolute or relative to $PWD",
                    default=os.path.join(os.path.dirname(os.path.abspath(__file__)), "config.json"))
parser.add_argument('-i', '--iface', help="Interface to use (default=first available)", default=None)
ARGS = parser.parse_args()

print(ARGS.config)

# CONF = ARGS.config if os.path.isabs(ARGS.config) else os.path.join(
#     os.path.dirname(os.path.abspath(__file__)), ARGS.config)
# print(CONF)
with open(ARGS.config, 'r') as f:
    CONF = json.load(f)
RANK = ARGS.rank
MASK = 1 << (RANK - 1)


def get_first_available_interface():
  nics = psutil.net_if_addrs()
  return [k for k,v in nics.items() if k != 'lo'][0]

class AGG(Packet):
    name = "agg"
    fields_desc = [
        XByteField("ver", 0),
        ShortField("slot", 0),
        IntField("mask", 0),
        IntField("offset", 0),
        FieldListField("values", None, IntField("val", 0),
                       count_from=lambda p: CONF['slot_size'])
    ]

bind_layers(UDP, AGG, dport=CONF['udp_port'])

def run_scapy_allreduce(ver, data):
    print(" rank:", RANK)
    print(" mask:", "{0:032b}".format(MASK))
    print("  ver:", ver)
    print("input:", ",".join(map(str, data[0:5])), "...")
    print(" size:", len(data), '\n')

    p = Ether(dst=CONF['switch']['mac']) / \
        IP(dst=CONF['switch']['ip']) / UDP(sport=CONF['udp_port'], dport=CONF['udp_port'])

    slot_size = CONF['slot_size']
    iface = ARGS.iface if ARGS.iface is not None else get_first_available_interface()

    for slot, offset in enumerate(range(0, len(data), slot_size)):
        ver = 1 - ver
        p_out = p / AGG(ver=ver, slot=slot, mask=MASK,
                        offset=offset, values=data[offset: offset + slot_size])
        p_in = srp1(p_out, iface=get_first_available_interface(), verbose=0)
        print(" %d/%d" % (slot, offset), ",".join(map(str, p_in['agg'].values)), '...')
    print()

if __name__ == "__main__":
    if CONF['comm'] == 'scapy':
        data = [1] * 32 * 4
        run_scapy_allreduce(1, data)
        run_scapy_allreduce(0, data) # STARTING FROM DIFFERENT VERSION IS REALLY IMPORTANT!
        run_scapy_allreduce(1, data)
        run_scapy_allreduce(0, data) # STARTING FROM DIFFERENT VERSION IS REALLY IMPORTANT!
    else:
        print("error: %s communication not implemented yet")
