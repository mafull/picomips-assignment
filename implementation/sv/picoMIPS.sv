module picoMIPS(
	// Board outputs
	output wire [7:0] LED,
	//output wire [6:0] SEG4,

	// Board inputs
	input wire [9:0] SW,

	// Clock
	input wire clk
);

	//wire [(cpuConfig::P_SIZE-1):0] displayPC;

	/*sevenSegment seg4(
		SEG4,
		displayPC[3:0],
		1'b1
	);*/

	// Parameters
	parameter N = cpuConfig::N;
	parameter A_SIZE = cpuConfig::A_SIZE;
	parameter O_SIZE = cpuConfig::O_SIZE;
	parameter P_SIZE = cpuConfig::P_SIZE;
	parameter R_SIZE = cpuConfig::R_SIZE;


	// Control lines
	wire writeReg;
	cpuConfig::aluFunc_t aluFunc;
	wire aluImmediate;
	wire immSwitches;

	// Operands
	wire [(R_SIZE-1):0] opD;
	wire [(N-1):0] opS;


	// Control path instance
	controlPath
		#(
			.N(N),
			.A_SIZE(A_SIZE),
			.O_SIZE(O_SIZE),
			.P_SIZE(P_SIZE),
			.R_SIZE(R_SIZE)
		) cp
		(
			// Demo
			.displayPC(),
			.switchesIn(SW),

			// Outputs
			// Control
			.writeReg(writeReg),
			.aluFunc(aluFunc),
			.aluImmediate(aluImmediate),
			.immSwitches(immSwitches),
			//Data
			.opD(opD),
			.opS(opS),

			// Clock
			.clk(clk)
		);


	// Data path instance
	dataPath
		#(
			.N(N),
			.A_SIZE(A_SIZE),
			.R_SIZE(R_SIZE)
		) dp
		(
			// Demo
			.displayResult(LED),
			.switchesIn(SW),

			// Inputs
			// Control
			.writeReg(writeReg),
			.aluFunc(aluFunc),
			.aluImmediate(aluImmediate),
			.immSwitches(immSwitches),
			// Data
			.opD(opD),
			.opS(opS),

			// Clock
			.clk(clk)
		);

endmodule
