// Code your testbench here
// or browse Examples
module ha_tb;
  reg a,b;
  wire s,c;
  
  //mod dut instantiation
  ha dut(a,b,s,c);
  
  //stimuli generation
  initial begin
    a=0; b=0;
    #2 a=0; b=1;
    #2 a=1; b=0;
    #2 a=1; b=1;
  end
   //monitoring of inputs and outputs
  
 initial begin
   $monitor("a=%b, b=%b, sum=%b, carry=%b",a,b,s,c);
 end
  
  //dump file and dump vars for waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,s,c);
  end
  
  
endmodule
