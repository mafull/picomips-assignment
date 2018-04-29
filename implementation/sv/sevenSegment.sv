module sevenSegment(
	output logic [6:0] segments,
	input wire [3:0] num,
	input wire enable
);
	
always_comb begin
	if(~enable) 	segments = ~7'b0_00_0_00_0;
	else
		case(num)
			0: 		segments = ~7'b0_11_1_11_1;		
			1: 		segments = ~7'b0_00_0_11_0;
			2: 		segments = ~7'b1_01_1_01_1;		
			3: 		segments = ~7'b1_00_1_11_1;		
			4: 		segments = ~7'b1_10_0_11_0;		
			5: 		segments = ~7'b1_10_1_10_1;		
			6: 		segments = ~7'b1_11_1_10_1;		
			7: 		segments = ~7'b0_00_0_11_1;		
			8: 		segments = ~7'b1_11_1_11_1;
			9: 		segments = ~7'b1_10_1_11_1;
			10: 	segments = ~7'b1_11_0_11_1;
			11: 	segments = ~7'b1_11_1_10_0;
			12: 	segments = ~7'b0_11_1_00_1;
			13: 	segments = ~7'b1_01_1_11_0;
			14: 	segments = ~7'b1_11_1_00_1;
			15: 	segments = ~7'b1_11_0_00_1;
		endcase
end
	
endmodule