//-----------------------------------------------------
// File Name : prog.sv
// Function : Program memory Psize x Isize - reads from file prog.hex
// Author: tjk, 
// Last rev. 24 Oct 2012
//-----------------------------------------------------
module prog #(parameter Psize = 6, Isize = 24) // psize - address width, Isize - instruction width
(input logic [Psize-1:0] address,
output logic [Isize:0] I); // I - instruction code

// program memory declaration, note: 1<<n is same as 2^n
logic [Isize:0] progMem[ (1<<Psize)-1:0];

// get memory contents from file
initial
  $readmemh("prog.hex", progMem);
  
// program memory read 
always_comb
  I = progMem[address];
  
endmodule // end of module prog
