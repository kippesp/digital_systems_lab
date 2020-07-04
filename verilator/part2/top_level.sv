module top_level(input          clk,
                 input          rst,
                 input          bouncey,
                 output logic   clean,
                 output logic [19:0] count
             );

             debounce my_debouncer (.clk_in(clk), .rst_in(rst), .bouncey_in(bouncey), .clean_out(clean), .count_out(count));

endmodule
