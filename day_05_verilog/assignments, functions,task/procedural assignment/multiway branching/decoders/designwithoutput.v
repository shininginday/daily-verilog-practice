//with output

module decoder224(i,y);
  input [1:0]i;
  output reg [3:0]y;
  
  always @ (i)
    begin
      case (i)
        2'b00: y=0001;
        2'b01: y=0010;
        2'b10: y=0100;
        2'b11: y=1000;
        default: y = 0000;
      endcase
    end  
endmodule

/*output:
Time=0, i=00, y=0001
Time=2, i=11, y=1000
Time=4, i=01, y=1010
Time=6, i=10, y=0100
Time=8, i=00, y=0001
Time=10, i=xx, y=0000
Time=12, i=0x, y=0000
