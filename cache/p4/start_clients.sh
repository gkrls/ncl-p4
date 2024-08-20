#!/bin/bash

INTERFACE="ens4f0"

# Base UDP port and IP address for the server
BASE_PORT=4242
CLIENT_IP="42.0.0.2"
SERVER_IP="42.0.0.4"

# Path to the server executable
CLIENT_EXECUTABLE="./client"

if [ "$1" == "kill" ]; then
    pkill -f $CLIENT_EXECUTABLE
    echo "Killed all $CLIENT_EXECUTABLE processes."
    sudo ethtool -U ens4f0 clear
    sudo ethtool -K ens4f0 ntuple off
    exit 0
fi

sudo ethtool -K ens4f0 ntuple on

# Loop to set up n-tuple rules and start processes
for i in $(seq 0 15); do
    # Calculate the UDP port for this core
    PORT=$((BASE_PORT + i))

    # Set up the n-tuple rule to direct traffic for this port to the RX queue corresponding to this core
    sudo ethtool -U $INTERFACE flow-type udp4 dst-ip $CLIENT_IP dst-port $PORT action $i

    # Start the server process, binding it to the specific core using taskset
    taskset -c $i $CLIENT_EXECUTABLE --ip $CLIENT_IP --port $PORT &

    echo "Started process on core $i, handling UDP port $PORT"
done

echo "All processes started and n-tuple rules configured."
