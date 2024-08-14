BUILD := $(shell pwd)/build
P4SRC := $(shell realpath "switch.p4")
P4NAME:= switch

# ifndef SDE
# $(error SDE is undefined)
# endif
# ifndef SDE_INSTALL
# $(error SDE_INSTALL is undefined)
# endif

switch-cli:
	mx s1 SDE=${SDE} SDE_INSTALL=${SDE}/install ${SDE}/run_bfshell.sh

mininet-bfrt:
	mx s1 SDE=${SDE} SDE_INSTALL=${SDE}/install ${SDE}/run_bfshell.sh -b ${PWD}/bfrt-cli-model.py

mininet-network: build_dir
	SDE=${SDE} cd ${BUILD} && sudo -E python3 ../network.py ${P4SRC}

asic-compile: build_dir
	${SDE_INSTALL}/bin/bf-p4c -b tofino -o ${BUILD}/${P4NAME} ${P4SRC}

hosts: client server
hosts-debug: client-debug server-debug

client: client.cpp client_utils.h
	g++ client.cpp -o client

client-debug: client.cpp client_utils.h
	g++ -g -DDEBUG client.cpp -o client

server: server.cpp server_utils.h
	g++ server.cpp -o server

server-debug: server.cpp server_utils.h
	g++ -g -DDEBUG server.cpp -o server


clean:
	rm -rf ${BUILD}

build_dir: clean
	mkdir ${BUILD}
	mkdir ${BUILD}/log


