# UVM 2.3 testbench skeleton for 16-bit RISC processor

Overview
- UVM 2.3 compatible testbench skeleton.
- Provides a simple ready/valid style 16-bit instruction/data bus interface plus a UVM environment, agent (sequencer/driver/monitor), sequence, scoreboard and top-level TB.

How to use
1. Place your DUT (processor RTL) in `tb/rtl` or update `tb_top.sv` to instantiate it.
2. Wire the DUT's bus pins to `proc_if` signals in `tb_top.sv`.
3. Adjust timings/handshakes in `proc_if`, driver and monitor to match the real protocol.
4. Add more sequence classes to exercise instructions, exceptions, memory, etc.
5. Add a reference model and strengthen the scoreboard assertions / checks.

Compile & run
- Questa (examples below)
  - `./run_questa.sh` (edit files.f if needed)
- Synopsys VCS
  - `./run_vcs.sh` (edit files.f if needed)

Environment variables / plusargs
- UVM_TESTNAME: choose which test to run. Example: `+UVM_TESTNAME=simple_test`

Notes
- This skeleton is intentionally minimal — fill in the DUT instantiation and protocol-specific behavior.
- Tests and sequences should be extended to cover your ISA and pipeline hazards, forwarding, branch prediction, etc.