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


cpu
	#(
		.N(8)
	) cpu_inst
	(
		.clk(CLOCK),
		.nRst(BUTTON[0])
	);


endmodule
