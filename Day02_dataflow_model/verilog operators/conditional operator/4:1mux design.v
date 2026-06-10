module mux421(in,s,out);
  input [3:0]in;
  input [1:0]s;
  output out;
  
  assign out = (s[0])?(s[1]?in[3]:in[1]):((s[1])?in[2]:in[0]);
  
endmodule
