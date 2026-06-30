module traffic_light (
    input  wire       clk,
    input  wire       rst,
    input  wire       timer,
    output reg  [1:0] light
);

    // State encoding
    parameter RED    = 2'd0;
    parameter GREEN  = 2'd1;
    parameter YELLOW = 2'd2;

    reg [1:0] state, next_state;

    // BLOCK 1 — State Register (sequential)
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= RED;
        else
            state <= next_state;
    end

    // BLOCK 2 — Next State Logic (combinational)
    always @(*) begin
        next_state = state;   // default — stay in current state
        case (state)
            RED:     next_state = timer ? GREEN  : RED;
            GREEN:   next_state = timer ? YELLOW : GREEN;
            YELLOW:  next_state = timer ? RED    : YELLOW;
            default: next_state = RED;
        endcase
    end

    // BLOCK 3 — Output Logic (combinational, Moore style)
    always @(*) begin
        case (state)
            RED:     light = 2'b00;
            GREEN:   light = 2'b01;
            YELLOW:  light = 2'b10;
            default: light = 2'b00;
        endcase
    end

endmodule
