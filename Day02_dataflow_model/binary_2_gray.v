//design code of 3bit binary to gray conversion
module b2g(b,g);
  input [2:0]b;
  output [2:0]g; 
  //binary to gray conversion code
  assign g[2] = b[2];
  assign g[1] = b[2]^b[1];
  assign g[0] = b[1]^b[0];  
endmodule;
