module dlatch(d,clk,rst,q);
  input d,clk,rst;
  output reg q;
  
  always @(*)
    begin 
      if(clk)
        if(rst)
          q=0;
        else
          q=d;  
    end
endmodule
