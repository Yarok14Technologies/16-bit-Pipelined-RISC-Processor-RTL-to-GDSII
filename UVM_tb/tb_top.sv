// Top-level TB: instantiate DUT, interface, and start UVM
`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

module tb_top;
  // Clock/reset
  bit clk;
  bit rst_n;

  // Instantiate interface
  proc_if proc_bus_if(.clk(clk), .rst_n(rst_n));

  // Instantiate DUT (user should replace with real DUT instance)
  // Example: processor16 dut(.clk(clk), .rst_n(rst_n), .addr(proc_bus_if.addr), ...);
  // Or instantiate dut_wrapper which contains the real DUT
  // dut_wrapper dut (.clk(clk), .rst_n(rst_n));

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk; // 100MHz-like (10ns period) — adapt as needed

  // Reset
  initial begin
    rst_n = 0;
    #100;
    rst_n = 1;
  end

  // Bind virtual interface to uvm_config_db
  initial begin
    // Provide interface handle to UVM components
    uvm_config_db#(virtual proc_if)::set(null, "uvm_test_top.env.agent.driver", "vif", proc_bus_if);
    uvm_config_db#(virtual proc_if)::set(null, "uvm_test_top.env.agent.monitor", "vif", proc_bus_if);
  end

  // Start UVM. Use +UVM_TESTNAME=<test> to run a specific test.
  string testname;
  initial begin
    if (!$value$plusargs("UVM_TESTNAME=%s", testname))
      testname = "simple_test";
    run_test(testname);
  end

endmodule