// FIFO Interface
// Interface for connecting FIFO DUT to UVM testbench

// EXERCISE 1 TASK:
// 1. Define interface with parameter DATA_WIDTH
// 2. Add clock input to the interface
// 3. Add reset and data signals
// 4. Define DUT and TB modports

interface fifo_if #(
  // TODO: Define DATA_WIDTH parameter
)(
  // TODO: Add clock input
);
  
  // Reset
  // TODO: Define reset signal
  
  // Write Interface
  // TODO: Define write signals (wr_en, wr_data, full)
  
  // Read Interface
  // TODO: Define read signals (rd_en, rd_data, empty)
  
  // Modports
  // TODO: Define DUT modport with appropriate directions
  
  // TODO: Define TB modport with appropriate directions
  
endinterface