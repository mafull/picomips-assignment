module programMemory
    #(
        parameter P_SIZE = 6,   // Address width
        parameter I_SIZE = 24   // Instruction width
    )
    (
        output logic [(I_SIZE-1):0] instruction,
        input wire [(P_SIZE-1):0] address
    );


    // Storage for program memory
    logic [(I_SIZE-1):0] memory [((1 << P_SIZE)-1):0];


    // Load memory contents from .hex file
    initial
    	$readmemh("hex/prog.hex", memory);


    // Read program memory
    assign instruction = memory[address];


endmodule
