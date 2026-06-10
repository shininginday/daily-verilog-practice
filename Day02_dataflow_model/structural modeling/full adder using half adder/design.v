module ha(a,b,s,c);
  input a,b;
  output s,c;
  
  assign s = a^b;
  assign c = a&b;
  
endmodule


module full_adder(a,b,cin,sum,carry);
  input a,b,cin;
  output sum, carry;
   wire w1,w2,w3;
  
  ha h1(.a(a), .b(b), .s(w1), .c(w2));
  ha h2(.a(w1), .b(cin), .s(sum), .c(w3));
  
  assign carry = w2|w3;
endmodule
