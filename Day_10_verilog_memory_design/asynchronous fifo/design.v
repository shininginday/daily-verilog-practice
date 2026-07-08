module async_fifo #(
    parameter DEPTH     = 8,
    parameter WIDTH     = 8,
    parameter PTR_WIDTH = 3
)(
    // write side
    input              wr_clk,
    input              wr_rst,
    input              wr_en,
    input  [WIDTH-1:0] wr_data,
    output             full,

    // read side
    input              rd_clk,
    input              rd_rst,
    input              rd_en,
    output reg [WIDTH-1:0] rd_data,
    output             empty
);

    // ── MEMORY ───────────────────────────────
    // shared between write and read
    // no need to pass as port now
    reg [WIDTH-1:0] mem [0:DEPTH-1];

    // ── WRITE POINTER ─────────────────────────
    reg  [PTR_WIDTH:0] wr_ptr_bin;   // binary
    wire [PTR_WIDTH:0] wr_ptr_gray;  // gray coded

    // ── READ POINTER ──────────────────────────
    reg  [PTR_WIDTH:0] rd_ptr_bin;   // binary
    wire [PTR_WIDTH:0] rd_ptr_gray;  // gray coded

    // ── 2-FLOP SYNC REGISTERS ─────────────────
    // wr_ptr synchronized into rd_clk domain
    reg [PTR_WIDTH:0] wr_ptr_gray_s1; // stage 1
    reg [PTR_WIDTH:0] wr_ptr_gray_s2; // stage 2 (safe)

    // rd_ptr synchronized into wr_clk domain
    reg [PTR_WIDTH:0] rd_ptr_gray_s1; // stage 1
    reg [PTR_WIDTH:0] rd_ptr_gray_s2; // stage 2 (safe)

    // ── BINARY TO GRAY CONVERSION ─────────────
    assign wr_ptr_gray = wr_ptr_bin ^ (wr_ptr_bin >> 1);
    assign rd_ptr_gray = rd_ptr_bin ^ (rd_ptr_bin >> 1);

    // ── FULL FLAG ─────────────────────────────
    // generated in WRITE domain
    // compares wr_ptr_gray with synced rd_ptr (s2)
    assign full =
        (wr_ptr_gray[PTR_WIDTH]     != rd_ptr_gray_s2[PTR_WIDTH])
        &&
        (wr_ptr_gray[PTR_WIDTH-1]   != rd_ptr_gray_s2[PTR_WIDTH-1])
        &&
        (wr_ptr_gray[PTR_WIDTH-2:0] == rd_ptr_gray_s2[PTR_WIDTH-2:0]);

    // ── EMPTY FLAG ────────────────────────────
    // generated in READ domain
    // compares rd_ptr_gray with synced wr_ptr (s2)
    assign empty = (rd_ptr_gray == wr_ptr_gray_s2);

    // ── WRITE LOGIC ───────────────────────────
    always @(posedge wr_clk or posedge wr_rst) begin
        if (wr_rst)
            wr_ptr_bin <= 0;
        else if (wr_en && !full) begin
            mem[wr_ptr_bin[PTR_WIDTH-1:0]] <= wr_data;
            wr_ptr_bin <= wr_ptr_bin + 1;
        end
    end

    // ── READ LOGIC ────────────────────────────
    always @(posedge rd_clk or posedge rd_rst) begin
        if (rd_rst) begin
            rd_ptr_bin <= 0;
            rd_data    <= 0;
        end
        else if (rd_en && !empty) begin
            rd_data    <= mem[rd_ptr_bin[PTR_WIDTH-1:0]];
            rd_ptr_bin <= rd_ptr_bin + 1;
        end
    end

    // ── SYNC wr_ptr → rd_clk domain ──────────
    // 2-flop synchronizer built inline
    // no separate module needed
    always @(posedge rd_clk or posedge rd_rst) begin
        if (rd_rst) begin
            wr_ptr_gray_s1 <= 0;
            wr_ptr_gray_s2 <= 0;
        end
        else begin
            wr_ptr_gray_s1 <= wr_ptr_gray;    // FF1
            wr_ptr_gray_s2 <= wr_ptr_gray_s1; // FF2 (safe)
        end
    end

    // ── SYNC rd_ptr → wr_clk domain ──────────
    always @(posedge wr_clk or posedge wr_rst) begin
        if (wr_rst) begin
            rd_ptr_gray_s1 <= 0;
            rd_ptr_gray_s2 <= 0;
        end
        else begin
            rd_ptr_gray_s1 <= rd_ptr_gray;    // FF1
            rd_ptr_gray_s2 <= rd_ptr_gray_s1; // FF2 (safe)
        end
    end

endmodule
