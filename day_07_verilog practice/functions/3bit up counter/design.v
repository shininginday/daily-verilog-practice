module upcounter(input clk,rst, output reg[2:0] q);
  
//to stop when the counter reaches 7  
  /*always @(posedge clk or posedge rst)
      if(rst)
        q<=3'b000;
      else 
        if (q>=3'b111)
          q <= q;
        else 
        q <= q + 1;*/
  
  
  
  //the conter will be moving from 7 to 0 again
  always @(posedge clk or posedge rst)
      if(rst)
        q<=3'b000;
      else  
        q <= q + 1;
endmodule
