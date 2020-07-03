module simple_counter(  input               clk_in,
                        input               rst_in,
                        input               evt_in,
                        output logic[15:0]  count_out
    );
    
    always_ff @(posedge clk_in)begin
        if(rst_in)begin
            count_out <= 16'b0; //reset signal
        end else begin
            if (evt_in) begin
                count_out <= count_out + 1;
            end    
        end
    end
endmodule