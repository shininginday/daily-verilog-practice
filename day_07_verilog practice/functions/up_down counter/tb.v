module tb;
  reg clk;
  reg rst;
  reg up_down;
  wire [2:0]q;
  
  up_downcounter dut(clk,rst,up_down,q);
  
  initial begin
    clk = 0;
    rst =1;
    #4 rst =0;
    
    up_down = 1;
    #50
    up_down = 0;
    
    #100 $finish;
  end
  
  always #5 clk= ~clk;
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk,rst,up_down,q);
  end
endmodule
  
  
