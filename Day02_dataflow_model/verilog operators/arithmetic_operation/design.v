module arithmetic_operation;
  
  reg [15:0] op1, op2;
  
 initial begin
   op1=8'd25;
   op2=8'd15;
   
   //addition
   $display("addition of %0d and %0d = %0d", op1,op2,op1+op2);
   
   //subtraction
   $display("subtraction of %0d and %0d = %0d", op1,op2,op1-op2);
   
   //multiplication
   $display("multiplication of %0d and %0d = %0d", op1,op2,op1*op2);
   
   //division
   $display("division of %0d and 5 = %0d", op1,op1/5);
   
   //exponential
   $display("square of %0d = %0d", op1,op1**2);
   
   //modulus 
   $display("modulus of %0d and %0d = %0d", op1,op2,op1%op2);
 end
  
endmodule
