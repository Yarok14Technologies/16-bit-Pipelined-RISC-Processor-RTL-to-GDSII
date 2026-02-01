set_power_net VDD
set_ground_net VSS

create_power_ring \
  -nets {VDD VSS} \
  -layer {M4 M5} \
  -width {4 4} \
  -spacing {2 2}

create_power_straps \
  -nets {VDD VSS} \
  -direction vertical \
  -layer M6 \
  -width 2 \
  -pitch 40

connect_pg_net
check_pg_connectivity

save_block -as power_plan_done
