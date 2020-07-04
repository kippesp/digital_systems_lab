`timescale 1ns / 1ps

module debounce_tb;
    
    //make logics for inputs and outputs!
    logic clk;
    logic rst;
    logic in;
    logic out;
    
    debounce my_debouncer(  .clk_in(clk),
                            .rst_in(rst),
                            .bouncey_in(in),
                            .clean_out(out));                            
    
    //An always block in simulation **always** runs in the background
    //this is your standard way of making a clock below:
    //it says: every 5 ns, make clk be !clk
    //still need to initialize clk in an initial block
    always begin
        #5;  //every 5 ns switch...so period of clock is 10 ns...100 MHz clock
        clk = !clk;
    end
    
    //initial block...this is our test simulation
    initial begin
        $display("Starting Sim"); //print nice message
        clk = 0; //initialize clk (super important)
        rst = 0; //initialize rst (super important)
        in = 0; //initialize evt (super important)
        #20  //wait a little bit of time at beginning
        rst = 1; //reset system
        #20; //hold high for a few clock cycles
        rst = 0; //pull low
        #20;
        in = 1;
        #10
        in = 0;
        #30
        in = 1;
        #10
        in = 0;
        #30
        in = 1;
        #10000000
        $finish;
    
  
    end
endmodule