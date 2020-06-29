module top_level(input [15:0]        sw,
                 input               btnd,
                 input               clk_100mhz,
                 output logic        ca,
                 output logic        cb,
                 output logic        cc,
                 output logic        cd,
                 output logic        ce,
                 output logic        cf,
                 output logic        cg,
                 output logic[7:0]   an
    );

    seven_seg_controller my_controller ( .val_in(sw), .rst_in(btnd), .clk_in(clk_100mhz), .cat_out({cg,cf,ce,cd,cc,cb,ca}), .an_out(an));

endmodule
