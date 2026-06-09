
module paritygenerator(a,b,c,p);
  input a,b,c; //input
  output p;  //output
  
  //logic of3 bit parity generator to get output
  xor x1(p,a,b,c);
  
endmodule
