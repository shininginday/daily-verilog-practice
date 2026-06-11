module tb;
  
  reg clk;
  
  initial begin
    clk = 0;
    #100 $finish;
  end
  
  always begin
    #2 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk);
  end
endmodule
