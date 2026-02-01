#!/bin/bash
# Usage: ./run_vcs.sh [TESTNAME]
TESTNAME=${1:-simple_test}
rm -rf csrc simv* ucli.key
# Compile with VCS (adjust +vcs+lic option if needed)
vcs -full64 -sverilog -f files.f -debug_all -l compile.log
if [ $? -ne 0 ]; then
  echo "VCS compile failed"
  exit 1
fi
./simv +UVM_TESTNAME=$TESTNAME +UVM_VERBOSITY=UVM_LOW