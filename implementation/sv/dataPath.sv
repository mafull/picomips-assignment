module dataPath
    #(
        parameter N = 8,        // Data bus width
        parameter A_SIZE = 3,   // ALU function width
        parameter R_SIZE = 3    // GPR address width
    )
    (
        // Outputs
        // Demo
        output wire [(N-1):0] displayResult,

        // Inputs
        // Demo
        input wire [9:0] switchesIn,
        // Control
        input cpuConfig::aluFunc_t aluFunc,
        input wire aluImmediate,
        input wire immSwitches,
        // Data
        input wire [(R_SIZE-1):0] opD,
        input wire [(N-1):0] opS,

        // Clock/reset
        input wire clk
    );


    // GPR data out
    wire [(N-1):0] regDOut, regSOut;

    // ALU IO
    wire [(N-1):0] aluA, aluB, aluResult;
    assign aluA = regDOut;
    assign aluB = aluImmediate ? (immSwitches ? switchesIn[(N-1):0] : opS) : regSOut;

    // Demo
    assign displayResult = aluResult;


    // GPR instance
    registers
        #(
            .N(N),
            .R_SIZE(R_SIZE)
        ) re
        (
            // Outputs
            .dOut(regDOut),
            .sOut(regSOut),

            // Inputs
            .dataIn(aluResult),
            .dAddressIn(opD),
            .sAddressIn(opS[(R_SIZE-1):0]),

            // Clock
            .clk(clk)
        );


    // ALU instance
    alu
        #(
            .N(N)
        ) al
        (
            // Outputs
            .result(aluResult),

            // Inputs
            .a(aluA),
            .b(aluB),
            .func(aluFunc)
        );

endmodule
