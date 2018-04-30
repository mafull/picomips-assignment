module picoMIPS(
	// Board outputs
	output wire [7:0] LED,
	output wire [6:0] SEG4,

	// Board inputs
	//input wire [3:0] BUTTON,
	input wire [9:0] SW,

	// Clock
	input wire clk//, nRst
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

			.switchesIn(SW),
			
			.clk(clk)//,
			//.nRst(nRst)
		);


	/*sevenSegment seg4(
		SEG4,
		displayPC[3:0],
		1'b1
	);*/

endmodule
