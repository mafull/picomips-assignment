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
	wire [(P_SIZE-1):0] programAddress;
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
			.address(programAddress),

			.clk(clk), .nRst(nRst)
		);


	programMemory
		#(
			.P_SIZE(P_SIZE),
			.I_SIZE(I_SIZE)
		) pm
		(
			.instruction(instruction),
			
			.address(programAddress)
		);


	decoder 
		de (
			.aluFunction(aluFunction),
			
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
			.result(aluResult),
			.flags(aluFlags),

			.a(),
			.b(),
			.function(aluFunction)
		);


endmodule
