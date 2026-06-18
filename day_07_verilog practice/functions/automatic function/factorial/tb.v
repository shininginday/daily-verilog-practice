module tb;
  reg [31:0]din;
  wire [63:0]dout;
  
  factorial dut(din,dout);
  initial begin
    din=5;
    $monitor ("the factorial of %d is %d", din,dout);
    #5;
    din=4;
    #5;
    din=20;
  end
endmodule
