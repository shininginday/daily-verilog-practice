module full_adder_tb;
  reg a,b,cin;
  wire s,c;
  
  //mod dut instantiation
  full_adder dut(a,b,cin,s,c);
  
  //stimuli generation
  initial begin
    a=0; b=0; cin=0;
    #2 a=0; b=0; cin=1;
    #2 a=0; b=1; cin=0;
    #2 a=0; b=1; cin=1;
    #2 a=1; b=0; cin=0;
    #2 a=1; b=0; cin=1;
    #2 a=1; b=1; cin=0;
    #2 a=1; b=1; cin=1;
  end
   //monitoring of inputs and outputs
  
 initial begin
   $monitor("a=%b, b=%b, cin=%b, sum=%b, carry=%b",a,b,cin,s,c);
 end
  
  //dump file and dump vars for waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,cin,s,c);
  end
  
  
endmodule
