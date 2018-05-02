module test_decoder;

    timeunit 1ns; timeprecision 1ns;

    import cpuConfig::*;


    // Outputs
    aluFunc_t aluFunc;
    wire aluImmediate, immSwitches, pcInc;

    // Inputs
    opCode_t opCode;
    logic demoSwitch;


    decoder
        #(
            .A_SIZE(A_SIZE),
            .O_SIZE(O_SIZE)
        ) de
        (
            .aluFunc(aluFunc),
            .aluImmediate(aluImmediate),
            .immSwitches(immSwitches),
            .pcInc(pcInc),

            .opCode(opCode),
            .demoSwitch(demoSwitch)
        );


    initial begin
        demoSwitch = 0;

        // Test load + stall instruction
        #5 opCode = LDS;
        #5 demoSwitch = 1;

        // Test both multiplication instructions
        #5 opCode = MUL;
        #5 opCode = MULI;
        #5;

    end

endmodule
