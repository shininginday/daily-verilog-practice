//with output

module encoder(i,y);
  input [3:0]i;
  output reg [1:0]y;
  
  always @ (i)
    begin
      case (i)
        4'b0001: y=2'b00;
        4'b0010: y=2'b01;
        4'b0100: y=2'b10;
        4'b1000: y=2'b11;
        
        default: y = 00;
      endcase
    end  
endmodule

/*Time=0, i=0001, y=00
Time=2, i=0010, y=01
Time=4, i=0100, y=10
Time=6, i=1000, y=11
Time=8, i=0100, y=10
Time=10, i=00xx, y=00*/
