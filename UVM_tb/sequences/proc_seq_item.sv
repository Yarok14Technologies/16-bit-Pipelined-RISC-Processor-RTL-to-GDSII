`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class proc_seq_item extends uvm_sequence_item;
  `uvm_object_utils(proc_seq_item)

  rand bit [15:0] addr;
  rand bit [15:0] data;
  rand bit         is_write;

  function new(string name = "proc_seq_item");
    super.new(name);
  endfunction

  // Provide pretty print
  function string convert2string();
    return $sformatf("proc_seq_item: addr=0x%0h data=0x%0h is_write=%0d", addr, data, is_write);
  endfunction
endclass