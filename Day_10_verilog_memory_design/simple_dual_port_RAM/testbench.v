module tb_simple_dual_port_RAM;
    reg wr_clk;
    reg wr_en;
  reg [3:0] wr_addr;
  reg [7:0] wr_data;
    
    //port b - read only
    reg rd_clk;
  reg [3:0] rd_addr;
  wire [7:0] rd_data;
  
  //dut instantiation
 
  simple_dual_port_RAM dut (
    .wr_clk(wr_clk),
    .wr_en(wr_en),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    
    //port b - read only
    .rd_clk(rd_clk),
    .rd_addr(rd_addr),
    .rd_data(rd_data)
  );
  
  // clock initialisation
  initial 
    wr_clk=0;
    always #5 wr_clk = ~wr_clk;
 
  
  initial
    rd_clk=0;
    always #5 rd_clk= ~rd_clk;
  
  
  initial begin
    wr_en = 0;
    wr_addr =0;
    wr_data = 0;
    rd_addr = 0;
  end
  
  initial begin
  wr_en=1; wr_addr=4'd0; wr_data=8'hAA; #10;
  wr_en=1; wr_addr=4'd1; wr_data=8'hAB; #10;
  wr_en=1; wr_addr=4'd2; wr_data=8'hcA; #10;
  wr_en=0;
  end
  
  initial begin
    repeat(2)
      
     #5;
    rd_addr=4'd0; #10;
    rd_addr=4'd1; #10;
    rd_addr=4'd2; #10;
    
    $finish;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
 $dumpvars(0,wr_clk,wr_en,wr_addr,wr_data,rd_clk,rd_addr,rd_data);
  end
endmodule
  
