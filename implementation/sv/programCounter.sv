module programCounter
	#(
		parameter P_SIZE = 6    					// Address width
	)
	(
		output logic [(P_SIZE-1):0] addressOut,		// Output address

		input logic inc,

		input wire clk
	);


always_ff @ (
	posedge clk
) begin
	if (inc)	addressOut <= addressOut + {{P_SIZE-1{1'b0}}, 1'b1};	// Increment
	else        addressOut <= addressOut;								// Do nothing
end


endmodule
