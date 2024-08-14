BUILD := $(shell pwd)/build

compile-acceptor:
	${SDE_INSTALL}/bin/bf-p4c -b tofino -DPAXOS_ACCEPTOR -o ${BUILD}/acceptor $(shell realpath "acceptor.p4")


compile-learner:
	${SDE_INSTALL}/bin/bf-p4c -b tofino -DPAXOS_LEARNER -o ${BUILD}/acceptor $(shell realpath "learner.p4")

compile-leader:
	${SDE_INSTALL}/bin/bf-p4c -b tofino -DPAXOS_LEADER -o ${BUILD}/acceptor $(shell realpath "leader.p4")


clean:
	rm -rf ${BUILD}

build_dir: clean
	mkdir ${BUILD}
	mkdir ${BUILD}/log

