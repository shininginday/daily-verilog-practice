module prime_num;

integer n = 5;
reg prime;

function prime_det;
    input [31:0] a;
    integer i;
    begin
        prime_det = 1;      // assume prime

        if(a < 2)
            prime_det = 0;
        else
        begin
            for(i=2; i*i<=a; i=i+1)
            begin
                if(a%i == 0)
                    prime_det = 0;
            end
        end
    end
endfunction

initial begin
    prime = prime_det(n);

    if(prime)
        $display("%0d is a prime number", n);
    else
        $display("%0d is not a prime number", n);
end

endmodule
