#!/bin/bash

N=16
INTERFACE="ens4f0"


# Base UDP port and IP address
BASE_PORT=4242
SERVER_IP="42.0.0.4"

# Path to the server executable
SERVER_EXECUTABLE="./server"

if [ "$1" == "kill" ]; then
    pkill -f $SERVER_EXECUTABLE
    echo "Killed all $SERVER_EXECUTABLE processes."
    # Get all ntuple filter IDs
    filter_ids=$(sudo ethtool -u $INTERFACE | grep "Filter: " | awk '{print $2}')
    # Delete each filter
    for id in $filter_ids; do
        sudo ethtool -U $INTERFACE delete $id
        echo "Deleted filter ID: $id"
    done
    sudo ethtool -K $INTERFACE ntuple off
    exit 0
fi

sudo ethtool -K $INTERFACE ntuple on

# Loop to set up n-tuple rules and start processes
for i in $(seq 0 $((N - 1))); do
    # Calculate the UDP port for this core
    PORT=$((BASE_PORT + i))

    # Set up the n-tuple rule to direct traffic for this port to the RX queue corresponding to this core
    sudo ethtool -U $INTERFACE flow-type udp4 dst-ip $SERVER_IP dst-port $PORT action $i

    # Start the server process, binding it to the specific core using taskset
    taskset -c $i $SERVER_EXECUTABLE --port $PORT &

    echo "Started process on core $i, handling UDP port $PORT"
done

echo "All processes started and n-tuple rules configured."
