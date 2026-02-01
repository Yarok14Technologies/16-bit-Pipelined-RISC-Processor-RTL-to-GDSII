# =========================================================
# PRIME TIME MCMM SIGNOFF SETUP
# =========================================================

set DESIGN_NAME risc32_top

# Paths
set search_path [list ./netlist ./constraints ./lib]
set link_library "* \
  sky130_fd_sc_hd__tt_025C_1v80.lib \
  sky130_fd_sc_hd__ss_125C_1v60.lib \
  sky130_fd_sc_hd__ff_n40C_1v95.lib"

# Read design
read_verilog netlist/${DESIGN_NAME}_icc2.v
link_design $DESIGN_NAME
read_parasitics netlist/${DESIGN_NAME}.spef

# -------------------------
# MCMM
# -------------------------
create_mode FUNC

create_corner TT
create_corner SS
create_corner FF

set_liberty_files -corner TT sky130_fd_sc_hd__tt_025C_1v80.lib
set_liberty_files -corner SS sky130_fd_sc_hd__ss_125C_1v60.lib
set_liberty_files -corner FF sky130_fd_sc_hd__ff_n40C_1v95.lib

create_scenario -mode FUNC -corner TT FUNC_TT
create_scenario -mode FUNC -corner SS FUNC_SS
create_scenario -mode FUNC -corner FF FUNC_FF

set_active_scenarios {FUNC_TT FUNC_SS FUNC_FF}

# Constraints
read_sdc constraints/timing.sdc

# Sanity
check_timing
update_timing
