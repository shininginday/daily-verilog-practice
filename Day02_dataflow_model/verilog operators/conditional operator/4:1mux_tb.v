module mux421_tb;
  reg [3:0]in;
  reg [1:0]s;
  wire out;

  //dut instantiation
  mux421 dut(.in(in), .s(s), .out(out));
    
//stimuli generartion
  initial begin
   in = 4'b0110;
    s=2'b00;
    #2 s=2'b11;
    #2 s=2'b01;
    #2 s=2'b10;
  end
  
//monitoring of input and output
  
  initial begin
    $monitor("Time=%0t, in=%b, s=%b, out=%b", $time,in,s,out);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,in,s,out);
  end
  
endmodule
