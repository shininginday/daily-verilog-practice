module baud_gen #(
  parameter clk_freq = 50000000, //50mhz
  parameter baud_rate = 112500)
  
  (
    input clk,
    input rst,
    output reg baud_tick);
  
  localparam divider = clk_freq / baud_rate; //434
  
  reg [8:0] count; //9 bits to count 434
  
  always @ (posedge clk or posedge rst) begin
    if(rst) begin
      count <= 0;
    baud_tick <= 0;
    end
    
    else if (count == divider-1)
      begin
        baud_tick <= 1;
        count <= 0;
      end
    
    else begin
      baud_tick <= 0;
      count <= count +1;
    end
  end
endmodule


module uart_tx (
  input clk,rst,baud_tick,tx_start,
  input [7:0] tx_data,
  output reg tx,       //serial output wire
  output reg tx_busy //1 while sending
);
  
  parameter idle = 2'b00;
  parameter start = 2'b01;
  parameter data = 2'b10;
  parameter stop = 2'b11;
  
  reg [1:0] state;
  reg [7:0] shift_reg;
  reg [2:0] bit_count;
  
  always @ (posedge clk or posedge rst) begin
    if (rst) begin
      state <= idle;
      tx = 1;
      tx_busy = 0;
      bit_count = 0;
      shift_reg <= 0;
    end
  
  else begin
    case (state)
      
      idle : begin
        tx <= 1;
        tx_busy<=0;
        
        if(tx_start) begin
          shift_reg<=tx_data;
          state<=start;
          tx_busy=1;
        end
      end
      
      start: begin
        if(baud_tick)begin
          tx <= 0;
          bit_count <= 0;
          state <= data;
        end
      end
      
      data : begin
        if(baud_tick)begin
          tx <= shift_reg[0];
          shift_reg <= shift_reg>>1;
          bit_count = bit_count+1;
          
          if (bit_count==7)
            state<=stop;
        end
      end
      
      stop: begin
        if(baud_tick)begin
          tx <= 1;
          state <= idle;
        end
      end
    endcase
  end
  end
endmodule

module uart_rx(
  input clk,rst,baud_tick,rx,
  output reg [7:0] rx_data,
  output reg rx_error,
  output reg rx_done);
  
  parameter idle = 2'b00;
  parameter start = 2'b01;
  parameter data = 2'b10;
  parameter stop = 2'b11;
  
  reg [1:0] state;
  reg [2:0] bit_count;
  reg [3:0] tick_count;
  reg [7:0] shift_reg;
  
  always @(posedge clk or posedge rst) 
    begin
      if(rst)begin
        state <= idle;
        rx_data <= 0;
        rx_error <=0;
        rx_done <=0;
        bit_count <=0;
        tick_count <=0;
        shift_reg <=0;
      end
      
      else begin
        rx_done <=0; //default
        
        case (state)
          
          idle: begin
            rx_error <=0;
            
            if(rx==0)begin
              tick_count <=0;
              state <=start;
            end
          end
          
          
          start : begin
            if(baud_tick)begin
              tick_count <= tick_count + 1;
              
              if(tick_count<=7) begin
                tick_count <=0;
                bit_count <= 0;
                
                if(rx==0) begin
                  state <= data;
                end
                else
                  state <= idle;
              end
            end
          end
          
          data : begin
            if(baud_tick) begin
              tick_count = tick_count +1;
              
              if(tick_count==15)begin
                tick_count<=0;
                shift_reg <= {rx,shift_reg[7:1]};
                bit_count = bit_count + 1;
                
                if (bit_count == 7)
                  state <= stop;
              end
            end
          end
          
          stop : begin
            if(baud_tick)begin
              tick_count <= tick_count +1;
              
              if(tick_count==15)begin
                tick_count<=0;
                
                if(rx==1)begin
                rx_data<=shift_reg;
                rx_done<=1;
                rx_error<=0;
                end
                
                else begin
                  rx_error<=1;
                end
                state<= idle;
              end
              end
            end
        endcase
      end
    end
endmodule

module uart_top #(
  parameter clk_freq = 50000000,
  parameter baud_rate = 112500)
  (
    input clk,rst,
    
    input tx_start,
    input [7:0] tx_data,
    output tx_busy,
    output tx,
    
    input rx,
    output [7:0] rx_data,
    output rx_error, rx_done);
  
  wire baud_tick;
  
  baud_gen #(
    .clk_freq (clk_freq),
    .baud_rate (baud_rate)
  ) baud_inst(
    .clk (clk),
    .rst (rst),
    .baud_tick (baud_tick)
  );
  
  uart_tx tx_inst(
    .clk (clk),
    .rst (rst),
    .tx (tx),
    .baud_tick (baud_tick),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx_busy (tx_busy)
  );
  
  uart_rx rx_inst(
    .clk (clk),
    .rst (rst),
    .baud_tick(baud_tick),
    .rx(rx),
    .rx_data (rx_data),
    .rx_done (rx_done),
    .rx_error (rx_error)
  );
endmodule
