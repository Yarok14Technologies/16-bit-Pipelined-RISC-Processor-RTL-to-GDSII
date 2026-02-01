# =========================================================
# MCMM SETUP (SIGNOFF-GRADE)
# =========================================================

# -------------------------
# Mode
# -------------------------
create_mode FUNC
set_mode FUNC

# -------------------------
# Corners
# -------------------------
create_corner TT
create_corner SS
create_corner FF

set_liberty_files -corner TT sky130_fd_sc_hd__tt_025C_1v80.lib
set_liberty_files -corner SS sky130_fd_sc_hd__ss_125C_1v60.lib
set_liberty_files -corner FF sky130_fd_sc_hd__ff_n40C_1v95.lib

# -------------------------
# Scenarios
# -------------------------
create_scenario -mode FUNC -corner TT FUNC_TT
create_scenario -mode FUNC -corner SS FUNC_SS
create_scenario -mode FUNC -corner FF FUNC_FF

set_active_scenarios {FUNC_TT FUNC_SS FUNC_FF}

# -------------------------
# Timing intent
# -------------------------
read_sdc constraints/timing.sdc
