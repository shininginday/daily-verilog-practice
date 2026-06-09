//design of OR gate

module or_g(a,b,y);
  input a,b; //input
  output y;  //output
  
  or o1 (y,a,b); //gate level logic
  
endmodule
