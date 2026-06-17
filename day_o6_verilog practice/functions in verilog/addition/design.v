module function_d(input signed[31:0]a,b,output signed[31:0]c);
  
  //function defnation
  function signed[31:0] sum(input signed[31:0] x, input signed[31:0]y);
    begin
      sum = x+y;
    end
  endfunction
  
  //invoking function
  assign c=sum(a,b);
endmodule
