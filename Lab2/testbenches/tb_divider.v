/* 
*   Test bench for the clock divider.
*   Generates clock signal of 10ns in period.
*   Resets at the first full cycle's negetive edge
*/

`timescale 1 ns / 100 ps
module tb_divider();
    reg clock,reset_n,div_clock;

    divider UUT_divider(
        .clock    (clock),
        .reset_n (reset_n)
    );

    initial
        begin
            $dumpfile("output.vcd"); //File for GTKWave
            $dumpvars; 
            //Start of simulation
            $display(" ");
            $display("<<Starting Simulation>>");
            $display("Starting simulation at:",$time);
            $display(" ");
            
            clock = 1'b0;
            reset_n = 1'b0;
            #20
            reset_n = 1'b1;
            #100
            
            $display("Finished simulation at:", $time);
            $display("<<Ending Simulation>>");
            $display(" ");
	        $finish;
            //End of simulation
              
        end

        always 
           #10  clock =  !clock;   
endmodule

/* Compilation code and GTKWave:
 iverilog tb_divider.v divider.v; vvp a.out; gtkwave output.vcd;
*/