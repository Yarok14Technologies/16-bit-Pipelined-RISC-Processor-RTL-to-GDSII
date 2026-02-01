`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class proc_agent extends uvm_component;
  `uvm_component_utils(proc_agent)

  proc_sequencer   sequencer;
  proc_driver      driver;
  proc_monitor     monitor;

  function new(string name = "proc_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sequencer = proc_sequencer::type_id::create("sequencer", this);
    driver    = proc_driver::type_id::create("driver", this);
    monitor   = proc_monitor::type_id::create("monitor", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
    // connect monitor analysis port in env
  endfunction
endclass