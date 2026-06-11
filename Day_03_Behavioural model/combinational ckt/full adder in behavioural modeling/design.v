module fa(a,b,cin,s,c);
  input a,b,cin;
  output reg s,c;
  
  always @(a,b,cin)
  begin
    s = a^b^cin;
    c = (a&b)|(b&cin)|(cin&a);
  end  
endmodule
