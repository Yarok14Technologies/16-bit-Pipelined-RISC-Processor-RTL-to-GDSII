// DUT wrapper: instantiate your processor here and connect interface signals
`timescale 1ns/1ps
module dut_wrapper (
  input logic clk,
  input logic rst_n,
  // optional external connections...
);

// Instantiate the interface inside testbench (connected in top)
endmodule