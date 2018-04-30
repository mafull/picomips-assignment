module alu
    #(
        parameter N = 8,        // Data bus width
        parameter A_SIZE = 3    // ALU function width
    )
    (
        output logic signed [(N-1):0] result,
        
        input wire signed [(N-1):0] a, b,
        input cpuConfig::aluFunc_t func
    );


    import cpuConfig::*;


    // Generic 8-to-16-bit multiplier
    logic signed [((2*N)-1):0] multiplyOut;
    assign multiplyOut = a * b;


    // Overall ALU
    always_comb begin
        // Default values
        result = a;
        //flags = 4'b0;

        // Function decoder
        case (func)
            ALU_A:      result = a;
            ALU_B:      result = b;
            ALU_ADD:    result = a + b;
            ALU_MUL:    result = multiplyOut[((N*2)-2):(N-1)];
        endcase

    end
endmodule
