module tb;
    reg a,b,cin;
  wire s,cout;
  
    fa dut(a,b,cin,s,cout);
  
  initial begin
      begin
        {a,b,cin}=3'd0;
        #2 {a,b,cin}=3'd1;
        #2 {a,b,cin}=3'd2;
        #2 {a,b,cin}=3'd3;
        #2 {a,b,cin}=3'd4;
        #2 {a,b,cin}=3'd5;
        #2 {a,b,cin}=3'd6;
        #2 {a,b,cin}=3'd7;
      end
  end
  
  initial begin
    $monitor("a=%b, b=%b, c=%b, s=%b, cout=%b",a,b,cin,s,cout);
  end
endmodule
