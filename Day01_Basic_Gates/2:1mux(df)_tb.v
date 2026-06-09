//data flow model and gate level model both can have same tb

module mux2_1_tb;
  reg in1,in2,s;
  wire out;

  //dut instantiation
  mux2_1 dut(in1,in2,s,out);
    
//stimuli generartion
  initial begin
    in1=0; in2=0; s=0;
    #2 in1=0; in2=0; s=1;
    #2 in1=0; in2=1; s=0;
    #2 in1=0; in2=1; s=1;
    #2 in1=1; in2=0; s=0;
    #2 in1=1; in2=0; s=1;
    #2 in1=1; in2=1; s=0;
    #2 in1=1; in2=1; s=1;
    #2 $finish;
  end
  
//monitoring of input and output
  
  initial begin
    $monitor("in1=%d, in2=%d, s=%d, out=%d", in1,in2,s,out);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,in1,in2,s,out);
  end
  
endmodule
