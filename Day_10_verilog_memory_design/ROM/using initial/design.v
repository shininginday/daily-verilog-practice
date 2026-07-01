module rom_case #(
  parameter addr_width = 4,
  parameter data_width = 8,
  parameter data_depth=16
)(
  input clk,
  input [addr_width-1:0] addr,
  output reg [data_width-1:0] data_out
);
  
  reg [data_width-1:0] mem [0:data_depth-1];
  
  initial begin
    
    mem[0] = 8'hA0;
    mem[1] = 8'hA1;
    mem[2] = 8'hA2;
    mem[3] = 8'hA3;
    mem[4] = 8'hA4;
    mem[5] = 8'hA5;
    mem[6] = 8'hA6;
    mem[7] = 8'hA7;
    mem[8] = 8'hA8;
    mem[9] = 8'hA9;
    mem[10] = 8'hB0;
    mem[11] = 8'hB1;
    mem[12] = 8'hB2;
    mem[13] = 8'hB3;
    mem[14] = 8'hB4;
    mem[15] = 8'hB50;
    
  end
  
  always @(posedge clk) begin
    data_out <= mem[addr];
  end
endmodule
  
  

  
  
 
