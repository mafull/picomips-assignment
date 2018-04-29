module test_picoMIPS;

    timeunit 1ns; timeprecision 1ns;

    
    // Outputs
    wire [7:0] display;

    // Inputs
    logic clk, nRst;
    wire [3:0] BUTTON;
    assign BUTTON = {3'b0, nRst};
    

    // Instance
    picoMIPS pm(
        .LED(display),

        .BUTTON(BUTTON),

        .CLOCK(clk)
    );


    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    // Logic
    initial begin
        nRst = 1;

        #12 nRst = 0;
        #5  nRst = 1;

        #200 $stop;
    end

endmodule
