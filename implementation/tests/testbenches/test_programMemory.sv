module test_programMemory;

    timeunit 1ns; timeprecision 1ns;

    // Parameters
    parameter P_SIZE = 6;
    parameter I_SIZE = 24;


    // Outputs
    wire [(I_SIZE-1):0] instruction;

    // Inputs
    logic [(P_SIZE-1):0] address;


    programMemory
        #(
            .P_SIZE(P_SIZE),
            .I_SIZE(I_SIZE)
        ) pm
        (
            .instruction(instruction),

            .address(address)
        );


    logic [(I_SIZE-1):0] memory [((1 << P_SIZE)-1):0];
    initial begin
        // Read program into local memory
        $readmemh("prog.hex", memory);

        $monitor("Address: %h  Instruction: %h", address, instruction);

        // Check that all loaded memory is correct
        for (int i = 0; i < (2 << (P_SIZE-1)); i++) begin
            address = i;
            if (instruction != memory[address]) $error("Invalid instruction");
        end

        #10 $finish;
    end

endmodule
