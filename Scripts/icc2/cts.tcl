set_clock_tree_options \
  -target_skew 0.05 \
  -max_transition 0.15 \
  -buffer_list {sky130_fd_sc_hd__clkbuf_2}

clock_opt -only_cts
clock_opt -from cts -to cts

report_clock_tree > reports/timing/clock_tree.rpt

save_block -as cts_done
