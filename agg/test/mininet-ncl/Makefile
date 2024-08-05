LOGDIR := $(shell pwd)/log
NCL_SRC:= $(shell realpath "../../src/ncl/allreduce.ncl")
P4_SRC:= ${LOGDIR}/allreduce.ncl.device.1.p4

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


network: compile-ncl
	SDE=${SDE} sudo -E python3 network.py ${P4_SRC}

compile-ncl: logdir
	@if [ -z "$$NCLANG" ]; then \
		echo "Error: NCLANG is not set"; \
		exit 1; \
	else \
		NCLANG_REALPATH=$$(realpath "$$NCLANG"); \
		echo "Resolved NCLANG path: $$NCLANG_REALPATH"; \
		$$NCLANG_REALPATH -ncc -ncl-is-device -ncl-target tna -ncl-device-id 1 \
			-mncvm --p4-no-switch-statements -mncvm --speculate=1 \
			-emit-asm ${NCL_SRC} -o ${P4_SRC};\
	fi

clean:
	rm -rf log
	rm -f topology.json

logdir: clean
	mkdir ${LOGDIR}


