./server -I 42.0.0.4 -p 4242 -j 96 &
pid1=$!  # Capture the PID of the first process

# Start the second process in the background
./client -I 42.0.0.4 -p 4342 -j 96 &
pid2=$!  # Capture the PID of the second process

# Start the third process in the background
./client -I 42.0.0.4 -p 4442 -j 96 &
pid3=$!  # Capture the PID of the second process
# pid3=$!  # Capture the PID of the third process

echo "Process 1 PID: $pid1"
echo "Process 2 PID: $pid2"
echo "Process 3 PID: $pid3"

# Wait for all processes to finish
wait $pid1
wait $pid2
wait $pid3