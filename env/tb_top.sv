// Testbench Top Module for UVM FIFO Verification
// This file is the top-level testbench for connecting UVM with RTL

// EXERCISE 1 TASK:
// 1. Create a clock generator
// 2. Instantiate the FIFO interface
// 3. Connect the DUT to the interface
// 4. Configure the UVM environment and start the test

module tb_top;
  // Clock and reset generation
  logic clk;
  
  // Generate clock
  initial begin
    // TODO: Create a clock that toggles every 5 time units (Use forever)
  end
  
  // Interface instantiation
  // TODO: Instantiate the fifo_if interface with DATA_WIDTH parameter (Connect clock)
  
  
  // DUT instantiation
  // TODO: Instantiate the FIFO design with parameters (DATA_WIDTH=8, FIFO_DEPTH=16)
  
  
  initial begin
    // TODO: Set the interface in UVM config_db (Use uvm_config_db)
    
    
    // TODO: Start the UVM test (Use run_test with "fifo_base_test")
    
  end

endmodule