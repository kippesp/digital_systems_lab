////////////////////////////////////////////////////////////////////////////
// 
// 
////////////////////////////////////////////////////////////////////////////


module top_level(   sw,
                    led,
                    led16_g,
                    led16_b,
                    led16_r,
                    btnl,
                    btnc,
                    btnr
    );
    
        //Inputs: (can also declare these inline up above)
        input[3:0]          sw; //when declaring 
        input               btnl;
        input               btnc;
        input               btnr;
        
        //Outputs:
        output logic[4:0]   led;
        output logic        led16_g;
        output logic        led16_b;
        output logic        led16_r;
             
        ////////////////////////////////////////////////////////////////////
        //Your logic here:
        assign led[0] = sw[0] | sw[1];
        assign led[1] = sw[0] ^ sw[1] ^ sw[2];
        assign led[2] = 1'b1;
        assign led[3] = 1'b0;
        assign led[4] = !(sw[1] & sw[2]);

        assign led16_b = btnc;
        assign led16_g = led[0] & led[4];
        assign led16_r = (sw[1:0] + sw[3:2]) >> 1;
        
    
endmodule //top_level 
//I usually add a comment to associate my endmodule line with the module name
//this helps when if you have multiple module definitions in a file and they are long.
