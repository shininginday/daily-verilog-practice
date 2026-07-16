`timescale 1ns/1ps

module tb_uart;

reg clk;
reg rst;

reg tx_start;
reg [7:0] tx_data;

wire tx;
wire tx_busy;

wire [7:0] rx_data;
wire rx_done;
wire rx_error;

// Loopback
assign rx = tx;
wire rx;

uart_top #(
    .clk_freq(50000000),
    .baud_rate(115200)
)
dut
(
    .clk(clk),
    .rst(rst),

    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .tx_busy(tx_busy),

    .rx(rx),
    .rx_data(rx_data),
    .rx_done(rx_done),
    .rx_error(rx_error)
);


//------------------------------------------------
// Clock
//------------------------------------------------

initial
    clk = 0;

always #10 clk = ~clk;


//------------------------------------------------
// Send Task
//------------------------------------------------

task send_byte;

input [7:0] data;

begin

    wait(tx_busy==0);

    @(posedge clk);

    tx_data  = data;
    tx_start = 1;

    @(posedge clk);

    tx_start = 0;

end

endtask


//------------------------------------------------
// Monitor
//------------------------------------------------

always @(posedge rx_done)
begin

    if(rx_error)

        $display("ERROR at %0t", $time);

    else

        $display("Time=%0t Received=%h", $time, rx_data);

end


//------------------------------------------------
// Test
//------------------------------------------------

initial
begin

    rst = 1;
    tx_start = 0;
    tx_data = 0;

    repeat(5) @(posedge clk);

    rst = 0;

    repeat(5) @(posedge clk);

    send_byte(8'hAA);

    wait(rx_done);

    send_byte(8'h55);

    wait(rx_done);

    send_byte(8'hF0);

    wait(rx_done);

    send_byte(8'h0F);

    wait(rx_done);

    send_byte(8'hA5);

    wait(rx_done);

    #1000;

    $finish;

end


endmodule
