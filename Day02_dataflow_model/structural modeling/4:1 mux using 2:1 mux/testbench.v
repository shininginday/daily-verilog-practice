module mux41_tb;
  reg [3:0]i;
  reg [1:0]s;
  wire y;

  //dut instantiation
  mux41 dut(.i(i), .s(s), .y(y));
    
//stimuli generartion
  initial begin
   i = 4'b0110;
    s=2'b00;
    #2 s=2'b11;
    #2 s=2'b01;
    #2 s=2'b10;
    #2 $finish;
  end
  
//monitoring of input and output
  
  initial begin
    $monitor("Time=%0t, in=%b, s=%b, y=%b", $time,i,s,y);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,i,s,y);
  end
  
endmodule
