module up_downcounter(input clk,rst, up_down,output reg[2:0] q);
 

  //the conter will be stop at 0
  always @(posedge clk or posedge rst)
      if(rst)
        q<=3'b000;
      else
        begin
        if (up_down)
         q <= q + 1;
        else
         q <= q - 1;
        end
endmodule
