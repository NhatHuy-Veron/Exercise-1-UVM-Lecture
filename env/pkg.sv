`timescale 1ns/100ps
`include "uvm_macros.svh"
package pkg;
  import uvm_pkg::*;

  // Include all UVM component files
  `include "../model/fifo_environment/fifo_transaction.sv"
  `include "../seq/fifo_sequencer.sv"
  `include "../seq/fifo_sequence.sv"
  `include "../model/fifo_environment/fifo_driver.sv"
  `include "../model/fifo_environment/fifo_monitor.sv"
  `include "../model/fifo_environment/fifo_agent.sv"
  `include "../model/fifo_environment/fifo_scoreboard.sv"
  `include "../model/fifo_environment/fifo_environment.sv"
  `include "../tests/fifo_base_test.sv"
endpackage: pkg