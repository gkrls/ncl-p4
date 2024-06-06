Agg
---

### Usage

#### ASIC

Make sure the SDE is installed and `$SDE` and `$SDE_INSTALL` are properly set.

```
cd ncl-p4/test/asic
make
```

This will build the P4 program, start the user-space driver, and load the program to the ASIC.

Next, make sure `ncl-p4/agg/src/host/config-asic.json` is correctly set up.

In a new terminal:

```
$SDE/run_bfshell.sh -b `pwd`/ncl-p4/agg/src/host/controller_cli.py
```