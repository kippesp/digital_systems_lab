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

    wire num0 = ~bin_in[3] & ~bin_in[2] & ~bin_in[1] & ~bin_in[0];
    wire num1 = ~bin_in[3] & ~bin_in[2] & ~bin_in[1] &  bin_in[0];
    wire num2 = ~bin_in[3] & ~bin_in[2] &  bin_in[1] & ~bin_in[0];
    wire num3 = ~bin_in[3] & ~bin_in[2] &  bin_in[1] &  bin_in[0];

    wire num4 = ~bin_in[3] &  bin_in[2] & ~bin_in[1] & ~bin_in[0];
    wire num5 = ~bin_in[3] &  bin_in[2] & ~bin_in[1] &  bin_in[0];
    wire num6 = ~bin_in[3] &  bin_in[2] &  bin_in[1] & ~bin_in[0];
    wire num7 = ~bin_in[3] &  bin_in[2] &  bin_in[1] &  bin_in[0];

    wire num8 =  bin_in[3] & ~bin_in[2] & ~bin_in[1] & ~bin_in[0];
    wire num9 =  bin_in[3] & ~bin_in[2] & ~bin_in[1] &  bin_in[0];
    wire numA =  bin_in[3] & ~bin_in[2] &  bin_in[1] & ~bin_in[0];
    wire numB =  bin_in[3] & ~bin_in[2] &  bin_in[1] &  bin_in[0];

    wire numC =  bin_in[3] &  bin_in[2] & ~bin_in[1] & ~bin_in[0];
    wire numD =  bin_in[3] &  bin_in[2] & ~bin_in[1] &  bin_in[0];
    wire numE =  bin_in[3] &  bin_in[2] &  bin_in[1] & ~bin_in[0];
    wire numF =  bin_in[3] &  bin_in[2] &  bin_in[1] &  bin_in[0];

    // Assign the appropriate segment for a given digit
    //
    //          0
    //       +-----+
    //       |     |
    //     5 |     | 1
    //       |  6  |
    //       +-----+
    //       |     |
    //     4 |     | 2
    //       |  3  |
    //       +-----+

    assign hex_out[0] = num0        + num2 + num3        + num5 + num6 + num7 + num8 + num9 + numA                      + numE + numF;
    assign hex_out[1] = num0 + num1 + num2 + num3 + num4               + num7 + num8 + num9 + numA               + numD;
    assign hex_out[2] = num0 + num1        + num3 + num4 + num5 + num6 + num7 + num8 + num9 + numA + numB        + numD;
    assign hex_out[3] = num0        + num2 + num3        + num5 + num6        + num8               + numB + numC + numD + numE;

    assign hex_out[4] = num0        + num2                      + num6        + num8        + numA + numB + numC + numD + numE + numF;
    assign hex_out[5] = num0        + num2        + num4 + num5 + num6        + num8 + num9 + numA + numB               + numE + numF;
    assign hex_out[6] =               num2 + num3 + num4 + num5 + num6        + num8 + num9 + numA + numB + numC + numD + numE + numF;

endmodule //binary_to_hex
