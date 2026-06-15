module dff(d,clk,rst,q);
  input d,clk,rst;
  output reg q;
  reg qin;
  
  always @(posedge clk)
    begin 
      if(!rst)
        qin<=0;
      else
        if(clk)
          qin<=d;
        q<=qin;     
    end
endmodule
