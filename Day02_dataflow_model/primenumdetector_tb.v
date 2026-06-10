trying both 32-bit and 3bit input in testbench

module primenumber_tb;
  
  reg a,b,c;
  wire p;
  
  //named port connection 
  primenumber dut(.a(a), .b(b), .c(c), .p(p));
  /*
  initial begin
    {a,b,c} = 0;
    #2 {a,b,c} = 1;
    #2 {a,b,c} = 2;
    #2 {a,b,c} = 3;
    #2 {a,b,c} = 4;
    #2 {a,b,c} = 5;
    #2 {a,b,c} = 6;
    #2 {a,b,c} = 7;
  end
  */
  initial begin
    {a,b,c} = 3'b000;
    #2 {a,b,c} = 3'b001;
    #2 {a,b,c} = 3'b010;
    #2 {a,b,c} = 3'b011;
    #2 {a,b,c} = 3'b100;
    #2 {a,b,c} = 3'b101;
    #2 {a,b,c} = 3'b110;
    #2 {a,b,c} = 3'b111;
  end
  
  initial begin
    $monitor("a=%b, b=%b, c=%b, p=%b",a,b,c,p);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,a,b,c,p);
  end
  
endmodule
