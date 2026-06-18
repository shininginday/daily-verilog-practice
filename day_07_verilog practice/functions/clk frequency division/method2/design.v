module freq_div(input clk_in,rst, output reg clk_out);
  
  integer count;
  reg temp_clk;
  
  always @(posedge clk_in or negedge clk_in)
    begin
      if(rst)
        begin
            count=0;
            temp_clk =0;
        end
      else 
        count = count+1;
      if(count%3==0)
        begin
           temp_clk = ~temp_clk;
        end
      else
        if (count>5)
          begin
        count = 0;
         end
        clk_out=temp_clk;
        
    end
endmodule
