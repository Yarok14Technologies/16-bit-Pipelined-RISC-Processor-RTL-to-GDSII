`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

class simple_test extends uvm_test;
  `uvm_component_utils(simple_test)

  proc_env env;

  function new(string name = "simple_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = proc_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    simple_instruction_seq seq;
    seq = simple_instruction_seq::type_id::create("seq");
    seq.start(env.agent.sequencer);
    // wait for sequence to finish; usually the sequence is synchronous with run_phase
    #1000ns;
  endtask

endclass