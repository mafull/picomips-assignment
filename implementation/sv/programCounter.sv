module programCounter
	#(
		parameter P_SIZE = 6    // Address width
	)
	(
		// Outputs
		output logic [(P_SIZE-1):0] addressOut,

		// Inputs
		input logic inc,

		// Clock
		input wire clk
	);


	always_ff @ (
		posedge clk
	) begin
		if (inc)	// Increment
			addressOut <= addressOut + {{P_SIZE-1{1'b0}}, 1'b1};
		else		// Do nothing
			addressOut <= addressOut;
	end

endmodule
