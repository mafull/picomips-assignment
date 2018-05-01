// synthesise to run on Altera DE0 for testing and demo
module picoMIPS4demo(
    input logic fastclk,  // 50MHz Altera DE0 clock
    input logic [9:0] SW, // Switches SW0..SW9
    output logic [9:0] LED, // LEDs
    output logic [6:0] SEG0, SEG2);
    
    logic clk; // slow clock, about 10Hz
    
    counter c (.fastclk(fastclk),.clk(clk)); // slow clk from counter
    
    // to obtain the cost figure, synthesise your design without the counter 
    // and the picoMIPS4test module using Cyclone IV E as target
    // and make a note of the synthesis statistics
    picoMIPS myDesign (.clk(clk), .SW(SW),.LED(LED), .SEG0(SEG0), .SEG2(SEG2));
    
  endmodule  