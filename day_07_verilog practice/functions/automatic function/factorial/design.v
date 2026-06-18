// Code your design here
module factorial(input[31:0]din, output reg[63:0]dout);
  
  always @ (*)
    begin
      dout=fact(din);
    end
  
  function automatic [63:0] fact (input [31:0] n);
    // function  [63:0] fact (input [31:0] n);
    begin
      if(n)
        fact=fact(n-1)*n;
      else
        fact=1;
    end
  endfunction
endmodule
