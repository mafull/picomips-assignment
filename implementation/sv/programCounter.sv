module programCounter
    #(
        parameter P_SIZE = 6    // Address width
    )
    (
        output logic [(P_SIZE-1):0] address,
        input wire clk, nRst
    );


always_ff @ (
    posedge clk,
    negedge nRst
) begin
    if (!nRst) address <= {P_SIZE{1'b0}};
    else begin
        address <= address + {{P_SIZE-1{1'b0}}, 1'b1};
    end        
end


endmodule
