// Top level compilation file for FIFO UVM testbench
`timescale 1ns/100ps

// Include UVM library
`include "uvm_macros.svh"
import uvm_pkg::*;

// Include interface
`include "../env/fifo_if.sv"

// Include RTL
`include "../rtl/fifo.sv"

// Include package (which includes all other files)
`include "../env/pkg.sv"
import pkg::*;

// Include testbench top
`include "../env/tb_top.sv"