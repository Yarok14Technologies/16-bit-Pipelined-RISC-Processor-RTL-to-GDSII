# =========================================================
# CLOCK DEFINITIONS
# =========================================================

create_clock \
  -name core_clk \
  -period 10.000 \
  -waveform {0 5} \
  [get_ports clk]

# Clock uncertainty (pre-CTS)
set_clock_uncertainty 0.20 [get_clocks core_clk]

# (Optional post-CTS – uncomment in PT)
# set_clock_latency -source 0.30 [get_clocks core_clk]
# set_clock_latency         0.70 [get_clocks core_clk]
