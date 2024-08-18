BUILD := $(shell pwd)/build
P4SRC := $(shell realpath "calc.p4")
P4NAME:= calc

compile-p4: build_dir
	${SDE_INSTALL}/bin/bf-p4c -b tofino -o ${BUILD}/${P4NAME} ${P4SRC}

clean:
	rm -rf ${BUILD}

build_dir: clean
	mkdir ${BUILD}
	mkdir ${BUILD}/log

