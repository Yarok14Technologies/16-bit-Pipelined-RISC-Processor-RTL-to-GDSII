`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class proc_driver extends uvm_driver #(proc_seq_item);
  `uvm_component_utils(proc_driver)

  // Virtual interface
  virtual proc_if vif;

  function new(string name = "proc_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  // Get vif from config db
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual proc_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF", "Virtual interface not found for driver")
    end
  endfunction

  task run_phase(uvm_phase phase);
    proc_seq_item req;
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive_transaction(req);
      seq_item_port.item_done();
    end
  endtask

  task drive_transaction(proc_seq_item t);
    // Simple example: perform a handshake using valid/ready
    // Adapt timing/behavior to match the processor bus protocol.
    @(posedge vif.clk);
    vif.addr  <= t.addr;
    vif.wdata <= t.data;
    vif.we    <= t.is_write;
    vif.valid <= 1;
    // wait for ready
    wait (vif.ready == 1);
    @(posedge vif.clk);
    vif.valid <= 0;
    vif.we    <= 0;
    // optional: wait for one cycle, etc.
  endtask

endclass