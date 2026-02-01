set DESIGN_NAME risc32_top

read_verilog netlist/${DESIGN_NAME}_synth.v
link

initialize_floorplan \
  -core_utilization 0.62 \
  -aspect_ratio 1.0 \
  -core_offset {20 20 20 20}

set_site_def unithd
place_io -random

save_block -as floorplan_done
