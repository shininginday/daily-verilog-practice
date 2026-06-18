module tb;
  reg clk_in,rst;
  wire clk_out;
  
  freq_divider dut(clk_in,rst,clk_out);
  
  initial begin
    clk_in=0;
    rst=1;
    #7 rst=0;
    
    #100 $finish;
  end
  
  always #5 clk_in = ~clk_in;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk_in,rst,clk_out);
  end
  endmodule
