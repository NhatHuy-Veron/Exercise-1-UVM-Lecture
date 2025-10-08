// FIFO (First-In-First-Out) RTL Design
// This is a simple synchronous FIFO with configurable data width and depth

module fifo #(
  parameter DATA_WIDTH = 8,
  parameter FIFO_DEPTH = 16
)(
  // Clock and Reset
  input  logic                  clk,
  input  logic                  rst_n,
  
  // Write Interface
  input  logic                  wr_en,
  input  logic [DATA_WIDTH-1:0] wr_data,
  output logic                  full,
  
  // Read Interface
  input  logic                  rd_en,
  output logic [DATA_WIDTH-1:0] rd_data,
  output logic                  empty
);

  // Local parameters
  localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);
  
  // Internal signals
  logic [ADDR_WIDTH-1:0] wr_ptr;
  logic [ADDR_WIDTH-1:0] rd_ptr;
  logic [ADDR_WIDTH:0]   count;
  
  // Memory array for FIFO storage
  logic [DATA_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];
  
  // FIFO status flags
  assign full  = (count == FIFO_DEPTH);
  assign empty = (count == 0);
  
  // Write pointer logic
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      wr_ptr <= '0;
    end else if (wr_en && !full) begin
      wr_ptr <= (wr_ptr == FIFO_DEPTH-1) ? '0 : wr_ptr + 1'b1;
    end
  end
  
  // Read pointer logic
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      rd_ptr <= '0;
    end else if (rd_en && !empty) begin
      rd_ptr <= (rd_ptr == FIFO_DEPTH-1) ? '0 : rd_ptr + 1'b1;
    end
  end
  
  // Count logic
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count <= '0;
    end else begin
      case ({wr_en && !full, rd_en && !empty})
        2'b10:   count <= count + 1'b1; // Write only
        2'b01:   count <= count - 1'b1; // Read only
        default: count <= count;        // Both or none
      endcase
    end
  end
  
  // Write operation
  always_ff @(posedge clk) begin
    if (wr_en && !full) begin
      fifo_mem[wr_ptr] <= wr_data;
    end
  end
  
  // Read operation
  assign rd_data = fifo_mem[rd_ptr];

endmodule