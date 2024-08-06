from netaddr import IPAddress, EUI
import json

with open('config.json') as f:
    C = json.load(f)
    WORKERS = C['workers']
    JOBS = C['jobs']

def get_dport_from_fport(fp, ch=0):
    return bfrt.port.port_hdl_info.get(CONN_ID=fp, CHNL_ID=ch, print_ents=False).data[b'$DEV_PORT']

# clear multicast nodes/groups
if bfrt.pre.node.info(return_info=True, print_info=False)['usage']:
    for e in bfrt.pre.node.get(regex=True, return_ents=True, print_ents=False):
        e.remove()
if bfrt.pre.mgid.info(return_info=True, print_info=False)['usage']:
    for e in bfrt.pre.mgid.get(regex=True, return_ents=True, print_ents=False):
        e.remove()

IN = bfrt.switch.pipe.ingress
EG = bfrt.switch.pipe.egress

IN.net.forwarding_table.clear()
IN.net.arp_table.clear()
IN.agg.R00.R.clear()
IN.agg.R01.R.clear()
IN.agg.R02.R.clear()
IN.agg.R03.R.clear()
IN.agg.R04.R.clear()
IN.agg.R05.R.clear()
IN.agg.R06.R.clear()
IN.agg.R07.R.clear()
IN.agg.R08.R.clear()
IN.agg.R09.R.clear()
IN.agg.R10.R.clear()
IN.agg.R11.R.clear()
IN.agg.R12.R.clear()
IN.agg.R13.R.clear()
IN.agg.R14.R.clear()
IN.agg.R15.R.clear()
IN.agg.R16.R.clear()
IN.agg.R17.R.clear()
IN.agg.R18.R.clear()
IN.agg.R19.R.clear()
IN.agg.R20.R.clear()
IN.agg.R21.R.clear()
IN.agg.R22.R.clear()
IN.agg.R23.R.clear()
IN.agg.R24.R.clear()
IN.agg.R25.R.clear()
IN.agg.R26.R.clear()
IN.agg.R27.R.clear()
IN.agg.R28.R.clear()
IN.agg.R29.R.clear()
IN.agg.R30.R.clear()
IN.agg.R31.R.clear()
IN.agg.Count.clear()
IN.agg.Bitmap.clear()

EG.allreduce_sender.clear()

# Flooding
IN.net.forwarding_table.add_with_flood(dst_addr=EUI("ff:ff:ff:ff:ff:ff"))
bfrt.pre.node.entry(MULTICAST_NODE_ID=1, MULTICAST_RID=1,
                    MULTICAST_LAG_ID=[], DEV_PORT=worker_ports).push()
bfrt.pre.mgid.add(MGID=1, MULTICAST_NODE_ID=[1],
                  MULTICAST_NODE_L1_XID_VALID=[False], MULTICAST_NODE_L1_XID=[0])

# Allreduce job 1
IN.net.arp_table.add_with_arp_resolve(dst_proto_addr=IPAddress(JOBS['1']['ip']), mac=EUI(JOBS['1']['mac']))
for w in WORKERS:
    dport = get_dport_from_fport(WORKERS[w]['port'])
    mac, ip = EUI(WORKERS[w]['mac']), IPAddress(WORKERS[w]['ip'])
    IN.net.forwarding_table.add_with_send_to_port(dst_addr=mac, port=dport)
    EG.allreduce_sender.add_with_send_to_worker(egress_port=dport, mac=mac, ip=ip, mask=1 << (WORKERS[w]['rank'] - 1))
    print('  %s/%s -> %d (%s)' % (mac, ip, dport, w))

worker_ports = [get_dport_from_fport(w) for w in [int(w['port']) for w in WORKERS]] #range(1, NUM_WORKERS + 1)


# Multicast group for allreduce
bfrt.pre.node.entry(MULTICAST_NODE_ID=42, MULTICAST_RID=42,
                    MULTICAST_LAG_ID=[], DEV_PORT=worker_ports).push()
bfrt.pre.mgid.add(MGID=42, MULTICAST_NODE_ID=[42],
                  MULTICAST_NODE_L1_XID_VALID=[False], MULTICAST_NODE_L1_XID=[0])

print('  mgid %d -> %s' % (1, worker_ports))
print('  mgid %d -> %s' % (42, worker_ports))

bfrt.complete_operations()