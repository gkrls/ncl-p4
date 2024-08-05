LOGDIR := $(shell pwd)/log
NCL_SRC:= $(shell realpath "../../src/device-ncl/allreduce.ncl")
P4_SRC:= $(shell realpath "../../src/device-p4/main.p4")

switch-config:
	mx s1 SDE=${SDE} SDE_INSTALL=${SDE}/install ${SDE}/run_bfshell.sh -b ${PWD}/cli-pipe-config.py

switch-cli:
	mx s1 SDE=${SDE} SDE_INSTALL=${SDE}/install ${SDE}/run_bfshell.sh

tcpdump-switch:
	mx s1 xterm -title s1-eth1 -e sudo tcpdump -vvv -l -i s1-eth1 &
	mx s1 xterm -title s1-eth2 -e sudo tcpdump -vvv -l -i s1-eth2 &

tcpdump-hosts:
	mx w1 xterm -title w1 -e sudo tcpdump -vvv -l &
	mx w2 xterm -title w2 -e sudo tcpdump -vvv -l &

tcpdump: tcpdump-switch tcpdump-hosts

network:
	SDE=${SDE} sudo -E python3 network.py ${P4_SRC}

clean:
	rm -rf log
	rm -f topology.json

logdir: clean
	mkdir ${LOGDIR}


