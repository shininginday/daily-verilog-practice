// active region and n module jkff(j,k,clk,rst,q);
  input j,k,clk,rst;
  output reg q;
  reg qin;
  
  //assign q=qin; //acyive region
  
  always @(posedge clk or posedge rst)
    begin 
      if(rst)
        qin<=0;
      else if(j==0 & k==0)
         qin<=qin; // no change
      else if(j==0 & k==1)
        qin<=0; //reset
      else if(j==1 & k==0)
         qin<=1; //set
      else if(j==1 & k==1)
         qin<=~qin; //toggle
      q<=qin;//nb region    
    end
endmodule
