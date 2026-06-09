// Code your design here
//design of NOR gate

module nor_g(a,b,y);
  input a,b; //input
  output y;  //output
  
  nor o1 (y,a,b); //gate level logic
  
endmodule
