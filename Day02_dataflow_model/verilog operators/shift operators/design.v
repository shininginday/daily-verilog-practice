module shift_operator;
  
  reg [7:0] op1;
  reg signed [7:0]op2;
  
 initial begin
 
    //logical left shift 
   op1=8'd10;
   $display("logical left shift 1=%0d",op1<<1);
   op1=8'b0010_0010;
   $display("logical left shift 3=%b",op1<<3);
   //logical right shift 
   op1=8'b0010_0010;
   $display("logical right shift 3=%b",op1>>2);
    op1=8'b0x10_0010;
   $display("logical right shift 3=%b",op1>>2);
   
       //arithmetic left shift 
   op2=8'd10;
   $display("arithmetic left shift 1=%0d",op2<<<1);
   op2=8'b1010_0010;
   $display("arithmetic left shift 3=%b",op2<<<3);
   //logical right shift 
   op2=8'b1010_0010;
   $display("arithmetic right shift 2=%b",op2>>>2);
    op2=8'b1x10_0010;
   $display("arithmetic right shift 2=%b",op2>>>3);
   
 end

  
endmodule
