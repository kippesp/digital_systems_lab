`timescale 1ns / 1ps

module binhex_tb;

    logic [3:0] sw;
    logic [6:0] leds;
    
    binary_to_seven_seg my_display(.bin_in(sw), .hex_out(leds));
    
    initial begin
        $display("Starting Sim");
        sw = 4'b0001; //first input...set it to be "1"
        #10;//let the sim run a little bit (SystemVerilog needs some time to take place!)
        $display("Input is: %4b, Output is %7b",sw,leds);
        //Now check that a binary 1 input results in a hex-display "1":
        assert(leds==7'b0000110) else $error("Didn't draw 1 right :/");
        //you do the rest!
        $finish;
    end
endmodule