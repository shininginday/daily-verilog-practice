module b2g_tb;
  reg [2:0]b;
  wire [2:0]g;

  //dut instantiation
  b2g dut(b,g);
    
//stimuli generartion
  initial begin
    b = 3'b000;
    #2 b = 3'b001;
    #2 b = 3'b010;
    #2 b = 3'b011;
    #2 b = 3'b100;
    #2 b = 3'b101;
    #2 b = 3'b110;
    #2 b = 3'b111;
    #2 $finish;
  end
  
//monitoring of input and output
  
  initial begin
    $monitor("Time=%0t b=%b g=%b", $time, b, g);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,b,g);
  end
  
endmodule
