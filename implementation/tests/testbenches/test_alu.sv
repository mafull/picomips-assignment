module test_alu;

    timeunit 1ns; timeprecision 1ns;

    import cpuConfig::*;

    // Parameters
    parameter N = 8;
    parameter A_SIZE = 2;


    // Outputs
    wire [(N-1):0] result;

    // Inputs
    logic [(N-1):0] a, b;
    aluFunc_t func;


    alu
        #(
            .N(N),
            .A_SIZE(A_SIZE)
        ) al
        (
            .result(result),

            .a(a),
            .b(b),
            .func(func)
        );


    initial begin
        a = 'b0;
        b = 'b0;
        func = ALU_A;

        // Test integer addition
        #5;
        a = 10;
        b = 5;
        func = ALU_ADD;
        #5 if (result != (a + b)) $error("Incorrect result");

        // Test fixed-point multiplication (positive)
        #5;
        a = 8'b01100000;    // 0.75
        b = 6;
        func = ALU_MUL;   // 0.75*6 = 4.5 (truncated to 4)
        #5 if (result != 8'b00000100) $error("Incorrect result");

        // Test fixed-point multiplication (positive)
        #5;
        a = 8'b11000000;    // -0.5
        b = 5;
        func = ALU_MUL;   // -0.5*5 = -2.5 (truncated to -2)
        #5 if (result != 8'b00000100) $error("Incorrect result");
    end

endmodule
