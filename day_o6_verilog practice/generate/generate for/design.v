//nbit full adder using generate statement

module full_adder(input a,b,c,output sum,carry);
  assign sum = a^b^c;
  assign carry = (a&b) | (b&c) | (c&a);
  //assign {carry,sum} = a+b+c;       
endmodule

 //top module

module nbit_adder #(parameter n = 4) (a,b,cin,sum,carry);
  
  input [n-1:0] a,b;
  input cin;
  output [n-1:0] sum;
  output carry;
  
  wire [n:0]c;
  assign c[0] = cin;
  assign carry = c[4];
  
  genvar i;
  generate for  (i=0; i<n; i=i+1)
    begin
      full_adder fa(a[i],b[i],c[i],sum[i],c[i+1]);
    end
  endgenerate
endmodule
  
