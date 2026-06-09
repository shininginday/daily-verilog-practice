// Code your design here
//design of gate level 2:1 MUX

module mux2to1(in1,in2,s,out);
  input in1,in2,s; //input
  output out;  //output
  wire w1,w2;
  
  and a1(w1,~s,in1); // indicating first input when s=0
  and a2(w2,s,in2); //indicating second input when s=1
  or o1(out,w1,w2);
  
endmodule
