# =========================================================
# CALIBRE ANTENNA RUNSET
# =========================================================

LAYOUT SYSTEM GDSII
LAYOUT PATH "layout/gds/risc32_top.gds"
LAYOUT PRIMARY "risc32_top"

ANTENNA RESULTS DATABASE "reports/calibre/antenna_results"
ANTENNA REPORT "reports/calibre/antenna.rpt"

INCLUDE "deck/sky130.antenna"
