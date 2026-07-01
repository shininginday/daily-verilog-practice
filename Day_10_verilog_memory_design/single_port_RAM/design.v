module single_port_ram #(
  parameter DEPTH=16,
  parameter WIDTH=8
)(
  input clk,
  input we,
  input[3:0] addr,
  input [WIDTH-1:0] data_in,
  output reg[WIDTH-1:0] data_out
);
  
  //memory array declaration
  reg [WIDTH-1:0] mem [0:DEPTH-1];
  
  always @(posedge clk) begin
    if (we)
      mem[addr] <= data_in; //write operation
    else
      data_out <= mem[addr]; //read operation
  end
endmodule
