module paritygenerator_tb;
  reg a,b,c;
  wire p;
  
  //mod dut instantiation
 paritygenerator dut(a,b,c,p);
  
  //stimuli generation
  initial begin
    a=0; b=0; c=0;  
    #2 a=0; b=0; c=1;
    #2 a=0; b=1; c=0;
    #2 a=0; b=1; c=1;
    #2 a=1; b=0; c=0;
    #2 a=1; b=0; c=1;
    #2 a=1; b=1; c=0;
    #2 a=1; b=1; c=1;
    #2 $finish;
  end
  
   //monitoring of inputs and outputs
  
 initial begin
   $monitor("a=%b, b=%b, c=%d, p=%b",a,b,c,p);
 end
  
  //dump file and dump vars for waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,c,p);
  end
  
endmodule
  
