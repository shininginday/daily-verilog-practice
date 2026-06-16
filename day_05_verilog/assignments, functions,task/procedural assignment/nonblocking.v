//tb with output
module tb;

  reg[1:0] a=2'b01, b=2'b10, c=2'b11;
  initial begin
    a<=2'b00; b<=a; c<=b;
    $display("a=%b, b=%b, c=%b",a,b,c);
    $strobe("a=%b, b=%b, c=%b",a,b,c);
  end
endmodule

//output : a=01, b=10, c=11
//a=00, b=01, c=10
