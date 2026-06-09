module dec2to4_tb;
  reg in1,in2;
  wire out1, out2, out3, out4;
  
  //mod dut instantiation
  dec2to4 dut(in1,in2,out1, out2, out3, out4);
  
  //stimuli generation
  initial begin
    in1=0; in2=0;  
    #2 in1=0; in2=1;  
    #2 in1=1; in2=0;  
    #2 in1=1; in2=1; 
    #2 $finish;
  end
   //monitoring of inputs and outputs
  
 initial begin
   $monitor("in1=%b, in2=%b, out1=%d, out2=%b, out3=%b out4=%b",in1,in2,out1, out2, out3, out4);
 end
  
  //dump file and dump vars for waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,in1,in2,out1, out2, out3, out4);
  end
  
endmodule
  
