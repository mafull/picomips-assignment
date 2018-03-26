//---------------------------------------------------------
// File Name   : decoder.sv
// Function    : picoMIPS instruction decoder 
// Author: tjk
// ver 2:  // NOP, ADD, ADDI, and branches
// Last revised: 26 Oct 2012
//---------------------------------------------------------

`include "alucodes.sv"
`include "opcodes.sv"
//---------------------------------------------------------
module decoder
( input logic [5:0] opcode, // top 6 bits of instruction
input [3:0] flags, // ALU flags
// output signals
//    PC control
output logic PCincr,PCabsbranch,PCrelbranch,
//    ALU control
output logic [2:0] ALUfunc, 
// imm mux control
output logic imm,
//   register file control
output logic w
  );
   
//------------- code starts here ---------
// instruction decoder
logic takeBranch; // temp variable to control conditional branching
always_comb 
begin
  // set default output signal values for NOP instruction
   PCincr = 1'b1; // PC increments by default
	PCabsbranch = 1'b0; PCrelbranch = 1'b0;
   ALUfunc = opcode[2:0]; 
   imm=1'b0; w=1'b0; 
   takeBranch =  1'b0; 
   case(opcode)
     `NOP: ;
     `ADD,`SUB : begin // register-register
	        w = 1'b1; // write result to dest register
	      end
     `ADDI,`SUBI: begin // register-immediate
	        w = 1'b1; // write result to dest register
		  imm = 1'b1; // set ctrl signal for imm operand MUX
	      end
	 	  
    // branches
	`BEQ: takeBranch = flags[1]; // branch if Z==1
	`BNE: takeBranch = ~flags[1]; // branch if Z==0
	`BGE: takeBranch = ~flags[2]; // branch if N==0
	`BLO: takeBranch = flags[0]; // branch if C==1
	default:
	    $error("unimplemented opcode %h",opcode);
 
  endcase // opcode
  
   if(takeBranch) // branch condition is true;
   begin
      PCincr = 1'b0;
	  PCrelbranch = 1'b1; 
   end


end // always_comb


endmodule //module decoder --------------------------------