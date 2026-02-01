`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class proc_sequencer extends uvm_sequencer #(proc_seq_item);
  `uvm_component_utils(proc_sequencer)
  function new(string name = "proc_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction
endclass