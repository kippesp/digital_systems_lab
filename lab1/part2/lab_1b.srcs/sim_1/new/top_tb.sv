`timescale 1ns / 1ps

module binhex_tb;

    logic [3:0] sw;
    logic [6:0] leds;
    
    binary_to_seven_seg my_display(.bin_in(sw), .hex_out(leds));

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
    
    initial begin
        $display("Starting Sim");
        sw = 4'b0001; //first input...set it to be "1"
        #10;//let the sim run a little bit (SystemVerilog needs some time to take place!)
        $display("Input is: %4b, Output is %7b",sw,leds);
        //Now check that a binary 1 input results in a hex-display "1":
        assert(leds==7'b0000110) else $error("Didn't draw 1 right :/");
        //you do the rest!
        
        sw = 4'b0000;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b0111111) else $error("Didn't draw 0 right :/");
        
        sw = 4'b0001;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b0000110) else $error("Didn't draw 1 right :/");
        
        sw = 4'b0010;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1011011) else $error("Didn't draw 2 right :/");
        
        sw = 4'b0011;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1001111) else $error("Didn't draw 3 right :/");
        
        sw = 4'b0100;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1100110) else $error("Didn't draw 4 right :/");
        
        sw = 4'b0101;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1101101) else $error("Didn't draw 5 right :/");
        
        sw = 4'b0110;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1111101) else $error("Didn't draw 6 right :/");
        
        sw = 4'b0111;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b0000111) else $error("Didn't draw 7 right :/");
        
        sw = 4'b1000;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1111111) else $error("Didn't draw 8 right :/");
        
        sw = 4'b1001;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1101111) else $error("Didn't draw 9 right :/");
        
        sw = 4'b1010;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1110111) else $error("Didn't draw A right :/");
        
        sw = 4'b1011;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1111100) else $error("Didn't draw B right :/");
        
        sw = 4'b1100;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1011000) else $error("Didn't draw C right :/");
        
        sw = 4'b1101;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1011110) else $error("Didn't draw D right :/");
        
        sw = 4'b1110;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1111001) else $error("Didn't draw E right :/");
        
        sw = 4'b1111;
        #10;
        $display("Input is: %4b, Output is %7b",sw,leds);
        assert(leds==7'b1110001) else $error("Didn't draw F right :/");

        $display("done");
        #10;
        $finish;
    end
endmodule
