//usually its o/p depend on the simulation, but due to race condition this code is not providing o/p

module tb;

reg a =1;
  reg b=0;
  initial
    begin
      a=b;
    end
  initial
    begin
      b=a;
    end
endmodule
