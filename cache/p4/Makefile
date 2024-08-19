BUILD := $(shell pwd)/build
P4SRC := $(shell realpath "switch.p4")
P4NAME:= switch
P4CONF := switch.conf

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

asic: asic-compile
	tmux new -d -s switch
	tmux split-window -t switch:0 -v
	tmux send-keys -t switch.0 '${SDE}/run_bfshell.sh -b ${PWD}/bfrt-cli-asic.py' C-m
	tmux send-keys -t switch.1 'cd ${BUILD}/log && ${SDE}/run_switchd.sh -c ${BUILD}/${P4NAME}/${P4CONF} ' C-m
	tmux attach -t switch

asic-bfrt:
	${SDE}/run_bfshell.sh -b ${PWD}/bfrt-cli-asic.py

hpdc-setup-ips:
	ssh hpdc-gnode1 sudo ip addr replace 42.0.0.1/24 dev ens4f0
	ssh hpdc-gnode2 sudo ip addr replace 42.0.0.2/24 dev ens4f0
	ssh hpdc-gnode3 sudo ip addr replace 42.0.0.3/24 dev ens4f0
	ssh hpdc-gnode4 sudo ip addr replace 42.0.0.4/24 dev ens4f0

hpdc-setup-pull:
	ssh hpdc-gnode1 "cd ncl-p4 && git reset --hard && git pull"
	ssh hpdc-gnode2 "cd ncl-p4 && git reset --hard && git pull"
	ssh hpdc-gnode3 "cd ncl-p4 && git reset --hard && git pull"
	ssh hpdc-gnode4 "cd ncl-p4 && git reset --hard && git pull"

hpdc-setup-build:
	ssh hpdc-gnode1 "cd ncl-p4/cache/p4 && make -B client"
	ssh hpdc-gnode2 "cd ncl-p4/cache/p4 && make -B client"
	ssh hpdc-gnode3 "cd ncl-p4/cache/p4 && make -B client"
	ssh hpdc-gnode4 "cd ncl-p4/cache/p4 && make -B server"

hosts: client server
hosts-debug: client-debug server-debug

client: client.cpp client_utils.h
	g++ client.cpp -O3 -DNDEBUG -o client -lpthread

client-debug: client.cpp client_utils.h
	g++ client.cpp -g -o client -lpthread

server: server.cpp server_utils.h
	g++ server.cpp -O3 -o server -pthread

server-debug: server.cpp server_utils.h
	g++ -g -DDEBUG server.cpp -o server -pthread

clean:
	rm -rf ${BUILD}

build_dir: clean
	mkdir ${BUILD}
	mkdir ${BUILD}/log


