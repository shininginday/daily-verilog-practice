module fs_tb;
  reg a,b,bin;
  wire d,bout;
  
  //mod dut instantiation
  fs dut(a,b,bin,d,bout);
  
  //stimuli generation
  initial begin
    a=0; b=0; bin=0; 
    #2 a=0; b=0; bin=1;  
    #2 a=0; b=1; bin=0;
    #2 a=0; b=1; bin=1;
    #2 a=1; b=0; bin=0;
    #2 a=1; b=0; bin=1;
    #2 a=1; b=1; bin=0;
    #2 a=1; b=1; bin=1;
    #2 $finish;
  end
   //monitoring of inputs and outputs
  
 initial begin
   $monitor("a=%b, b=%b, bin=%d, d=%b, bout=%b",a,b,bin,d,bout);
 end
  
  //dump file and dump vars for waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,bin,d,bout);
  end
  
endmodule
  
