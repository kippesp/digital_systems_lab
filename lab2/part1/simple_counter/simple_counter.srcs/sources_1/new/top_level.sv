`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2020 10:18:02 PM
// Design Name: 
// Module Name: top_level
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_level(input [15:0]        sw_in,
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

    seven_seg_controller my_controller ( .val_in(sw_in), .rst_in(btnd), .clk_in(clk_100mhz), .cat_out({ca,cb,cc,cd,ce,cf,cg}), .an_out(an));

endmodule
