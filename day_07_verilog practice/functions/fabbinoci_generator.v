module fib_gen;
  integer n_t=10;
  integer ft=0;
  integer st=1;
  integer nt;
  
  function fib(input [31:0] n);
    integer i;
    begin
      $write(ft, "\t");
      $write(st, "\t");
      for(i=3; i<=n; i=i+1)
        begin
          nt=ft+st;
          ft=st;
          st=nt;
          $write(nt, "\t");
        end
      $display();
    end
  endfunction
  
  //invokation of function
  initial
    fib(n_t);
  
  
endmodule
