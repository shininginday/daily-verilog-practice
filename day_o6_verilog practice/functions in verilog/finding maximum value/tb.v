module max_value_tb;
    reg signed [31:0]a,b,c;
  wire signed [31:0] max_val;
  
    max_value dut(a,b,c,max_val);
  
  initial begin
    repeat(5)
      begin
        a=$random;
        b=$random;
        c=$random;
        #2;
      end
  end
  
  initial begin
    $monitor("a=%d, b=%d, c=%d, max_val=%d",a,b,c,max_val);
  end
  
endmodule
