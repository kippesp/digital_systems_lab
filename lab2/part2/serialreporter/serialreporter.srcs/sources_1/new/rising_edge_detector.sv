module rising_edge_detector(    input           clk_in, //clock in
                                input           rst_in, //reset
                                input           in,     //long-duration input
                                output logic    out     //edge detected output active high for 1/2 clock period
    );

    //
    // EDGE DETECTOR
    //

    logic old_in;           // latched in value
    logic rising_in_pulse;  // active for 1/2 clock cycle of in

    // (in & !old_in) is a signal that indicates a "rising edge"
    assign rising_in_pulse = in & !old_in;

    always_ff @(posedge clk_in) begin
        if (rst_in) begin
            old_in <= 1'b0;
        end else begin
            old_in <= in;
        end
    end
   

endmodule