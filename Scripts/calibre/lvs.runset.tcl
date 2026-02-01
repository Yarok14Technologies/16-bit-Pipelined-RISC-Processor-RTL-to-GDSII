# =========================================================
# CALIBRE LVS RUNSET
# =========================================================

LAYOUT SYSTEM GDSII
LAYOUT PATH "layout/gds/risc32_top.gds"
LAYOUT PRIMARY "risc32_top"

SOURCE SYSTEM VERILOG
SOURCE PATH "netlist/risc32_top_icc2.v"
SOURCE PRIMARY "risc32_top"

LVS POWER NAME VDD
LVS GROUND NAME VSS

LVS REPORT "reports/calibre/lvs.rpt"
LVS REPORT OPTION ALL

INCLUDE "deck/sky130.lvs"
