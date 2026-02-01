extract_rc

file mkdir reports/timing

report_timing -delay_type max -nworst 10 \
  > reports/timing/setup.rpt

report_timing -delay_type min -nworst 10 \
  > reports/timing/hold.rpt

report_qor > reports/timing/mcmm_summary.rpt

write_verilog netlist/risc32_top_icc2.v
write_def      layout/def/risc32_top.def
write_gds      layout/gds/risc32_top.gds

save_block -as signoff_done
