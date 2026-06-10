module reduction_operator;
  
  reg [3:0]a ;
  
  assign a=4'b0101;
  
 initial begin
   
   $display("recudtion AND of %b = %b",a,&a);  
   $display("recudtion OR of %b = %b",a,|a); 
   $display("recudtion NAND of %b = %b",a,~&a);  
   $display("recudtion NOR of %b = %b",a,~|a); 
   $display("recudtion xOR of %b = %b",a,^a); 
   $display("recudtion xNOR of %b = %b",a,~^a); 
 end  
endmodule
