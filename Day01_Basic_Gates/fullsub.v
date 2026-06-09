//design of gate level full subtractor 

module fs(a,b,bin,d,bout);
  input a,b,bin; //input
  output d,bout;  //output
  wire w1,w2,w3; //to get borrow output
  
  //logic of full subtractor to get output
  xor x1(d,a,b,bin); //output of difference
  and a1(w1,~a,b);
  and a2(w2,b,bin);
  and a3(w3,bin,~a);
  or o1(bout,w1,w2,w3);
  
endmodule
