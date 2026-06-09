// Code your design here
//design of gate level 4:2 encoder

module dec4to2(d0,d1,d2,d3,y1,y2);
  input d0,d1,d2,d3; //input
  output y1,y2;  //output
  
  //logic of 4 to 2 encoder to get output
  or o1(y1,d1,d3);
  or o2(y2,d2,d3);
  
endmodule
