module tb_single_port_ram;
  reg clk;
  reg we;
  reg[3:0] addr;
  reg [7:0] data_in;
  wire[7:0] data_out;
  
  //instantiation design
  single_port_ram dut( .clk(clk),.we(we),.addr(addr),                  .data_in(data_in),.data_out(data_out)
 );  
  
  //clk generation
  initial clk=0;
  always begin
    #5 clk=~clk;
  end
  
   initial begin
        we      = 0;
        addr    = 4'd0;
        data_in = 8'd0;
    end
  
  initial begin
        // WRITE phase
    #10;
        we=1; addr=4'd0; data_in=8'hAB; #10;
        we=1; addr=4'd1; data_in=8'hCD; #10;
        we=1; addr=4'd2; data_in=8'hEF; #10;

        // READ phase
        we=0; addr=4'd0; #10;  // expect 0xAB
        we=0; addr=4'd1; #10;  // expect 0xCD
        we=0; addr=4'd2; #10;  // expect 0xEF

        $finish;
    end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk,we,addr,data_in,data_out);
  end
    
  
endmodule
