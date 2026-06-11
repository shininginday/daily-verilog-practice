module dlatch_tb;
  reg d,clk;
  wire q;

  //dut instantiation
  dlatch dut(d,clk,q);
    
//stimuli generartion
  initial begin
    {d,clk} = 00;
    #2 {d,clk} = 01;
    #2 {d,clk} = 11;
    #2 {d,clk} = 01;
    #2 {d,clk} = 00;
    #2 {d,clk} = 10;
    #2 $finish;
  end
  
//monitoring of input and output
  
  initial begin
    $monitor("d=%b, clk=%b, q=%b",d,clk,q);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,d,clk,q);
  end
  
endmodule
