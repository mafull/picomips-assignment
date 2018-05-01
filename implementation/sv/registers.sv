module registers
    #(
        parameter N = 8,        // Data bus width
        parameter R_SIZE = 3    // GPR address width
    )
    (
        // Outputs
        output logic [(N-1):0] dOut, sOut,

        // Inputs
        input wire [(N-1):0] dataIn,
        input wire [(R_SIZE-1):0] dAddressIn, sAddressIn,

        // Clock
        input wire clk
    );


    // Register memory
    logic [(N-1):0] regs [((1 << R_SIZE)-1):0];


    // Synchronous write
    always_ff @ (
        posedge clk
    ) begin
        regs[dAddressIn] <= dataIn;
    end


    // Asynchronous read
    assign dOut = regs[dAddressIn];
    assign sOut = regs[sAddressIn];    

endmodule
