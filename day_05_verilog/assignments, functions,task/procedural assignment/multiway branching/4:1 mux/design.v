//with output


module mux4_1(i,s,y);
  input [3:0]i;
  input [1:0]s;
  output reg y;
  
  always @ (i,s)
    begin
      case (s)
        2'b00: y=i[0];
        2'b01: y=i[1];
        2'b10: y=i[2];
        2'b11: y=i[3];
        default: y = 0000;
      endcase
    end  
endmodule

/*output:Time=0, i=0101, s=00, y=1
Time=2, i=0101, s=11, y=0
Time=4, i=0101, s=01, y=0
Time=6, i=0101, s=10, y=1
Time=8, i=0101, s=00, y=1
Time=10, i=0101, s=xx, y=0
Time=12, i=0101, s=0x, y=0*/
