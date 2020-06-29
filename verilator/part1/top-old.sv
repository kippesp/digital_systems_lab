//module top_level(
module top(
    input [15:0] sw,            // All sixteen slide switches
    input btnc,                 // Button to be used to select what is being displayed
                                //   displayed (UP -> 16 switches; DOWN -> internal counter CNTR1)
    input btnl,                 // When pressed, show count of presses to btnu
                                //   (priority over btnc)
    input btnu,                 // button to increment manual counter CNTR2



    clk_100mhz: Uncomment both related lines to this at the top of the xdc
    ca,cb,cc,cd,ce,cf,cg: The cathodes common to all eight seven-segment digits
    an[7:0]: The selection anodes for each seven-segment
    btnc and btnl: These will be used to select what is being displayed
    btnu: A button whose pushes one of your counters will be counting
    btnd: We'll use this button as a global reset







    input [7:0] data,             //  data to be sent
    input big_endian,             //  programmable switch, if true = big endian
    output logic [7:0] send_data  //  send_data[0] is sent first.
);


always_comb begin
    if (big_endian == 1) begin
        // reverse bits
        send_data[0] = data[7];
        send_data[1] = data[6];
        send_data[2] = data[5];
        send_data[3] = data[4];
        send_data[4] = data[3];
        send_data[5] = data[2];
        send_data[6] = data[1];
        send_data[7] = data[0];
    end else begin
        // send unchanged
        send_data = data;
    end
end

//  data is a 8 bit Verilog register.
//
//  send_data is a shift register that will send out eight bits in serial
//  fashion with send_data[0] first to a receiver.
//
//  You are unsure about whether the receiver at the other end is
//  expecting big or little endian. So you have switch that load
//  the send_data register with either little or big endian format.
//
//  Your Verilog here
//
endmodule

/*
// here is the top level with an instance of endian
// sw[7:0] is the data being transmitted
logic [7:0] ordered_data;
endian my_endian(.data(sw[7:0]), .big_endian(sw[8]), .send_data(ordered_data));
serial_tx my_tx (.clk_in(clk_100mhz), .trigger(edge_detect),
    data_in(ordered_data), .data_out(ja[0]))
*/
