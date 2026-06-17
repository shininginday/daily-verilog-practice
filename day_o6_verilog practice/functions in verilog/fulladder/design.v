module fa(a,b,cin,s,cout);
  input a,b,cin;
  output reg s,cout;
  
  function [1:0]fulladder(input a,b,cin);
    fulladder = {a^b^cin , (a&b)|(b&cin)|(cin&a)};
  endfunction
  
  assign {cout,s}=fulladder(a,b,cin);
endmodule
