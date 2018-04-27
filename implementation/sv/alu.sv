module alu
    #(
        parameter N = 8     // Data bus width
    )
    (
        output logic [(N-1):0] result,
        output logic [3:0] flags,
        
        input wire [(N-1):0] a, b,
        input wire [2:0] function
    );



endmodule
