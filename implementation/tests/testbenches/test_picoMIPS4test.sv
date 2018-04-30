module test_picoMIPS4test;

    timeunit 1ns; timeprecision 1ns;

    
    // Outputs
    wire [7:0] LED;

    // Inputs
    logic clk;

    logic SW8;
    logic [7:0] in;

    wire [9:0] SW;
    assign SW = {1'b0, SW8, in};
    

    // Instance
    picoMIPS4test pm(
        .LED(LED),

        .SW(SW),

        .fastclk(clk)
    );


    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    // Logic
    initial begin
        /*nRst = 1;

        #12 nRst = 0;
        #5  nRst = 1;
        */


        in = 0;
        SW8 = 0;
        #2;

        #5;

        in = -1;
        #10 SW8 = 1;
        #20 SW8 = 0;

        in = 1;
        #10 SW8 = 1;
        #20 SW8 = 0;
        in = 0;

        #200;
        #20 SW8 = 1;
        #20 SW8 = 0;
        
        #20 $stop;
    end

endmodule
