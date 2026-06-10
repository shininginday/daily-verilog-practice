module logical_operation;
  
  reg [15:0] op1, op2;
  
 initial begin
 
   
   //logical not operation
   //non zero input gives zero output
   op1=8'd10;
   $display("logical-NOT of %0d = %0d", op1,!op1);
   //zero input gives non zero output
   op1=8'd0;
   $display("logical-NOT of %0d = %0d", op1,!op1);
   
   //logical and operation
   //when both operands are non-zero it returns 1
   op1=8'd10;
   op2=8'd54;
   $display("logical-AND of %0d and %0d  = %0d", op1,op2,op1&&op2);
   //when either of the operand is 0, it returns 0
   op1=8'd54;
   op2=8'd0;
   $display("logical-AND of %0d and %0d  = %0d", op1,op2,op1&&op2);
   //when either of the operand is z/x, it returns x
   op1=8'd54;
   op2=8'dz;
   $display("logical-AND of %0d and %0d  = %0d", op1,op2,op1&&op2);
   
   
   //logical or operation
   //when both operands are zero it returns 0
   op1=8'd00;
   op2=8'd0;
   $display("logical-OR of %0d and %0d  = %0d", op1,op2,op1||op2);
   //when either of the operand is 1, it returns 1
   op1=8'd54;
   op2=8'd0;
   $display("logical-OR of %0d and %0d  = %0d", op1,op2,op1||op2);
   //when input in 0 with z/x, it returns x
   op1=8'd0;
   op2=8'dz;
   $display("logical-OR of %0d and %0d  = %0d", op1,op2,op1||op2);
   //when input in 1 with z/x, it returns 1
   op1=8'd25;
   op2=8'dz;
   $display("logical-OR of %0d and %0d  = %0d", op1,op2,op1||op2);  
 end

  
endmodule
