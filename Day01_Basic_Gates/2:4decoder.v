
//design of 2:4 decoder

module dec2to4(in1,in2,out1, out2, out3, out4);
  input in1,in2; //input
  output out1, out2, out3, out4;  //output
  
  //logic of decoder to get output
  and a1(out1,~in1,~in2); 
  and a2(out2,in1,~in2);
  and a3(out3,~in1,in2);
  and a4(out4,in1,in2);
  
endmodule
