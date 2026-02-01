# List of sources (order matters for some simulators)
# Change paths as you place files in the repo.

+incdir+.
`uvm/uvm_pkg.sv  // if your simulator requires explicit path; otherwise rely on simulator UVM lib

tb/interfaces/proc_if.sv
tb/rtl/dut_wrapper.sv
tb/tb_top.sv

# UVM components
tb/sequences/proc_seq_item.sv
tb/sequences/simple_instruction_seq.sv
tb/agent/sequencer.sv
tb/agent/driver.sv
tb/agent/monitor.sv
tb/agent/agent.sv
tb/scoreboard/scoreboard.sv
tb/env/env.sv
tb/tests/simple_test.sv