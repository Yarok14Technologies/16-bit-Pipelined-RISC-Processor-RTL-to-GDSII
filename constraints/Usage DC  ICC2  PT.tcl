# DC / Genus
source constraints/mcmm_setup.tcl

# OpenROAD
read_sdc constraints/timing.sdc

# PrimeTime
source constraints/mcmm_setup.tcl
update_timing
