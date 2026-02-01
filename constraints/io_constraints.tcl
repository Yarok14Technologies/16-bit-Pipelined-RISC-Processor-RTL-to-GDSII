# =========================================================
# I/O PHYSICAL CONSTRAINTS
# =========================================================

# Pin placement hints
set_io_location -side left  -pin clk
set_io_location -side left  -pin rst_n

set_io_location -side right -pin uart_tx
set_io_location -side right -pin uart_rx

# Input drive (clock)
set_driving_cell \
  -lib_cell sky130_fd_sc_hd__buf_4 \
  -pin Y \
  [get_ports clk]

# Output load (UART)
set_load 0.05 [get_ports uart_tx]
