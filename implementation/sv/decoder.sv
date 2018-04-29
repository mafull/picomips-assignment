

module decoder
    #(
		parameter A_SIZE = 3,	// ALU function width
		parameter O_SIZE = 6	// OpCode width
    )
    (
		// Outputs
		output cpuConfig::aluFunc_t aluFunc,
		output logic aluImmediate,
		output logic pcInc, pcBranchAbs, pcBranchRel,
		output logic writeReg,

		input cpuConfig::opCode_t opCode
		//input wire [3:0] aluFlags
	);
	

	import cpuConfig::*;


	always_comb begin
		// Set default values
		aluFunc = ALU_A;
		aluImmediate = 1'b0;
		pcInc = 1'b1;
		pcBranchAbs = 1'b0;
		pcBranchRel = 1'b0;
		writeReg = 1'b1;

		// Decode opCode
		unique case (opCode)
			NOP: ;
			LDI: begin
				aluFunc = ALU_B;
				aluImmediate = 1'b1;
			end
			ADD: begin
				aluFunc = ALU_ADD;
			end
			ADDI: begin
				aluFunc = ALU_ADD;
				aluImmediate = 1'b1;
			end
			MUL: begin
				aluFunc = ALU_MUL;
			end
		endcase
	end


endmodule
