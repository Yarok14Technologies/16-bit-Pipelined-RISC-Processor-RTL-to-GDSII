#!/bin/bash
# Usage: ./run_questa.sh [TESTNAME]
TESTNAME=${1:-simple_test}
workdir=work

# Create work library
rm -rf $workdir
vlib $workdir
vmap $workdir $workdir

# Compile (adjust paths to UVM library as needed)
# If your Questa has UVM shipped, use +incdir+<uvm include>. Otherwise add -uvm option.
vlog -sv -work $workdir -f files.f

# Run (pass testname via plusarg)
vsim -c -lib $workdir tb_top +UVM_TESTNAME=$TESTNAME -do "run -all; quit"
# For interactive use, remove -c
# vsim -lib $workdir tb_top +UVM_TESTNAME=$TESTNAME