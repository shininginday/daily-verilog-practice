module tb_async_fifo;

    reg        wr_clk, wr_rst;
    reg        rd_clk, rd_rst;
    reg        wr_en,  rd_en;
    reg  [7:0] wr_data;
    wire [7:0] rd_data;
    wire       full, empty;

    // instantiate
    async_fifo #(
        .DEPTH    (8),
        .WIDTH    (8),
        .PTR_WIDTH(3)
    ) dut (
        .wr_clk  (wr_clk),
        .wr_rst  (wr_rst),
        .wr_en   (wr_en),
        .wr_data (wr_data),
        .full    (full),
        .rd_clk  (rd_clk),
        .rd_rst  (rd_rst),
        .rd_en   (rd_en),
        .rd_data (rd_data),
        .empty   (empty)
    );

    // write clock 100MHz
    initial wr_clk = 0;
    always #5 wr_clk = ~wr_clk;

    // read clock 62.5MHz — different speed
    initial rd_clk = 0;
    always #8 rd_clk = ~rd_clk;

    // dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,tb_async_fifo);
    end

    // initialise
    initial begin
        wr_rst  = 1;
        rd_rst  = 1;
        wr_en   = 0;
        rd_en   = 0;
        wr_data = 0;
    end

    // console monitor
    always @(posedge wr_clk)
        $display("WR t=%0t wr_en=%b data=%h full=%b",
            $time, wr_en, wr_data, full);

    always @(posedge rd_clk)
        $display("RD t=%0t rd_en=%b data=%h empty=%b",
            $time, rd_en, rd_data, empty);

    // write stimulus
    initial begin
        @(posedge wr_clk); #1;
        @(posedge wr_clk); #1;
        wr_rst = 0;

        // write 4 items
        @(posedge wr_clk); #1;
        wr_en=1; wr_data=8'hD1;
        @(posedge wr_clk); #1; wr_data=8'hD2;
        @(posedge wr_clk); #1; wr_data=8'hD3;
        @(posedge wr_clk); #1; wr_data=8'hD4;
        @(posedge wr_clk); #1;
        wr_en = 0;

        repeat(10) @(posedge wr_clk);

        // fill completely
        @(posedge wr_clk); #1;
        wr_en=1; wr_data=8'hE1;
        @(posedge wr_clk); #1; wr_data=8'hE2;
        @(posedge wr_clk); #1; wr_data=8'hE3;
        @(posedge wr_clk); #1; wr_data=8'hE4;
        @(posedge wr_clk); #1; wr_data=8'hE5;
        @(posedge wr_clk); #1; wr_data=8'hE6;
        @(posedge wr_clk); #1; wr_data=8'hE7;
        @(posedge wr_clk); #1; wr_data=8'hE8;
        @(posedge wr_clk); #1;
        wr_en = 0;

        #100;
    end

    // read stimulus
    initial begin
        @(posedge rd_clk); #1;
        @(posedge rd_clk); #1;
        rd_rst = 0;

        repeat(8) @(posedge rd_clk); #1;

        // read 4 items
        rd_en = 1;
        repeat(4) @(posedge rd_clk); #1;
        rd_en = 0;

        repeat(15) @(posedge rd_clk); #1;

        // drain remaining
        rd_en = 1;
        repeat(8) @(posedge rd_clk); #1;
        rd_en = 0;

        #50; $finish;
    end

endmodule
