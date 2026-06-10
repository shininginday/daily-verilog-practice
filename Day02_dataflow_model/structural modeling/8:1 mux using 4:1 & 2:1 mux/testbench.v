module mux8_1_tb;
  reg [7:0] i;
  reg [2:0] s;
  wire y;
  reg w1,w2;

  //dut instantiation
  mux8_1 dut(.i(i), .s(s), .y(y));
    
//stimuli generartionjavascript:void(0)
  initial begin
    i = 8'b00101101;
    s = $random;
    #2 s = $random;
    #2 s = $random;
    #2 s = $random;
    #2 s = $random;
    #2 s = $random;
    #2 $finish;
  end
  
//monitoring of input and output
  
  initial begin
    $monitor("Time=%0t, i=%b, s=%b, y=%b", $time,i,s,y);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,i,s,y);
  end
  
endmodule
