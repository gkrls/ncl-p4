LOGDIR := $(shell pwd)/log
P4_SRC:= $(shell realpath "switch.p4")

switch-cli:
	mx s1 SDE=${SDE} SDE_INSTALL=${SDE}/install ${SDE}/run_bfshell.sh

mininet-bfrt:
	mx s1 SDE=${SDE} SDE_INSTALL=${SDE}/install ${SDE}/run_bfshell.sh -b ${PWD}/bfrt-cli-model.py

mininet-network: clean
	SDE=${SDE} sudo -E python3 network.py ${P4_SRC}

clean:
	rm -rf build
	rm -rf log
	rm -f topology.json

logdir: clean
	mkdir ${LOGDIR}


