`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class proc_monitor extends uvm_component;
  `uvm_component_utils(proc_monitor)

  virtual proc_if vif;
  uvm_analysis_port#(proc_seq_item) item_collected_port;

  function new(string name = "proc_monitor", uvm_component parent = null);
    super.new(name, parent);
    item_collected_port = new("item_collected_port", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual proc_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF", "Virtual interface not found for monitor")
    end
  endfunction

  task run_phase(uvm_phase phase);
    proc_seq_item t;
    super.run_phase(phase);
    forever begin
      @(posedge vif.clk);
      if (vif.valid && vif.ready) begin
        t = proc_seq_item::type_id::create("t");
        t.addr = vif.addr;
        t.data = vif.wdata;
        t.is_write = vif.we;
        // For reads, rdata will be valid next cycles depending on DUT; adjust monitor accordingly
        item_collected_port.write(t);
      end
    end
  endtask
endclass