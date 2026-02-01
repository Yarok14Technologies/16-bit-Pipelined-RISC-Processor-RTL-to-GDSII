set_placement_strategy \
  -timing_driven true \
  -congestion_driven true

place_opt -effort high
legalize_placement

report_placement_utilization > reports/area/utilization.rpt

save_block -as placement_done
