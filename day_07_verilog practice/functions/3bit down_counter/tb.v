module tb;
  reg clk;
  reg rst;
  wire [2:0]q;
  
  downcounter dut(clk,rst,q);
  
  initial begin
    clk = 0;
    rst =1;
    #7 rst =0;
    
    #100 $finish;
  end
  
  always #5 clk= ~clk;
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk,rst,q);
  end
endmodule
  
  
