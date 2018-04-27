module decoder
    #(

    )
    (
		output logic [2:0] aluFunction,

		input wire [5:0] opCode,
		input wire [3:0] aluFlags
    );


	always_comb begin
		unique case (opCode)

		endcase
	end


endmodule
