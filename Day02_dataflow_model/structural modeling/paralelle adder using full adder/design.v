module full_adder(a,b,cin,sum,cout);
  input a,b,cin;
  output sum,cout;
  
  assign sum = a^b^cin;
  assign cout = (a&b)|(b&cin)|(cin&a); 
  
endmodule


module parallel_adder 
  # (parameter n=4)
  (a,b,cin,sum,cout);
  input [n-1:0]a,b;
  input cin;
  output [n-1:0]sum;
  output cout;
  wire [n:0]c;
  
  assign c[0]=cin;
  assign cout = c[4];
  
  full_adder f1(.a(a[0]), .b(b[0]), .cin(c[0]), .sum(sum[0]), .cout(c[1]));
  full_adder f2(.a(a[1]), .b(b[1]), .cin(c[1]), .sum(sum[1]), .cout(c[2]));
  full_adder f3(.a(a[2]), .b(b[2]), .cin(c[2]), .sum(sum[2]), .cout(c[3]));
  full_adder f4(.a(a[3]), .b(b[3]), .cin(c[3]), .sum(sum[3]), .cout(cout));
    
endmodule
