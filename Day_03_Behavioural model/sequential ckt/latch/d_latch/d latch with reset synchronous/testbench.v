module dlatch_tb;
  reg d,clk,rst;
  wire q;

  //dut instantiation
  dlatch dut(d,clk,rst,q);
    
//stimuli generartion
  initial begin
    {d,clk,rst} = 000;
    #2 {d,clk,rst} = 001;
    #2 {d,clk,rst} = 010;
    #2 {d,clk,rst} = 011;
    #2 {d,clk,rst} = 100;
    #2 {d,clk,rst} = 101;
    #2 {d,clk,rst} = 110;
    #2 {d,clk,rst} = 111;
    #2 $finish;
  end
  
//monitoring of input and output
  
  initial begin
    $monitor("d=%b, clk=%b, rst=%b, q=%b",d,clk,rst,q);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,d,clk,rst,q);
  end
  
endmodule
