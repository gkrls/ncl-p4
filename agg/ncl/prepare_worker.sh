#!/bin/bash

N=16
M=1024
INTERFACE="ens4f0"

# Base UDP port and IP address for the server
BASE_PORT=4242
WORKER_IP=$1

# Path to the server executable
CLIENT_EXECUTABLE="./worker3"

if [ "$1" == "kill" ]; then
    pkill -f $CLIENT_EXECUTABLE
    echo "Killed all $CLIENT_EXECUTABLE processes."
    filter_ids=$(sudo ethtool -u $INTERFACE | grep "Filter: " | awk '{print $2}')
    # Delete each filter
    for id in $filter_ids; do
        sudo ethtool -U $INTERFACE delete $id
        echo "Deleted filter ID: $id"
    done
    sudo ethtool -K ens4f0 ntuple off
    exit 0
fi

sudo ethtool -K ens4f0 ntuple on

# Loop to set up n-tuple rules and start processes
for i in $(seq 0 $((N - 1))); do
    # Calculate the UDP port for this core
    PORT=$((BASE_PORT + i))

    # Set up the n-tuple rule to direct traffic for this port to the RX queue corresponding to this core
    sudo ethtool -U $INTERFACE flow-type udp4 dst-ip $CLIENT_IP dst-port $PORT action $i

    # Start the server process, binding it to the specific core using taskset
    # taskset -c $i $CLIENT_EXECUTABLE --ip $CLIENT_IP --port $PORT -m $M --server-port $PORT > client.$i.txt &

    echo "Started process on core $i, handling UDP port $PORT"
done

echo "All processes started and n-tuple rules configured."

# By default freq scaling is on a balanced more. Make it go full out
sudo echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

sudo ethtool -K $INTERFACE rx-udp-gro-forwarding on
sudo ethtool -K $INTERFACE rx-checksum on
sudo ethtool -K $INTERFACE tx-checksum-ip-generic on
sudo ethtool -K $INTERFACE tx-scatter-gather on
# sudo ethtool -K $INTERFACE rx-gro on
sudo ethtool -C $INTERFACE adaptive-rx on adaptive-tx on
sudo ethtool -L $INTERFACE combined 24