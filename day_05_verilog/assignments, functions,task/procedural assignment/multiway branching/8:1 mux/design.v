//with output

module mux4_1(i,s,y);
  input [7:0]i;
  input [2:0]s;
  output reg y;
  
  always @ (i,s)
    begin
      case (s)
        3'b000: y=i[0];
        3'b001: y=i[1];
        3'b010: y=i[2];
        3'b011: y=i[3];
        3'b100: y=i[4];
        3'b101: y=i[5];
        3'b110: y=i[6];
        3'b111: y=i[7];
        
        default: y = 0000;
      endcase
    end  
endmodule


/*output : Time=0, i=01011101, s=000, y=1
Time=2, i=01011101, s=011, y=1
Time=4, i=01011101, s=101, y=0
Time=6, i=01011101, s=110, y=1
Time=8, i=01011101, s=100, y=1
Time=10, i=01011101, s=001, y=0
Time=12, i=01011101, s=xxx, y=0
Time=14, i=01011101, s=0x0, y=0*/
