// Code your testbench here
// or browse Examples
module bdc2ex3_tb;
  
  reg [3:0]bcd;
  wire [3:0]ex3;
  
  //named port connection 
  bdc2ex3 dut(.bcd(bcd), .ex3(ex3));
  
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
    bcd = 4'b0000;
    #2 bcd = 4'b0001;
    #2 bcd = 4'b0010;
    #2 bcd = 4'b0011;
    #2 bcd = 4'b0100;
    #2 bcd = 4'b0101;
    #2 bcd = 4'b0110;
    #2 bcd = 4'b0111;
    #2 bcd = 4'b1000;
    #2 bcd = 4'b1001;
  end
  
  initial begin
    $monitor("bcd=%b, ex3=%b",bcd,ex3);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,bcd,ex3);
  end
  
endmodule
