module jkff_tb;
  reg j,k,clk,rst;
  wire q;

  //dut instantiation
  jkff dut(.j(j),.k(k),.clk(clk),.rst(rst),.q(q));
  
  initial begin
    clk = 0; rst=1; j=1; k=0;
    #14 rst =0; j=1; k=0;
    #11 j=1; k=1;
    #13 j=0; k=0;
    #80 j=0; k=1;
    #17 j=1; k=1;
    #5 $finish;
  end
  always #5 clk=~clk;
    
  
//monitoring of input and output
  
  initial begin
    $monitor("j=%b,k=%d, clk=%b, q=%b, rst=%b",j,k,clk,q,rst);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,j,k,clk,q,rst);
  end
  
endmodule
