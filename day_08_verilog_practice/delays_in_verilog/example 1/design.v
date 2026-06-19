module my_design (input x,y,output o1,o2);
  
  //and gate has 1 time unit gate delay
  and #(1) a1(o1,x,y);
  
  //bufifo gate has 2 unit gate delay
  bufif0 #2 b1(o2,x,y);
endmodule
