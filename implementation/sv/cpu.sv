module cpu
	#(
		parameter N			= 8,        // Data bus width
		parameter P_SIZE 	= 6,        // 
		parameter I_SIZE 	= N + 16    //
	)
	(
		input wire clk, nRst
	);


	// Instructions
	wire [(P_SIZE-1):0] programAddress, branchAddress;
	wire pcInc, pcBranchAbs, pcBranchRel;
	wire [(I_SIZE-1):0] instruction;
	wire [5:0] opCode;
	assign opCode = instruction[(I_SIZE-1):(I_SIZE-6)];

	// ALU
	wire [3:0] aluFlags;
	wire [2:0] aluFunction;
	wire [(N-1):0] aluResult;

	programCounter 
		#(
			.P_SIZE(P_SIZE)
		) pc
		(
			// Outputs
			.address(programAddress),

			// Inputs
			.branchAddress(branchAddress),
			.inc(pcInc),
			.branchAbs(pcBranchAbs),
			.branchRel(pcBranchRel),

			// Clock/reset
			.clk(clk), .nRst(nRst)
		);


	programMemory
		#(
			.P_SIZE(P_SIZE),
			.I_SIZE(I_SIZE)
		) pm
		(
			// Outputs
			.instruction(instruction),
			
			// Inputs
			.address(programAddress)
		);


	decoder 
		de (
			// Outputs
			.aluFunction(aluFunction),
			
			// Inputs
			.opCode(opCode),
			.aluFlags(aluFlags)
		);


	registers
		#(
			.N(N)
		) re
		(

		);



	alu
		#(
			.N(N)
		) al
		(
			// Outputs
			.result(aluResult),
			.flags(aluFlags),

			// Inputs
			.a(),
			.b(),
			.function(aluFunction)
		);


endmodule
