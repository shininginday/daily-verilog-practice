module tb;
  parameter n=32;
  
  
  reg [n-1:0] a,b;
  reg cin;
  wire [n-1:0] sum;
  wire carry;
  
  nbit_adder x(a,b,cin,sum,carry);
  
  defparam x.n = 32; //changing parameter value by calling instance 
  
  initial begin
    repeat(10)
      begin
        //a=$random;
        //b=$random;
        //cin=$random;
        {a,b,cin} = $random;
        #2;
      end
  end
  initial begin
    $monitor("the value of a=%b, b=%b, c=%b, sum=%b,carry=%b",a,b,cin,sum,carry);
  end
endmodule
