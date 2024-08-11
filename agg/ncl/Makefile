BUILD := $(shell pwd)/build
NCLSRC := $(shell realpath "allreduce-${WORKERS}.ncl")
P4SRC := $(shell realpath "allreduce-${WORKERS}.ncl.device.1.p4")
P4CONF := allreduce-${WORKERS}.ncl.device.1.conf
P4NAME:= p4_allreduce_${WORKERS}_ncl_device_1

compile-ncl:
	${NCLANG} -ncc -ncl-is-device -ncl-target tna -ncl-device-id 1 -ncl-implicit-drop -emit-asm \
	${NCLSRC} -o $(shell pwd)/allreduce-${WORKERS}.ncl.device.1.p4 \
	-mncvm --p4-no-switch-statements -mncvm --speculate=1 \
	-mncvm --ncp-host-reflect-implicit-src-addr -mncvm --ncp-host-multicast-implicit-src-addr \
	-mncvm --ncp-implicit-addr=42.0.0.0 -mncvm --ncp-udp-port=4242

mininet-bfshell:
	mx s1 SDE=${SDE} SDE_INSTALL=${SDE}/install ${SDE}/run_bfshell.sh

mininet-bfrt:
	mx s1 SDE=${SDE} SDE_INSTALL=${SDE}/install ${SDE}/run_bfshell.sh -b ${PWD}/bfrt-cli-model.py

mininet-network: build_dir
	SDE=${SDE} cd ${BUILD} && sudo -E python3 ../network.py

asic-compile: build_dir
	${SDE_INSTALL}/bin/bf-p4c -b tofino -o ${BUILD}/${P4NAME} ${P4SRC}


worker: worker.cpp worker_utils.h
	g++ -x c++ -g -std=c++17 -mavx2 -pthread worker.cpp -o worker

asic: asic-compile
	tmux new -d -s switch
	tmux split-window -t switch:0 -v
	tmux send-keys -t switch.0 '${SDE}/run_bfshell.sh -b ${PWD}/bfrt-cli-asic.py' C-m
	tmux send-keys -t switch.1 'cd ${BUILD}/log && ${SDE}/run_switchd.sh -c ${BUILD}/${P4NAME}/${P4CONF} ' C-m
	tmux attach -t switch

hpdc-2-servers-setup-ips:
	ssh hpdc-gnode1 sudo ip addr replace 42.0.0.1/24 dev ens4f0
	ssh hpdc-gnode2 sudo ip addr replace 42.0.0.2/24 dev ens4f0

hpdc-4-servers-setup-ips:
	ssh hpdc-gnode1 sudo ip addr replace 42.0.0.1/24 dev ens4f0
	ssh hpdc-gnode2 sudo ip addr replace 42.0.0.2/24 dev ens4f0
	ssh hpdc-gnode3 sudo ip addr replace 42.0.0.3/24 dev ens4f0
	ssh hpdc-gnode4 sudo ip addr replace 42.0.0.4/24 dev ens4f0

hpdc-6-servers-setup-ips:
	ssh hpdc-gnode1 sudo ip addr replace 42.0.0.1/24 dev ens4f0
	ssh hpdc-gnode2 sudo ip addr replace 42.0.0.2/24 dev ens4f0
	ssh hpdc-gnode3 sudo ip addr replace 42.0.0.3/24 dev ens4f0
	ssh hpdc-gnode4 sudo ip addr replace 42.0.0.4/24 dev ens4f0
	ssh hpdc-gnode5 sudo ip addr replace 42.0.0.5/24 dev ens4f0
	ssh hpdc-gnode6 sudo ip addr replace 42.0.0.6/24 dev ens4f0

hpdc-2-servers-setup-pull:
	ssh hpdc-gnode1 "cd ncl-p4 && git pull"
	ssh hpdc-gnode2 "cd ncl-p4 && git pull"

