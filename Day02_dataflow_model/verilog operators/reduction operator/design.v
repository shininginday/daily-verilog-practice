module reduction_operator;
  
  reg [3:0]a ;
  
  assign a=4'b0101;
  
 initial begin
   
   $display("reduction AND of %b = %b",a,&a);  
   $display("reduction OR of %b = %b",a,|a); 
   $display("reduction NAND of %b = %b",a,~&a);  
   $display("reduction NOR of %b = %b",a,~|a); 
   $display("reduction xOR of %b = %b",a,^a); 
   $display("reduction xNOR of %b = %b",a,~^a); 
 end  
endmodule
