module top_level(input [15:0]        sw,                // 16-bit value displayed when (not btnc) and not btnl
                 input               btnc,              // controls what to display
                 input               btnl,              // controls what to display
                 input               btnu,              // manual clock to user counter
                 input               btnd,              // global reset
                 input               clk_100mhz,
                 output logic        ca,
                 output logic        cb,
                 output logic        cc,
                 output logic        cd,
                 output logic        ce,
                 output logic        cf,
                 output logic        cg,
                 output logic [7:0]  an
    );
        
    //  btnc    btnl    MUX_out
    //  ----    ----    -------
    //  0       0       sw[15:0]
    //  0       1       num presses to btnu (user counter)
    //  1       0       automatic 10 Hz counter
    //  1       1       num presses to btnu (user counter)
    
    alias rst_in = btnd;
    
    logic btnu_debounced;
    
    debounce btnu_debounce (.clk_in(clk_100mhz), .rst_in(rst_in), .bouncey_in(btnu), .clean_out(btnu_debounced));

    //    
    // EDGE DETECTOR - btnu_debounced
    //
    
    logic old_btnu_debounced;           // latched btnu_debounced
    logic rising_btnu_debounced_pulse;  // active for 1/2 clock cycle of btnu_debounced
    
    // (btnu_debounced & !old_btnu_debounced) is a signal that indicates a "rising edge"
    assign rising_btnu_debounced_pulse = btnu_debounced & !old_btnu_debounced;
    
    always_ff @(posedge clk_100mhz) begin
        if (rst_in) begin
            old_btnu_debounced <= 1'b0;
        end else begin
            old_btnu_debounced <= btnu_debounced;
        end
    end

    //    
    // btnu PRESSES COUNTER - rising_btnu_debounced_pulse
    //
    
    logic [15:0] btnu_presses;

    simple_counter btnu_counter (.clk_in(clk_100mhz), .rst_in(rst_in), .evt_in(rising_btnu_debounced_pulse), .count_out(btnu_presses));
    
    //
    // 10 Hz Event
    //
    
    parameter PERIOD = 32'd10_000_000;
    
    logic[31:0] periodic_counter;
    logic pulse_10hz;
    
    assign pulse_10hz = (periodic_counter == PERIOD - 1);
    
    always_ff @(posedge clk_100mhz) begin
        if (rst_in) begin
            periodic_counter <= 32'b0;
        end else begin
            if (periodic_counter == PERIOD - 1) begin
                periodic_counter <= 32'b0;
            end else begin
                periodic_counter <= periodic_counter + 32'b1;
            end
        end
    end

    //    
    // 10 Hz Event COUNTER - pulse_10hz
    //
    
    logic [15:0] events_count;
    
    simple_counter counter_10hz (.clk_in(clk_100mhz), .rst_in(rst_in), .evt_in(pulse_10hz), .count_out(events_count));
    
    //
    // 3-to-1 Multiplexer
    //
    
    logic[15:0] seven_seg_4_in; 

    always_comb begin
        if ((btnc == 0) && (btnl == 0)) begin
            seven_seg_4_in = sw[15:0]; 
        end else if ((btnc == 1) && (btnl == 0)) begin
            seven_seg_4_in = events_count;
        end else begin
            seven_seg_4_in = btnu_presses;
        end
    end

    //
    // 7-segment controller
    //

    seven_seg_controller my_controller (.val_in({16'h0000, seven_seg_4_in}), .rst_in(btnd), .clk_in(clk_100mhz), .cat_out({cg,cf,ce,cd,cc,cb,ca}), .an_out(an));

endmodule