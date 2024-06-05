import json
import os
import sys
import pprint
from netaddr import IPAddress, EUI
from util.color import Color

CONFIG_JSON = sys.argv[1] if len(sys.argv) > 1 else "config.json"
CONFIG_JSON = os.path.join(os.path.dirname(os.path.abspath(__file__)), CONFIG_JSON)

with open(CONFIG_JSON, 'r') as f:
    cfg = json.load(f)
    sw = cfg['switch']

P4 = bfrt.agg_32_single.pipe

def configure_switch_endpoint():
    print(Color.BOLD + "Configuring switch as (ICMP/ARP) endpoint:" + Color.END)

    I_ARP = P4.Ingress.arp.arp_table
    I_ICMP = P4.Ingress.icmp.icmp_table

    err = None
    sw_mac = EUI(sw['mac'])
    sw_ip4 = IPAddress(sw['ip'])
    try:
        I_ICMP.add_with_respond(dst_addr=sw_ip4)
        I_ARP.add_with_resolve(dst_proto_addr=sw_ip4,mac=sw_mac)
    except Exception as e:
        err = e
    print("  %s -> %s (%s)" % (sw_mac, sw_ip4, "ok" if err is None else err))


def configure_switch_arp_resolver():
    print(Color.BOLD + "Configuring switch ARP resolver:" + Color.END)

    I_ARP = P4.Ingress.arp.arp_table

    for port in sw['ports']:
        for i, host in enumerate(sw['ports'][port]):
            err = None
            mac = EUI(host['mac'])
            ip4 = IPAddress(host['ip'])
            try:
                I_ARP.add_with_resolve(dst_proto_addr=ip4, mac=mac)
            except Exception as e:
                err = e
            print("  %s -> %s (%s)" % (mac, ip4, "ok" if err is None else err))

def configure_switch_forwarding():
    print(Color.BOLD + "Configuring switch forwarding:" + Color.END)

    I_FWD = P4.Ingress.forward.forwarding_table
    E_PORT = P4.Egress.port_table

    for port in sw['ports']:
        for i, host in enumerate(sw['ports'][port]):
            err = None
            mac = EUI(host['mac'])
            try:
                I_FWD.add_with_forward(dst_addr=mac, port=int(port))
                E_PORT.add_with_worker_port(egress_port=int(port), mac=mac, ip=IPAddress(host['ip']))
            except Exception as e:
                err = e
            prefix = ("port %s ->" % port) if i == 0 else (" " * len("port %s ->" % port))
            print("  %s %s [%s] (%s)" % (prefix, mac, host['name'], "ok" if err is None else err))


def configure_multicast():
    print(Color.BOLD + "Configuring multicast groups:" + Color.END)

    mg_node_ids = set()
    nid = 1
    rid = 1
    for mgid in sw['multicast']:
        ports = sw['multicast'][mgid]['ports']
        try :
            bfrt.pre.node.add(nid, rid, [], ports)
            bfrt.pre.mgid.add(int(mgid), [nid], [False], [0])
            rid = rid + 1
            nid = nid + 1
            print("  %2d ->" % int(mgid), ports, ", %s" % sw['multicast'][mgid]['desc'])
        except Exception as e:
            print(mgid, ports, e)


configure_switch_endpoint()
configure_switch_arp_resolver()
configure_switch_forwarding()
configure_multicast()

bfrt.complete_operations()