# =========================================================
# PRIME TIME SIGNOFF REPORTS
# =========================================================

file mkdir reports
file mkdir reports/timing

# Setup
report_timing \
  -delay_type max \
  -nworst 10 \
  -path_type full_clock \
  > reports/timing/setup.rpt

# Hold
report_timing \
  -delay_type min \
  -nworst 10 \
  -path_type full_clock \
  > reports/timing/hold.rpt

# Clock tree
report_clock_timing \
  -type skew \
  > reports/timing/clock_tree.rpt

# MCMM executive summary
report_timing_summary \
  -scenarios {FUNC_TT FUNC_SS FUNC_FF} \
  > reports/timing/mcmm_summary.rpt

# QoR (optional but useful)
report_qor > reports/timing/qor.rpt
