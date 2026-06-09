// Code your testbench here
// or browse Examples
module mux2to1_tb;
  reg in1,in2,s;
  wire out;
  
  //mod dut instantiation
  mux2to1 dut(in1,in2,s,out);
  
  //stimuli generation
  initial begin
    in1=0; in2=0; s=0;
    #2 in1=0; in2=0; s=1;
    #2 in1=0; in2=1; s=0;
    #2 in1=0; in2=1; s=1;
    #2 in1=1; in2=0; s=0;
    #2 in1=1; in2=0; s=1;
    #2 in1=1; in2=1; s=0;
    #2 in1=1; in2=1; s=1;
  end
   //monitoring of inputs and outputs
  
 initial begin
   $monitor("in1=%b, in2=%b, s=%d, out=%b",in1,in2,s,out);
 end
  
  //dump file and dump vars for waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,in1,in2,s,out);
  end  
endmodule
