module programCounter
	#(
		parameter P_SIZE = 6    					// Address width
	)
	(
		output logic [(P_SIZE-1):0] addressOut,		// Output address

		input logic [(P_SIZE-1):0] branchAddress,	// Branch address
		input logic inc, branchAbs, branchRel,		// Control lines

		input wire clk, nRst
	);


always_ff @ (
	posedge clk,
	negedge nRst
) begin
	if (!nRst)				addressOut <= {P_SIZE{1'b0}};							// Reset to 0
	else begin
		if (inc)			addressOut <= addressOut + {{P_SIZE-1{1'b0}}, 1'b1};	// Increment
		else if (branchRel)	addressOut <= addressOut + branchAddress;				// Add branch address
		else if (branchAbs)	addressOut <= branchAddress;							// Branch to address
		else                addressOut <= addressOut;								// Do nothing
	end        
end


endmodule
