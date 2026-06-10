module replication_operator;
  
  reg [3:0] a,b,c ;
  
 initial begin
   a=4'b1001;
   b=4'd4;
   c=4'd8;
   
   $display("%b",{5{a,b}});
   $display("%d",{2{a[0]}});
   $display("%b",{3{3'b010}});
   $display("%b",{2{b}});
     
 end  
endmodule
