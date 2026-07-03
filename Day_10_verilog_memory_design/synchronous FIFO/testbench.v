module tb_sync_fifo;

    reg        clk, rst;
    reg        wr_en, rd_en;
    reg  [7:0] wr_data;
    wire [7:0] rd_data;
    wire       full, empty;

    // instantiate
    sync_fifo dut (
        .clk    (clk),
        .rst    (rst),
        .wr_en  (wr_en),
        .rd_en  (rd_en),
        .wr_data(wr_data),
        .rd_data(rd_data),
        .full   (full),
        .empty  (empty)
    );

    // clock
    initial clk = 0;
    always #5 clk = ~clk;

    // dump
    initial begin
        $dumpfile("dump.vcd");
      $dumpvars(0, clk,rst,wr_en,rd_en,wr_data,rd_data,full,empty);
    end

    // initialise
    initial begin
        rst    = 1;
        wr_en  = 0;
        rd_en  = 0;
        wr_data= 0;
    end

    initial begin
        // Apply reset for 2 cycles
        @(posedge clk); #1;
        @(posedge clk); #1;
        rst = 0;        // release reset

        // ── TEST 1: Write 4 items ──────────────────
        @(posedge clk); #1;
        wr_en=1; wr_data=8'hA1;

        @(posedge clk); #1;
        wr_en=1; wr_data=8'hA2;

        @(posedge clk); #1;
        wr_en=1; wr_data=8'hA3;
      
       @(posedge clk); #1;
        rd_en=1;

        @(posedge clk); #1;
        wr_en=1; wr_data=8'hA4; @(posedge clk); #1;
        rd_en=0; 
      
     
        @(posedge clk); #1;
        wr_en=0;   // stop writing

        // ── TEST 2: Read 4 items ───────────────────
        // expect A1, A2, A3, A4 in order
        @(posedge clk); #1;
        rd_en=1;

        @(posedge clk); #1;
        @(posedge clk); #1;
        @(posedge clk); #1;

        @(posedge clk); #1;
        rd_en=0;   // stop reading

        // ── TEST 3: Fill FIFO completely ───────────
        @(posedge clk); #1;
        wr_en=1; wr_data=8'hB1;
        @(posedge clk); #1; wr_data=8'hB2;
        @(posedge clk); #1; wr_data=8'hB3;
        @(posedge clk); #1; wr_data=8'hB4;
        @(posedge clk); #1; wr_data=8'hB5;
        @(posedge clk); #1; wr_data=8'hB6;
        @(posedge clk); #1; wr_data=8'hB7;
        @(posedge clk); #1; wr_data=8'hB8;
        // FIFO should now be FULL
        @(posedge clk); #1;
        wr_en=0;

        // ── TEST 4: Try writing when full ──────────
        // full=1 so this write should be IGNORED
        @(posedge clk); #1;
        wr_en=1; wr_data=8'hFF;  // should not enter FIFO
        @(posedge clk); #1;
        wr_en=0;

        // ── TEST 5: Simultaneous read and write ────
        @(posedge clk); #1;
        wr_en=1; wr_data=8'hCC;
        rd_en=1;   // both at same time

        @(posedge clk); #1;
        wr_en=0;
        rd_en=0;

        #50; $finish;
    end

endmodule
