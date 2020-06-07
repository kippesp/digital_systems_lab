module binary_to_seven_seg( 
                            bin_in,
                            hex_out
);

    input [3:0]             bin_in;  //declaring input explicitely
    output logic [6:0]      hex_out;  //declaring output explicitely

    //your logic here
    //many ways to do this (syntatically)
    // assign statements with ternary operators or logical statements/equality checks
    // always_comb block with some if/else if/else logic inside
    // switch statement
    // etc.... this is up to you!

endmodule //binary_to_hex