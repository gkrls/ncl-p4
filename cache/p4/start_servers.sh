#!/bin/bash

INTERFACE="ens4f0"

# Base UDP port and IP address for the server
BASE_PORT=4242
SERVER_IP="42.0.0.4"

# Path to the server executable
SERVER_EXECUTABLE="./server"

if [ "$1" == "kill" ]; then
    pkill -f $SERVER_EXECUTABLE
    echo "Killed all $SERVER_EXECUTABLE processes."
    exit 0
fi

# Loop to set up n-tuple rules and start processes
for i in $(seq 0 15); do
    # Calculate the UDP port for this core
    PORT=$((BASE_PORT + i))

    # Set up the n-tuple rule to direct traffic for this port to the RX queue corresponding to this core
    sudo ethtool -U $INTERFACE flow-type udp4 dst-ip $SERVER_IP dst-port $PORT action $i

    # Start the server process, binding it to the specific core using taskset
    taskset -c $i $SERVER_EXECUTABLE --port $PORT --core $i &

    echo "Started process on core $i, handling UDP port $PORT"
done

echo "All processes started and n-tuple rules configured."
