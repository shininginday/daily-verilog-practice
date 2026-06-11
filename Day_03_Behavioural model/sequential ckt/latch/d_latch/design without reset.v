module dlatch(d,clk,q);
  input d,clk;
  output reg q;
  
  always @(*)
    begin 
      if(clk)
        q=d;
    end
endmodule
