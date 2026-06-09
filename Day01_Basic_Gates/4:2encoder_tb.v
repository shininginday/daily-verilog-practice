// Code your testbench here
// or browse Examples
module dec4to2_tb;
  reg d0,d1,d2,d3;
  wire y1,y2;
  
  //mod dut instantiation
 dec4to2 dut(d0,d1,d2,d3,y1,y2);
  
  //stimuli generation
  initial begin
    d0=0; d1=0; d2=0; d3=0; 
    #2 d0=1; d1=0; d2=0; d3=0; 
    #2 d0=0; d1=1; d2=0; d3=0;
    #2 d0=0; d1=0; d2=1; d3=0;
    #2 d0=0; d1=0; d2=0; d3=1;
    #2 $finish;
  end
  
   //monitoring of inputs and outputs
  
 initial begin
   $monitor("d0=%b, d1=%b, d2=%d, d3=%b, y0=%b, y1=%b",d0,d1,d2,d3,y1,y2);
 end
  
  //dump file and dump vars for waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,d0,d1,d2,d3,y1,y2);
  end
  
endmodule
  
