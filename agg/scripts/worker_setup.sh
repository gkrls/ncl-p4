if [ $# -eq 0 ]
  then
    echo "usage: worker_ip.sh <rank>"
fi

IFACE=ens4f1

if [ "$1" -eq 1 ] || [ "$1" -eq 2 ]; then
  IFACE=ens5f1
fi

WORKER_IP=10.0.1.$1/24
SWITCH_NET=42.42.42.0/24

ip addr add 10.0.1.$1/24 dev $IFACE
ip route add 42.42.42.0/24 dev $IFACE