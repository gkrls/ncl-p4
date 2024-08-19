./client2 -j 4 --server-port 4242 --server-ports 4  > client-1.log 2>&1 &
PID1=$!

./client2 -j 4 --server-port 4342 --server-ports 4  > client-2.log 2>&1 &
PID2=$!

./client2 -j 4 --server-port 4342 --server-ports 4  > client-3.log 2>&1 &
PID3=$!

# Wait for each process to finish
wait $PID1
wait $PID2
wait $PID3

# Display the output of each process
echo "Output of process 1:"
cat output1.log
echo

echo "Output of process 2:"
cat output2.log
echo

echo "Output of process 3:"
cat output3.log
echo

echo "All processes have finished."