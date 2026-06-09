// Code your design here
//design of NOR gate

module nand_g(a,b,y);
  input a,b; //input
  output y;  //output
  
 nand n1 (y,a,b); //gate level logic
  
endmodule
