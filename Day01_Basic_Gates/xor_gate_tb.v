// Code your testbench here
// or browse Examples
module xor_g_tb;
  reg a,b;
  wire y;
  
  //mod dut instantiation
  xor_g dut(a,b,y);
  
  //stimuli generation
  initial begin
    a=0; b=0;
    #2 a=0; b=1;
    #2 a=1; b=0;
    #2 a=1; b=1;
  end
   //monitoring of inputs and outputs
  
 initial begin
   $monitor("a=%b, b=%b, out=%b",a,b,y);
 end
  
  //dump file and dump vars for waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,y);
  end  
endmodule
  
