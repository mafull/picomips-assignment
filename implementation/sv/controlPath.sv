module controlPath
    #(
        parameter N = 8,        // Data bus width
        parameter A_SIZE = 3,   // ALU function width
        parameter O_SIZE = 6,   // OpCode width
        parameter P_SIZE = 5,   // Program memory address width
        parameter R_SIZE = 3,   // GPR address width

        // Instruction = opCode(O) + destAddr(R) + sourceAddr/imm(N)
        parameter I_SIZE = O_SIZE + R_SIZE + N
    )
    (
        // Outputs
        // Demo
        output wire [(P_SIZE-1):0] displayPC,
        output wire [(O_SIZE-1):0] displayOpCode,
        // Control
        output cpuConfig::aluFunc_t aluFunc,
        output wire aluImmediate,
        output wire immSwitches,
        // Data
        output wire [(R_SIZE-1):0] opD,
        output wire [(N-1):0] opS,

        // Inputs
        // Demo
        input wire [9:0] switchesIn,

        // Clock
        input wire clk
    );

    
    // Instruction wires
    wire [(I_SIZE-1):0] instruction;
    cpuConfig::opCode_t opCode;
    assign {opCode, opD, opS} = instruction;

    // Program counter IO
    wire pcInc;
    wire [(P_SIZE-1):0] pcAddressOut;

    // Demo
    assign displayPC = pcAddressOut;
    assign displayOpCode = opCode;


    // Program counter instance
    programCounter
        #(
            .P_SIZE(P_SIZE)
        ) pc
        (
            // Outputs
            .addressOut(pcAddressOut),

            // Inputs
            .inc(pcInc),

            // Clock
            .clk(clk)
        );


    // Program memory instance
    programMemory
        #(
            .I_SIZE(I_SIZE),
            .P_SIZE(P_SIZE)
        ) pm
        (
            // Outputs
            .instructionOut(instruction),

            // Inputs
            .addressIn(pcAddressOut)
        );


    // Decoder instance
    decoder
        #(
            .A_SIZE(A_SIZE),
            .O_SIZE(O_SIZE)
        ) de
        (
            // Outputs
            .aluFunc(aluFunc),
            .aluImmediate(aluImmediate),
            .immSwitches(immSwitches),
            .pcInc(pcInc),
            
            // Inputs
            .opCode(opCode),
            .demoSwitch(switchesIn[8])
        );

endmodule
