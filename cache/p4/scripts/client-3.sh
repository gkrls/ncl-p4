
../client -I 42.0.0.1 -p 4242 --server-port 4242 -j 8 --multiplier 1024 > time1.txt 2>&1 &
pid1=$!  # Capture the PID of the first process

# Start the second process in the background
../client -I 42.0.0.1 -p 4342 --server-port 4342 -j 8 --multiplier 1024 > time2.txt 2>&1 &
pid2=$!  # Capture the PID of the second process

# Start the third process in the background
../client -I 42.0.0.1 -p 4442 --server-port 4442 -j 8 --multiplier 1024 > time3.txt 2>&1 &
pid3=$!  # Capture the PID of the second process
# pid3=$!  # Capture the PID of the third process

# Wait for all processes to finish
wait $pid1
cat time1.txt
wait $pid2
cat time2.txt
wait $pid3
cat time3.txt