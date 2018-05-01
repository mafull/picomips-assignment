module decoder
    #(
		parameter A_SIZE = 3,	// ALU function width
		parameter O_SIZE = 6	// OpCode width
    )
    (
		// Outputs
		output cpuConfig::aluFunc_t aluFunc,
		output logic aluImmediate,
		output logic immSwitches,
		output logic pcInc,

		// Inputs
		input cpuConfig::opCode_t opCode,
		input wire demoSwitch
	);
	

	// Import OpCodes and ALU function codes
	import cpuConfig::*;


	always_comb begin
		// Set default values
		aluFunc = ALU_A;
		aluImmediate = 1'b0;
		immSwitches = 1'b0;
		pcInc = 1'b1;

		// Decode opCode
		case (opCode)
			LDI: begin
				// Load immediate value into destination register
				aluFunc = ALU_B;
				aluImmediate = 1'b1;
			end
			LDS: begin
				// Wait for SW8 to be 1
				pcInc = demoSwitch;

				// Load SW0-7 value into destination register
				aluFunc = ALU_B;
				aluImmediate = 1'b1;
				immSwitches = 1'b1;
			end
			ADD: begin
				// Add source register to destination register
				aluFunc = ALU_ADD;
			end
			ADDI: begin
				// Add immediate value to destination register
				aluFunc = ALU_ADD;
				aluImmediate = 1'b1;
			end
			MUL: begin
				// Multiply destination register by source register
				aluFunc = ALU_MUL;
			end
			MULI: begin
				// Multiply destination register by immediate value
				aluFunc = ALU_MUL;
				aluImmediate = 1'b1;
			end
			WAIT0: begin
				// Wait for SW8 to be 0
				pcInc = ~demoSwitch;
			end
			WAIT1: begin
				// Wait for SW8 to be 1
				pcInc = demoSwitch;
			end
		endcase
	end

endmodule
