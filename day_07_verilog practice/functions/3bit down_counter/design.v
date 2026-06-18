module downcounter(input clk,rst, output reg[2:0] q);
  //the conter will be stop at 0
  always @(posedge clk or posedge rst)
      if(rst)
        q<=3'b111;
      else
        if (q!=0)
         q <= q - 1;
endmodule
