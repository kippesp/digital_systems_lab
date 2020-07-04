module debounce(    input           clk_in, //clock in
                    input           rst_in, //reset in
                    input           bouncey_in,//raw input to the system
                    output logic    clean_out, //debounced output
                    output logic [19:0] count_out
    );

    // With a 100 MHz input clock, sample the bouncy input for 10 ms.
    // If the sample remains unchanged, output the value.

   logic [19:0] count; // is 20 bits enough?
   logic old;

   always_ff @(posedge clk_in, posedge rst_in) begin
        if (rst_in) begin
            count = 0;
            old = 0;
            clean_out = 0;
        end else begin
            // Wait for input to stabalize
            if (count < 1000000) begin
                if (bouncey_in == old) begin
                    count = count + 1;
                end else begin
                    count = 0;
                    old = bouncey_in;
                end
            end else begin
                // If input is still stabalize, hold the output.
                if (bouncey_in == old) begin
                    clean_out = old;
                end else begin
                // Otherwise, start counting again
                    count = 0;
                    old = bouncey_in;
                end
            end
        end
   end

   always_comb begin
       count_out = count;
   end

endmodule
