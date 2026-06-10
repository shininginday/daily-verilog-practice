this code showcase the multidriver concept in the wire clearly showing how a single wire can carry the output from two or more assignments where it gives the output as "x" when the input values are different

module tb;
  
  reg a,b;
  wire c;
  
  assign c = a&b;
  assign c = a|b;
  
  initial begin
    a=0; b=0;
    #2 a=0; b=01;
    #2 a=1; b=0;
    #2 a=1; b=1;
  end
  
  initial begin
    $monitor("a=%b, b=%b, c=%b",a,b,c);
  end
endmodule
