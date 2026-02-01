`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class simple_instruction_seq extends uvm_sequence #(proc_seq_item);
  `uvm_object_utils(simple_instruction_seq)

  function new(string name = "simple_instruction_seq");
    super.new(name);
  endfunction

  virtual task body();
    proc_seq_item tx;
    // Example: perform a handful of read/write transactions
    repeat (10) begin
      tx = proc_seq_item::type_id::create("tx");
      assert(tx.randomize() with { addr inside {[0:15]}; data inside {[0:65535]}; });
      // alternate read/write for example
      tx.is_write = $urandom_range(0,1);
      start_item(tx);
      finish_item(tx);
      `uvm_info("SEQ", $sformatf("Sent: %s", tx.convert2string()), UVM_MEDIUM)
      // small delay between transactions
      #(20);
    end
  endtask
endclass