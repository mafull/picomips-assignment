module test_registers;

    timeunit 1ns; timeprecision 1ns;

    import cpuConfig::*;

    // Outputs
    wire [(N-1):0] dOut, sOut;

    // Inputs
    logic [(N-1):0] dataIn;
    logic [(R_SIZE-1):0] dAddress, sAddress;
    logic clk;


    registers
        #(
            .N(N),
            .R_SIZE(R_SIZE)
        ) re
        (
            .dOut(dOut),
            .sOut(sOut),

            .dataIn(dataIn),
            .dAddressIn(dAddress),
            .sAddressIn(sAddress),

            .clk(clk)
        );


    // CLock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    // Logic
    initial begin
        // Synthesised design automatically initialises to zero
        re.regs[0] = {N{1'b0}};
        re.regs[1] = {N{1'b0}};
        re.regs[2] = {N{1'b0}};
        re.regs[3] = {N{1'b0}};

        dataIn = 0;
        dAddress = 0;
        sAddress = 0;

        #2;

        // Show synchronous data write
        dataIn = -23;
        #5;
        // Show asynchronous data read
        dAddress = 2;
        #10;
        sAddress = 2;
        
        #10 $stop;
    end

endmodule