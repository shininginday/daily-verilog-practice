module mux221(in1,in2,s,out);
  input in1,in2,s;
  output reg out;
  
  always @(in1 or in2 or s)
  begin
    out = (s)?in2:in1;
  end  
endmodule
