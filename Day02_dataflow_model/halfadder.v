half adder is designed using data flow modeling
module halfadder(a,b,s,c);
  input a,b;
  output s,c;
  
  //half adder design using continuous assignment
  assign s = a^b; //xor operation to find the output of sum
  assign c = a&b; //and operation to fing the output of carry
  
endmodule; 
