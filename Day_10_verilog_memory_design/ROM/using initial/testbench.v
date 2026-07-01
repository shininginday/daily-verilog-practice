module tb_rom_case;
  reg clk;
  reg [3:0] addr;
  wire [7:0] data_out;
  
  rom_case dut(
    .clk(clk),
    .addr(addr),
    .data_out(data_out)
);
  
  initial clk=0;
    always #5 clk=~clk;

  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,dut);
  end
    
    initial addr=0;
  
  initial begin
    
    @(posedge clk); #1; addr=4'd0;
    @(posedge clk); #1; addr=4'd1;
    @(posedge clk); #1; addr=4'd2;
    @(posedge clk); #1; addr=4'd3;
    @(posedge clk); #1; addr=4'd4;
    @(posedge clk); #1; addr=4'd5;
    @(posedge clk); #1; addr=4'd6;
    @(posedge clk); #1; addr=4'd7;
    @(posedge clk); #1; addr=4'd8;
    
    @(posedge clk); #1;
    
    #20; $finish;
  end
endmodule
