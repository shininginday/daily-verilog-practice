module palindrome;
  reg [31:0] n;
  wire p;

  function pal_check (input [31:0] a);
    integer digit;
    integer reverse;
    integer org_num;
    integer temp;
    
  begin
    reverse = 0;
    org_num = a;
    temp = a;
    
    while(temp !=0) 
      begin
        digit = temp %10;
      	reverse = reverse*10+digit;
     	temp = temp /10;
      end
    
    begin
    if (reverse == org_num)
      pal_check =1;
    else
      pal_check=0;
    end
  end
endfunction

  
  assign p = pal_check(n);
  
  initial begin
    n=121;
    #2;
  begin
  if(p)
    $display("%0d is a palindrome",n);
  else
    $display("%0d is not a palindrome",n);
  end
  end

endmodule
