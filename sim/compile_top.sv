// Top level compilation file for AHB UVM testbench
`timescale 1ns/100ps

// Include UVM library
`include "uvm_macros.svh"
import uvm_pkg::*;

// Include package (which includes all other files)
`include "../env/pkg.sv"
import pkg::*;

// Include testbench top
`include "../env/tb_top.sv"