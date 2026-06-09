//design of AND gate

module and_g(a,b,y);
  input a,b; //input
  output y;  //output
  
  and a1 (y,a,b); //gate level logic
  
endmodule
