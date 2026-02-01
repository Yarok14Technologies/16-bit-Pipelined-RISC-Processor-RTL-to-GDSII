# =========================================================
# SYNTHESIS REPORTS
# =========================================================

file mkdir reports
file mkdir reports/synthesis

# Timing
report_timing -delay_type max -nworst 10 \
  > reports/synthesis/setup_prepr.rpt

report_timing -delay_type min -nworst 10 \
  > reports/synthesis/hold_prepr.rpt

# Area
report_area -hierarchy \
  > reports/synthesis/area.rpt

# Power
report_power -hierarchy \
  > reports/synthesis/power.rpt

# Clock gating
report_clock_gating \
  > reports/synthesis/clock_gating.rpt

# QoR
report_qor \
  > reports/synthesis/qor_summary.rpt
