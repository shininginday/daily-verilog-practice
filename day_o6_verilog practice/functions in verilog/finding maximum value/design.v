module max_value(a,b,c,max_val);
  input signed [31:0]a,b,c;
  output reg signed [31:0]max_val;
  
  
  function integer maximum;
    input signed[31:0] a,b,c;
    begin
      if(a>b && a>c)
        maximum =a;
      else 
        if(b>c)
        maximum =b;
      else 
        maximum=c;
    end
  endfunction
  
  assign max_val=maximum(a,b,c);
  
endmodule
