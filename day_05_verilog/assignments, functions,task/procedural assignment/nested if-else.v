module mux421(i,s,y);
  input [3:0]i;
  input [1:0]s;
  output reg y;
  
  always @(i,s)
    begin
      if(s[0]==0)
        begin 
          if (s[1]==0)
            begin
              y=i[0];
            end
          else
            begin
              y=i[2];
            end
        end
      else
        begin 
          if (s[1]==0)
            begin
              y=i[1];
            end
          else
            begin
              y=i[3];
            end
        end
    end
endmodule

  
