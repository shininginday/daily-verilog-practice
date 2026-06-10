module mux21(i0,i1,s,y);
  input i0,i1,s;
  output y;
  
  assign y = (s)?i1:i0;
  
endmodule


module mux41(i,s,y);
  input [3:0]i;
  input [1:0]s;
  output y;
  wire w1,w2;
  
  mux21 m1 (.i0(i[0]), .i1(i[1]), .s(s[0]), .y(w1));
  mux21 m2 (.i0(i[2]), .i1(i[3]), .s(s[0]), .y(w2));
  mux21 m3 (.i0(w1), .i1(w2), .s(s[1]), .y(y));
  
endmodule
