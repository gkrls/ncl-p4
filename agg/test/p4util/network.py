import json
import os
import sys
import pprint
from  ipaddress import IPv4Address
from p4utils.mininetlib.network_API import NetworkAPI

sys.path.append(os.path.join(os.path.dirname(
    os.path.abspath(__file__)), '..', '..', 'src', 'host'))

from p4utils_extra import *
from color import *

COL_BOLD = '\033[1m'
COL_END = '\033[0m'

if len(sys.argv) < 3:
    print("usage: python network.py SDE_PATH CONFIG_JSON")
    sys.exit(1)

SDE = os.path.abspath(sys.argv[1])
SDE_INSTALL = os.path.join(SDE, "install")
SRC = os.path.join(os.path.dirname(sys.argv[0]), "..", "..", "src")
CFG = sys.argv[2]

if not os.path.exists(SDE):
    print("error: could not find Tofino SDE at '%s'" % SDE)
    sys.exit(1)
if not os.path.exists(SDE_INSTALL):
    print("error: could not find %s/install" % SDE)
    sys.exit(1)
if not os.path.exists(CFG):
    print("error: %s does not exists", CFG)
    sys.exit(1)

with open(CFG, 'r') as f:
    CFG = json.load(f)


print_bold("Running with config:", Color.CYAN,
           True, lambda: pprint.pprint(CFG))
print_bold("Configuring network", Color.CYAN, True)

net = NetworkAPI()

CompilerClass = Tofino1P4C if CFG["switch"]['tofino'] == 1 else Tofino2P4C

s1 = net.addTofino(CFG['switch']['name'], sde=SDE, sde_install=SDE_INSTALL, mac=CFG['switch']['mac'],
              ip=CFG['switch']['ip'], cls=Tofino1 if CFG['switch']['tofino'] == 1 else Tofino2)

#  cls=Tofino1 if CFG['switch']['tofino'] == 1 else Tofino2


net.setCompiler(compilerClass=CompilerClass, sde=SDE, sde_install=SDE_INSTALL)
net.setP4Source(CFG['switch']['name'], os.path.join(SRC, CFG['switch']['program']))

for p, nodes in CFG['switch']['ports'].items():
    for node in nodes:
        net.addHost(node['name'], ip=node['ip'])
        net.addLink(node['name'], CFG['switch']['name'], port2=int(p), port1=0, addr1=node['mac'])

# Network general options
net.setLogLevel('info')
net.disableCli()
net.enableLogAll(log_dir=os.path.join(os.path.dirname(__file__), 'logs'))
net.enablePcapDumpAll(pcap_dir=os.path.join(os.path.dirname(__file__), 'logs'))
net.enableDebugger("s1")
net.printPortMapping()

print_bold("Starting network (p4util output follows)", Color.CYAN, True)
net.startNetwork()

print_bold("Applying workarounds for switch endpoint", Color.CYAN, True)
for p, nodes in CFG['switch']['ports'].items():
    for node in nodes:
        h = net.net.get(node['name'])
        # print(h.intfs)
        sw_net = IPv4Address(IPv4Address(CFG['switch']['ip']).packed[:3] + bytes([0]))
        route_cmd = "ip route add %s/24 dev %s" % (sw_net, h.intfs[0].name)
        arp_cmd = "arp -s %s %s" % (CFG['switch']['ip'], CFG['switch']['mac'])

        print("  %s: %s" % (node['name'], route_cmd))
        h.cmd(route_cmd)
        print("  %s: %s" % (node['name'], arp_cmd))
        h.cmd(arp_cmd)

print_bold("Starting mininet CLI", Color.CYAN, True)
net.start_net_cli()
