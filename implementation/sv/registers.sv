module registers
    #(
        parameter N = 8,
        parameter R_SIZE = 3
    )
    (
        output logic [(N-1):0] dOut, sOut,

        input wire [(N-1):0] dataIn,
        input wire [(R_SIZE-1):0] dAddressIn, sAddressIn,
        input wire writeEnable,

        input wire clk
    );


    // Register memory
    logic [(N-1):0] regs [((1 << R_SIZE)-1):0];


    // Synchronous write
    always_ff @ (
        posedge clk
    ) begin
        regs[dAddressIn] <= writeEnable ? dataIn : regs[dAddressIn];
    end


    // Asynchronous read
    assign dOut = regs[dAddressIn];
    assign sOut = regs[sAddressIn];
    

endmodule
