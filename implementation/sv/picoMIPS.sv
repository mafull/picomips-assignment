module picoMIPS(
	// Board outputs	
	`ifndef DEMO_MODE
		output wire [7:0] LED,
	`else
		output wire [9:0] LED,
		output wire [6:0] SEG0, SEG2,
	`endif

	// Board inputs
	input wire [9:0] SW,

	// Clock
	input wire clk
);


	`ifdef DEMO_MODE
		wire [(cpuConfig::P_SIZE-1):0] displayPC;
		wire [(cpuConfig::P_SIZE-1):0] displayOpCode;
	

		// Leftmost LED shows the clock
		assign LED[9] = clk;
		assign LED[8] = 1'b0;


		// 7-seg PC display
		sevenSegment seg0(
			SEG0,
			displayPC[3:0],
			1'b1
		);


		// 7-seg OpCode display
		sevenSegment seg2(
			SEG2,
			displayOpCode[3:0],
			1'b1
		);
	`endif	// DEMO_MODE


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
			.displayPC(displayPC),
			.displayOpCode(displayOpCode),
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
			.displayResult(LED[7:0]),
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
