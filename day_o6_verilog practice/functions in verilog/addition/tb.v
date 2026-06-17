
  module tb;
  reg signed [31:0]a,b;
  wire signed [31:0]c;
  
  function_d dut(a,b,c);
  
  initial begin
    repeat(5)
      begin
        a=$random;
        b=$random;
        #2;
      end
  end
  
  initial begin
    $monitor("a=%d, b=%d, c=%d",a,b,c);
  end
endmodule
