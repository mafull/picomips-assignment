module programMemory
    #(
        parameter I_SIZE = 24,  // Instruction width
        parameter P_SIZE = 5    // Address width
    )
    (
        // Outputs
        output logic [(I_SIZE-1):0] instructionOut,

        // Inputs
        input wire [(P_SIZE-1):0] addressIn
    );


    // Storage for program memory
    logic [(I_SIZE-1):0] memory [((1 << P_SIZE)-1):0];


    // Load memory contents from .hex file
    initial $readmemh("hex/prog.hex", memory);


    // Asynchronously read program memory
    assign instructionOut = memory[addressIn];

endmodule