hpdc-4-servers-setup-pull:
	ssh hpdc-gnode1 "cd ncl-p4 && git pull"
	ssh hpdc-gnode2 "cd ncl-p4 && git pull"
	ssh hpdc-gnode3 "cd ncl-p4 && git pull"
	ssh hpdc-gnode4 "cd ncl-p4 && git pull"

hpdc-6-servers-setup-pull:
	ssh hpdc-gnode1 "cd ncl-p4 && git pull"
	ssh hpdc-gnode2 "cd ncl-p4 && git pull"
	ssh hpdc-gnode3 "cd ncl-p4 && git pull"
	ssh hpdc-gnode4 "cd ncl-p4 && git pull"
	ssh hpdc-gnode5 "cd ncl-p4 && git pull"
	ssh hpdc-gnode6 "cd ncl-p4 && git pull"


hpdc-2-servers-cpp-worker:
	ssh hpdc-gnode1 "cd ncl-p4/agg/ncl && make worker"
	ssh hpdc-gnode2 "cd ncl-p4/agg/ncl && make worker"

hpdc-4-servers-cpp-worker:
	ssh hpdc-gnode1 "cd ncl-p4/agg/ncl && make worker"
	ssh hpdc-gnode2 "cd ncl-p4/agg/ncl && make worker"
	ssh hpdc-gnode3 "cd ncl-p4/agg/ncl && make worker"
	ssh hpdc-gnode4 "cd ncl-p4/agg/ncl && make worker"

hpdc-6-servers-cpp-worker:
	ssh hpdc-gnode1 "cd ncl-p4/agg/ncl && make worker"
	ssh hpdc-gnode2 "cd ncl-p4/agg/ncl && make worker"
	ssh hpdc-gnode3 "cd ncl-p4/agg/ncl && make worker"
	ssh hpdc-gnode4 "cd ncl-p4/agg/ncl && make worker"
	ssh hpdc-gnode5 "cd ncl-p4/agg/ncl && make worker"
	ssh hpdc-gnode6 "cd ncl-p4/agg/ncl && make worker"

hpdc-2-servers-setup: hpdc-servers-setup-ips
	ssh hpdc-gnode1 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"
	ssh hpdc-gnode2 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"

hpdc-4-servers-setup: hpdc-servers-setup-ips
	ssh hpdc-gnode1 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"
	ssh hpdc-gnode2 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"
	ssh hpdc-gnode3 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"
	ssh hpdc-gnode4 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"

hpdc-6-servers-setup: hpdc-servers-setup-ips
	ssh hpdc-gnode1 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"
	ssh hpdc-gnode2 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"
	ssh hpdc-gnode3 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"
	ssh hpdc-gnode4 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"
	ssh hpdc-gnode5 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"
	ssh hpdc-gnode6 "rm -rf ncl-p4 && git clone https://github.com/gkrls/ncl-p4"


hpdc-4-servers-start:
	ssh hpdc-gnode1 "cd ncl-p4/agg/p4 && python3 worker.py --config asic:hpdc-gnode1 --steps 4 --multiplier 1024 --perf > out.txt" &
	ssh hpdc-gnode2 "cd ncl-p4/agg/p4 && python3 worker.py --config asic:hpdc-gnode2 --steps 4 --multiplier 1024 --perf > out.txt" &
	ssh hpdc-gnode3 "cd ncl-p4/agg/p4 && python3 worker.py --config asic:hpdc-gnode3 --steps 4 --multiplier 1024 --perf > out.txt" &
	ssh hpdc-gnode4 "cd ncl-p4/agg/p4 && python3 worker.py --config asic:hpdc-gnode4 --steps 4 --multiplier 1024 --perf > out.txt" &
	wait

asic-bfrt:
	${SDE}/run_bfshell.sh -b ${PWD}/bfrt-cli-asic.py

clean:
	rm -rf ${BUILD}

build_dir: clean
	mkdir ${BUILD}
	mkdir ${BUILD}/log


