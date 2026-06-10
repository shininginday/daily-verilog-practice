module concate_operator;
  
  reg [3:0] a,b,c ;
  
 initial begin
   a=4'b1001;
   b=4'd4;
   c=4'd8;
   
   $display("%b",{a,b});
   $display("%d",{a[2],c});
   $display("%b",{b,c,3'b010});
   $display("%b",{b,c,3'b010,3'd4});
     
 end  
endmodule
