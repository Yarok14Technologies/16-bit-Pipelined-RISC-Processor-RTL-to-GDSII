`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class proc_env extends uvm_env;
  `uvm_component_utils(proc_env)

  proc_agent       agent;
  proc_scoreboard  sb;

  function new(string name = "proc_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = proc_agent::type_id::create("agent", this);
    sb    = proc_scoreboard::type_id::create("sb", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // Connect monitor -> scoreboard
    agent.monitor.item_collected_port.connect(sb.result_export);
  endfunction
endclass