//2:1mux designed in dataflow model

//design code of 2:1 mux

module mux2_1(in1,in2,s,out);
  input in1,in2,s;
  output out;
  
  assign out = (~s*in1)|(s*in2);
endmodule;  
