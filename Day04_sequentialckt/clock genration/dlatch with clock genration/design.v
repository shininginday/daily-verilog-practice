module dlatch(d,clk,rst,q);
  input d,clk,rst;
  output reg q;
  
  always @(d,clk,rst)
    begin 
      if(!rst)
        q=0;
      else
        if(clk)
          q=d;  
    end
endmodule
