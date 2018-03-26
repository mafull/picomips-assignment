//-----------------------------------------------------
// File Name : regstest.sv
// Function : testbench for pMIPS 32 x n registers, %0 == 0
// Version 1 : code template for Cyclone  MLAB 
//             and true dual port sync RAM
// Author: tjk
// Last rev. 25 Oct 2012
//-----------------------------------------------------
module regstest;

parameter n = 8;

logic clk, w1, w2;
logic [n-1:0] Wdata1, Wdata2;
logic [4:0] Raddr1, Raddr2;
logic [n-1:0] Rdata1, Rdata2;

regs  #(.n(n)) r(.*);

initial
begin
  clk =  0;
  #5ns  forever #5ns clk = ~clk;
end

initial
begin
    w1 = 1; w2 = 1;
    Raddr1 = 1; Raddr2 = 2;
    Wdata1 = 11; Wdata2 = 12;

  #12 w1 = 0; w2 = 0;
  #10 Wdata1 = 0; Wdata2= 8'hFF;
  #10 w1 = 1; w2 = 1;
  #10 Raddr2 = 0; // test reg %0 
end

	

endmodule // module regstest