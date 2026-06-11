module tb;
  
  reg clk;
  real freq = 500; //50khz
  real tp = 1/(freq*1e6)*1e9; //time period in ns
  real duty = 75;
  real ton = (tp*duty)/100;
  real toff = tp - ton;
  
  initial begin
    clk = 0;
    #(tp*2) $finish;
  end
 
  
  always begin
    #(toff) clk = 1;
    #(ton) clk = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk);
  end
endmodule
