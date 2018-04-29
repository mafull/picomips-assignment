module dataPath
    #(
        parameter N = 8,
        parameter A_SIZE = 3,
        parameter R_SIZE = 3
    )
    (
        // Outputs
        output wire [(N-1):0] displayResult,

        // Inputs
        // Control
        input wire writeReg,
        input cpuConfig::aluFunc_t aluFunc,
        input wire aluImmediate,
        // Data
        input wire [(R_SIZE-1):0] opD, opS,
        input wire [(N-1):0] opT,

        // Clock/reset
        input wire clk
    );


    wire [(N-1):0] regDOut, regSOut;


    wire [(N-1):0] aluA, aluB, aluResult;
    assign aluA = regDOut;
    assign aluB = aluImmediate ? opT : regSOut;


    assign displayResult = aluResult;


    registers
        #(
            .N(N),
            .R_SIZE(R_SIZE)
        ) re
        (
            .dOut(regDOut),
            .sOut(regSOut),

            .dataIn(aluResult),
            .dAddressIn(opD),
            .sAddressIn(opS),
            .writeEnable(writeReg),

            .clk(clk)
        );


    alu
        #(
            .N(N)
        ) al
        (
            .result(aluResult),

            .a(aluA),
            .b(aluB),
            .func(aluFunc)
        );


endmodule
