module tb;
  
  reg clk;
  
  initial begin
    clk =0;
    //#100 $finish(0); //gives nothing
    #100 $finish(1); //gives only location and time
    //#100 $finish(2); //gives complete information
    
  end
  
  always #5 clk =~ clk;
endmodule
