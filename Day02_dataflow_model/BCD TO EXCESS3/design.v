//BCD to excess 3 uding data flow model

module bdc2ex3(bcd,ex3);
  input [3:0]bcd;
  output [3:0]ex3;
  
  //logic by using continuous assignment
  assign ex3 = bcd + 4'b0011;
  
endmodule;
