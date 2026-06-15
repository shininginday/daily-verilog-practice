module dff_tb;
  reg d,clk,rst;
  wire q;

  //dut instantiation
  dff dut(.d(d),.clk(clk),.rst(rst),.q(q));
  
  initial begin
    clk = 0;
    rst = 0; d=0; //active low
    #11 rst =1;
    #5 d=1;
    #18 d=0;
    #20 d=1;
    #5 d=0;
    #10 d=1;
    #100 $finish;
  end
  always #5 clk=~clk;
    
  
//monitoring of input and output
  
  initial begin
    $monitor("d=%b, clk=%b, q=%b, rst=%b",d,clk,q,rst);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,d,clk,q,rst);
  end
  
endmodule
