module picoMIPS(
	// Board outputs
	output wire [9:0] LED,
	output wire [6:0] SEG0, SEG1, SEG2, SEG3, SEG4, SEG5,

	// Board inputs
	input wire [3:0] BUTTON,
	input wire [9:0] SWITCH,

	// Clock
	input wire CLOCK
);

	wire [(cpuConfig::P_SIZE-1):0] displayPC;


	cpu
		#(
			.N(cpuConfig::N),
			.A_SIZE(cpuConfig::A_SIZE),
			.O_SIZE(cpuConfig::O_SIZE),
			.P_SIZE(cpuConfig::P_SIZE),
			.R_SIZE(cpuConfig::R_SIZE)
		) cpu_inst
		(
			.displayResult(LED[(cpuConfig::N-1):0]),
			.displayPC(displayPC),
			
			.clk(BUTTON[1]),
			.nRst(BUTTON[0])
		);


	sevenSegment seg4(
		SEG4,
		displayPC[3:0],
		1'b1
	);


	sevenSegment seg5(
		SEG5,
		displayPC[(cpuConfig::P_SIZE-1):4],
		1'b1
	);

endmodule
