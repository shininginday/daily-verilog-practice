module tb;
    reg [7:0]din;
  wire dout;
  
    parity_gen dut(din,dout);
  
  initial begin
    repeat(5)
      begin
        din=$random;
       
        #2;
      end
  end
  
  initial begin
    $monitor("din=%b, parity=%b",din,dout);
  end
endmodule
