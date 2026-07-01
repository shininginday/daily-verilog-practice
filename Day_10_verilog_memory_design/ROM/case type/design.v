module rom_case #(
  parameter addr_width = 4,
  parameter data_width = 8
)(
  input clk,
  input [addr_width-1:0] addr,
  output reg [data_width-1:0] data_out
);
  
  always @(posedge clk) begin
    case (addr)
      
      4'd0: data_out<=8'h0;
      4'd1: data_out<=8'h1;
      4'd2: data_out<=8'h2;
      4'd3: data_out<=8'h3;
      4'd4: data_out<=8'h4;
      4'd5: data_out<=8'h5;
      4'd6: data_out<=8'h6;
      4'd7: data_out<=8'h7;
      4'd8: data_out<=8'h8;
      4'd9: data_out<=8'h9;
      4'd10: data_out<=8'h10;
      4'd11: data_out<=8'hA;
      4'd12: data_out<=8'hB;
      4'd13: data_out<=8'hC;
      4'd14: data_out<=8'hD;
      4'd15: data_out<=8'hEE;
      default : data_out<=8'h00;
    endcase
  end
  
endmodule
  
  

  
  
 
