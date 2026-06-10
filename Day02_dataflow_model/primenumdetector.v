data flow modeling

module primenumber(a,b,c,p);
  input a,b,c;
  output p;
  
  //logic by using continuous assignment
  assign p = (~a&b)|(a&c);
  
endmodule;
