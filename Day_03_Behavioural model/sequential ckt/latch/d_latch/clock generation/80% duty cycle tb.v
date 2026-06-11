module tb;
  
  reg clk;
  
  initial begin
    clk = 0;
    #100 $finish;
  end
  
  always begin
    #2 clk = 1;
    #8 clk = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk);
  end
endmodule
