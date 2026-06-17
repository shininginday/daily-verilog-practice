module parity_gen(din,dout);
  input [7:0]din;
  output dout;
  
  function parity(input[7:0]din);
    integer i;
    reg temp;
    begin
      temp=0;
      
      for(i=0; i<=7; i++)
        temp=temp^din[i];
      parity = temp;
    end
  endfunction
  
  assign dout=parity(din);
endmodule
