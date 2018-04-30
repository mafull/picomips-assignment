module cpu
	#(
		parameter N = 8,        // Data bus width
        parameter A_SIZE = 3,   // ALU function width
        parameter O_SIZE = 6,   // OpCode width
        parameter P_SIZE = 5,   // Program memory address width
        parameter R_SIZE = 3,   // GPR address width

        // Instruction = opCode(O) + dest(R) + imm/target(N)
        parameter I_SIZE = O_SIZE + R_SIZE + N
	)
	(
		output wire [(N-1):0] displayResult,
		output wire [(P_SIZE-1):0] displayPC,
		
		input wire [9:0] switchesIn,

		input wire clk//, nRst
	);


	wire writeReg;
	cpuConfig::aluFunc_t aluFunc;
	wire aluImmediate;
	wire immSwitches;

	wire [(R_SIZE-1):0] opD;//, opS;
	wire [(N-1):0] opT;


	controlPath
		#(
			.N(N),
			.A_SIZE(A_SIZE),
			.O_SIZE(O_SIZE),
			.P_SIZE(P_SIZE),
			.R_SIZE(R_SIZE)
		) cp
		(
			.displayPC(displayPC),
			.switchesIn(switchesIn),

			.writeReg(writeReg),
			.aluFunc(aluFunc),
			.aluImmediate(aluImmediate),
			.immSwitches(immSwitches),

			.opD(opD),
			//.opS(opS),
			.opT(opT),

			.clk(clk)//,
			//.nRst(nRst)
		);


	dataPath
		#(
			.N(N),
			.A_SIZE(A_SIZE),
			.R_SIZE(R_SIZE)
		) dp
		(
			.displayResult(displayResult),
			.switchesIn(switchesIn),

			.writeReg(writeReg),
			.aluFunc(aluFunc),
			.aluImmediate(aluImmediate),
			.immSwitches(immSwitches),

			.opD(opD),
			//.opS(opS),
			.opT(opT),

			.clk(clk)
		);


endmodule
