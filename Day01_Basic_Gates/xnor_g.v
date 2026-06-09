// Code your design here
//design of XNOR gate

module xnor_g(a,b,y);
  input a,b; //input
  output y;  //output
  
  xnor o1 (y,a,b); //gate level logic
  
endmodule
