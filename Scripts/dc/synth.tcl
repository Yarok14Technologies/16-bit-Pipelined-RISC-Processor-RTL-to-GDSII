# =========================================================
# SYNTHESIS SCRIPT
# =========================================================

source scripts/dc/setup.tcl

# Read RTL
read_verilog -sv rtl/*.sv
current_design $DESIGN_NAME
link

# Sanity check
check_design > reports/check_design.rpt

# Load MCMM constraints
source constraints/mcmm_setup.tcl

# Clock gating style
set_clock_gating_style \
  -sequential_cell latch \
  -control_point before \
  -minimum_bitwidth 2

# Compile
compile_ultra \
  -gate_clock \
  -scan \
  -no_autoungroup

# Netlist outputs
file mkdir netlist
write -format verilog -hierarchy \
  -output netlist/${DESIGN_NAME}_synth.v

write_sdc netlist/${DESIGN_NAME}.sdc
