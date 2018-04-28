module decoder
    #(
		parameter A_SIZE = 3,
		parameter O_SIZE = 6
    )
    (
		// Outputs
		output logic [(A_SIZE-1):0] aluFunc,
		output logic pcInc, pcBranchAbs, pcBranchRel,

		input wire [(O_SIZE-1):0] opCode,
		//input wire [3:0] aluFlags
    );


	always_comb begin
		unique case (opCode)

		endcase
	end


endmodule
