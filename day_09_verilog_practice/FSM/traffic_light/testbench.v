module tb_traffic_light;

    reg clk, rst, timer;
    wire [1:0] light;

    traffic_light dut (
        .clk(clk),
        .rst(rst),
        .timer(timer),
        .light(light)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst   = 1;
        timer = 0;
        #10 rst = 0;

        // Step through several cycles
        repeat (8) begin
            timer = 1;
            #10;
            timer = 0;
            #10;
        end

        $finish;
    end

    initial begin
        $monitor("Time=%0t state_light=%b", $time, light);
    end

endmodule
