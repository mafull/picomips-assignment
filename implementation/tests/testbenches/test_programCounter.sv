module test_programCounter;

    timeunit 1ns; timeprecision 1ns;

    
    // Parameters
    parameter P_SIZE = 4;

    // Outputs
    wire [(P_SIZE-1):0] address;

    // Inputs
	logic inc;
    logic clk;


    // Instance
    programCounter
        #(
            .P_SIZE(P_SIZE)
        ) pc
        (
            .addressOut(address),

            .inc(inc),
            
            .clk(clk)
        );


    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    // Logic
    initial begin
        // Synthesised design automatically initialises to zero
		pc.addressOut = 0;
		
        inc = 0;

        #2;

        // Test no operation
        #10 if (address != 0) $error("Incorrect address");

        // Test increment
        inc = 1;
        for (int i = 0; i < (2 << (P_SIZE-1)); i++) begin
            if (address != i) $error("Incorrect address");
            #10;
        end

        // Test wrap-around
        if (address != 0) $error("Incorrect address");
        inc = 0;
    end

endmodule
