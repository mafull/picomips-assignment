module alu
    #(
        parameter N = 8,        // Data bus width
        parameter A_SIZE = 3    // ALU function width
    )
    (
        // Outputs
        output logic signed [(N-1):0] result,   // Signed
        
        // Inputs
        input wire signed [(N-1):0] a, b,       // Signed
        input cpuConfig::aluFunc_t func
    );


    // Import ALU functions
    import cpuConfig::*;


    // Generic 8-to-16-bit signed multiplier
    logic signed [((2*N)-1):0] multiplyOut;
    assign multiplyOut = a * b;


    // Overall ALU
    always_comb begin
        // Function decoder
        unique case (func)
            ALU_A:      result = a;
            ALU_B:      result = b;
            ALU_ADD:    result = a + b;
            ALU_MUL:    result = multiplyOut[((N*2)-2):(N-1)];
            default:    result = a;
        endcase
    end
    
endmodule
