module test_programCounter;

    timeunit 1ns; timeprecision 1ns;

    
    // Parameters
    parameter P_SIZE = 6;

    // Outputs
    wire [(P_SIZE-1):0] address;

    // Inputs
    logic [(P_SIZE-1):0] branchAddress;
    logic inc, branchAbs, branchRel;
    logic clk, nRst;


    // Instance
    programCounter
        #(
            .P_SIZE(P_SIZE)
        ) pc
        (
            .addressOut(address),

            .branchAddress(branchAddress),
            .inc(inc),
            .branchAbs(branchAbs),
            .branchRel(branchRel),
            
            .clk(clk),
            .nRst(nRst)
        );


    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    // Logic
    initial begin
        nRst = 1;
        inc = 0;
        branchAbs = 0;
        branchRel = 0;

        // Reset
        #5 nRst = 0;
        #5 nRst = 1;

        #2;

        // Test no operation
        #10 if (address != 0) $error("Incorrect address");

        // Test increment
        inc = 1;
        for (int i = 0; i < (2 << (P_SIZE-1)); i++) begin
            if (address != i) $error("Incorrect address");
            #10;
        end

        // Test wrap-around
        if (address != 0) $error("Incorrect address");
        inc = 0;

        // Test abssolute branch
        branchAbs = 1;
        branchAddress = 5;
        #10;
        if (address != 5) $error("Incorrect address");
        branchAbs = 0;

        // Test relative branch
        branchRel = 1;
        branchAddress = 8;
        #10;
        if (address != 13) $error("Incorrect address");
        branchRel = 0;
    end

endmodule
