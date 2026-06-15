code with output

module tb;

reg [3:0] a, b;
reg [4:0] sum;

initial begin
    a = 4'd4;
    b = 4'd3;

    sum = a + b;

    if(sum != 8) begin
        $display("Error detected!");
        $stop;
    end

    $display("Correct result.");
    $finish;
end

endmodule



/*output:
Error detected!
testbench.sv:16: $stop called at 0 (1s)
** VVP Stop(0) **
** Flushing output streams.
** Current simulation time is 0 ticks.*\
