`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class proc_scoreboard extends uvm_component;
  `uvm_component_utils(proc_scoreboard)

  uvm_analysis_export#(proc_seq_item) result_export;

  function new(string name = "proc_scoreboard", uvm_component parent = null);
    super.new(name, parent);
    result_export = new("result_export", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    proc_seq_item t;
    forever begin
      result_export.get(t);
      `uvm_info("SCORE", $sformatf("Observed: %s", t.convert2string()), UVM_LOW)
      // Implement checks / reference model compare here
    end
  endtask
endclass