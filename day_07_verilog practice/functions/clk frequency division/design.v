module freq_divider #(parameter n=3)(clk_in,rst,clk_out);
  input clk_in,rst;
  output clk_out;
  integer count;
  reg temp_clk;
  
  
  always@(posedge clk_in or negedge clk_in)
    begin
      if(rst)
        begin
          count = 0;
          temp_clk = 0;
        end
      else
        count = count+1;
      if(count==n)
        begin
          temp_clk = ~temp_clk;
          count=0;
        end
    end
  
  assign clk_out = temp_clk;
  
endmodule
