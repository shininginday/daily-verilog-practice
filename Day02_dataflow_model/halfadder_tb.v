previously i was using positional port connection but from this step i am upgraded to use named port connection, which is reocmmended in coding

module halfadder_tb;
  reg a,b;
  wire s,c;

  //dut instantiation
  halfadder dut(.a(a), .b(b), .c(c), .s(s));
    
//stimuli generartion
  initial begin
   a=0; b=0;
    #2 a=0; b=1;
    #2 a=1; b=0;
    #2 a=1; b=1;
    #2 $finish;
  end
  
//monitoring of input and output
  
  initial begin
    $monitor("Time=%0t, a=%b, b=%b, s=%b, c=%b", $time, a, b,s,c);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,s,c);
  end
  
endmodule
