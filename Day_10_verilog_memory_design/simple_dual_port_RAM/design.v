module simple_dual_port_RAM #(
  parameter WIDTH = 8,
  parameter DEPTH = 16)
  (
    //port a - write only
    input wr_clk,
    input wr_en,
    input [3:0] wr_addr,
    input [WIDTH-1:0] wr_data,
    
    //port b - read only
    input rd_clk,
    input [3:0] rd_addr,
    output reg [WIDTH-1:0] rd_data
  );
  
  reg [WIDTH-1:0] mem[0:DEPTH-1];
  
  //port a- write operation
  always @(posedge wr_clk)
    begin
      if(wr_en)
      mem[wr_addr] <= wr_data;
    end
  
  //port b - read operation
  always @(posedge rd_clk)
    begin
      rd_data <= mem[rd_addr];
    end
endmodule
  
  
