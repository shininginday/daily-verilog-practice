module sync_fifo #(
  parameter depth = 8,
  parameter width=8
)(
  input clk,
  input rst,
  input wr_en,
  input rd_en,
  input [width-1:0] wr_data,
  output reg [width-1:0] rd_data,
  output full,
  output empty
);
  
  reg [width-1:0] mem [0:depth-1];
  
  //pointers
  reg [2:0] rd_ptr;
  reg [2:0] wr_ptr;
  
  //counter
  reg [3:0] count;
  
  assign full = (count == depth);
  assign empty = (count == 0);
  
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      wr_ptr <=0;
    end
    else if(wr_en && !full) begin
      mem[wr_ptr] <= wr_data;
    wr_ptr <= wr_ptr+1;
  end
  end
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      rd_ptr <= 0;
      rd_data <= 0;
    end
    
    else if(rd_en && !empty) begin
      rd_data <= mem[rd_ptr];
      rd_ptr <= rd_ptr +1;
    end
  end
  
  
  // counter logic
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      count <=0;
    end
  else begin
    case ({wr_en && !full, rd_en && !empty}) 
      2'b10 : count <= count + 1;
      2'b01 : count <= count - 1;
      2'b11 : count <= count;
      2'b00 : count <= count;
    endcase
  end
  end
endmodule
    
