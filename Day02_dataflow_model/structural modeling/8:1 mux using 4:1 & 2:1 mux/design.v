module mux2_1(in1,in2,s,out);
  input in1,in2,s;
  output out;
  
  assign out = (~s*in1)|(s*in2);
endmodule;  

module mux421(in,s,out);
  input [3:0]in;
  input [1:0]s;
  output out;
  
  assign out = (s[0])?(s[1]?in[3]:in[1]):((s[1])?in[2]:in[0]);
  
endmodule

module mux8_1(i,s,y);
  input [7:0] i;
  input [2:0] s;
  output y;
  wire w1,w2;
  
  
  mux421 m1(.in(i[3:0]), .s(s[1:0]), .out(w1));
  mux421 m2(.in(i[7:4]), .s(s[1:0]), .out(w2));
  mux2_1 m3(.in1(w1), .in2(w2), .s(s[2]), .out(y));
             
endmodule
             
