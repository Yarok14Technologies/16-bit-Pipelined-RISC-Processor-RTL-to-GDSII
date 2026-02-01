# =========================================================
# DESIGN COMPILER SETUP
# =========================================================

set DESIGN_NAME risc32_top

# Paths
set search_path [list \
  ./rtl \
  ./constraints \
  ./scripts/dc \
  ./lib \
]

# Libraries (Sky130)
set target_library [list \
  sky130_fd_sc_hd__tt_025C_1v80.lib
]
set link_library "* $target_library"

# Enable clock gating
set_app_var compile_enable_clock_gating true
set_app_var power_cg_auto_identify true

# DFT-ready defaults
set_app_var dft_scan_style multiplexed_flip_flop
set_app_var test_default_scan_style multiplexed_flip_flop

# Design rules
set_max_transition 0.15 [current_design]
set_max_fanout     20   [current_design]

# Naming rules
define_name_rules verilog -type net \
  -allowed "A-Za-z0-9_" \
  -max_length 255
