module parallel_adder_tb;
  reg [3:0]a,b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  reg [4:0]c;

  //dut instantiation
  parallel_adder dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    
//stimuli generartion
  initial begin
   a=0101; b=0111; cin=0;
    #2 a=0110; b=1110; cin=1;
   
    #2 $finish;
  end
  
//monitoring of input and output
  
  initial begin
    $monitor("Time=%0t, a=%b, b=%b, c=%b, sum=%b, cout=%b", $time,a,b,c,sum,cout);
  end
  
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,cin,sum,cout);
  end
  
endmodule
