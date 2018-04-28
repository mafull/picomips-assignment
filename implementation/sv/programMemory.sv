module programMemory
    #(
        parameter I_SIZE = 24,  // Instruction width
        parameter P_SIZE = 6    // Address width
    )
    (
        output logic [(I_SIZE-1):0] instructionOut, // Selected instruction

        input wire [(P_SIZE-1):0] addressIn         // Address of required instruction
    );


    // Storage for program memory
    logic [(I_SIZE-1):0] memory [((1 << P_SIZE)-1):0];


    // Load memory contents from .hex file
    initial
    	$readmemh("prog.hex", memory);


    // Read program memory
    assign instructionOut = memory[addressIn];


endmodule
