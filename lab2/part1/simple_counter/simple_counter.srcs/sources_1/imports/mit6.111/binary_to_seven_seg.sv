module binary_to_seven_seg( 
                            val_in,
                            led_out
);

    input [3:0]             val_in;  //declaring input explicitely
    output logic [6:0]      led_out;  //declaring output explicitely

    //your logic here
    //many ways to do this (syntatically)
    // assign statements with ternary operators or logical statements/equality checks
    // always_comb block with some if/else if/else logic inside
    // switch statement
    // etc.... this is up to you!

    wire num0 = ~val_in[3] & ~val_in[2] & ~val_in[1] & ~val_in[0];
    wire num1 = ~val_in[3] & ~val_in[2] & ~val_in[1] &  val_in[0];
    wire num2 = ~val_in[3] & ~val_in[2] &  val_in[1] & ~val_in[0];
    wire num3 = ~val_in[3] & ~val_in[2] &  val_in[1] &  val_in[0];

    wire num4 = ~val_in[3] &  val_in[2] & ~val_in[1] & ~val_in[0];
    wire num5 = ~val_in[3] &  val_in[2] & ~val_in[1] &  val_in[0];
    wire num6 = ~val_in[3] &  val_in[2] &  val_in[1] & ~val_in[0];
    wire num7 = ~val_in[3] &  val_in[2] &  val_in[1] &  val_in[0];

    wire num8 =  val_in[3] & ~val_in[2] & ~val_in[1] & ~val_in[0];
    wire num9 =  val_in[3] & ~val_in[2] & ~val_in[1] &  val_in[0];
    wire numA =  val_in[3] & ~val_in[2] &  val_in[1] & ~val_in[0];
    wire numB =  val_in[3] & ~val_in[2] &  val_in[1] &  val_in[0];

    wire numC =  val_in[3] &  val_in[2] & ~val_in[1] & ~val_in[0];
    wire numD =  val_in[3] &  val_in[2] & ~val_in[1] &  val_in[0];
    wire numE =  val_in[3] &  val_in[2] &  val_in[1] & ~val_in[0];
    wire numF =  val_in[3] &  val_in[2] &  val_in[1] &  val_in[0];

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

    assign led_out[0] = num0        + num2 + num3        + num5 + num6 + num7 + num8 + num9 + numA                      + numE + numF;
    assign led_out[1] = num0 + num1 + num2 + num3 + num4               + num7 + num8 + num9 + numA               + numD;
    assign led_out[2] = num0 + num1        + num3 + num4 + num5 + num6 + num7 + num8 + num9 + numA + numB        + numD;
    assign led_out[3] = num0        + num2 + num3        + num5 + num6        + num8               + numB + numC + numD + numE;

    assign led_out[4] = num0        + num2                      + num6        + num8        + numA + numB + numC + numD + numE + numF;
    assign led_out[5] = num0                      + num4 + num5 + num6        + num8 + num9 + numA + numB               + numE + numF;
    assign led_out[6] =               num2 + num3 + num4 + num5 + num6        + num8 + num9 + numA + numB + numC + numD + numE + numF;

endmodule //binary_to_hex
