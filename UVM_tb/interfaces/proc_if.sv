// Simple processor instruction/data bus interface (16-bit bus, ready/valid style)
`timescale 1ns/1ps
interface proc_if (input bit clk, input bit rst_n);
  // Address and data
  logic [15:0] addr;
  logic [15:0] wdata;
  logic [15:0] rdata;
  // Control
  logic        valid;   // master -> slave: request valid
  logic        ready;   // slave -> master: handshake ready
  logic        we;      // write enable (1=write, 0=read)
  // Simple handshake helper
  modport master (input rdata, ready, clk, rst_n, output addr, wdata, valid, we);
  modport slave  (input addr, wdata, valid, we, clk, rst_n, output rdata, ready);
endinterface