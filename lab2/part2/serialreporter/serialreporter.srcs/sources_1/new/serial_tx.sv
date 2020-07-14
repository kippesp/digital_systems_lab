module serial_tx(   input           clk_in,
                    input           rst_in,
                    input           trigger_in,
                    input [7:0]     val_in,
                    output logic    data_out);
    parameter   DIVISOR = 868; //treat this like a constant!!
    
    logic [9:0]         shift_buffer; //10 bits...interesting
    logic [31:0]        count;
    
    always @(posedge clk_in)begin

    end              
endmodule