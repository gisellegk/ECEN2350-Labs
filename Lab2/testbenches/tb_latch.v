/* 
*   Test bench for the clock divider.
*   Generates clock signal of 10ns in period.
*   Resets at the first full cycle's negetive edge
*/

`timescale 1 ns / 100 ps
module tb_latch();
    reg key_in;

    latch UUT_latch(
        .key_in(key_in)
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
         key_in = 1'b1;
         #25
         key_in = 1'b0;
         #25
         key_in = 1'b1;
         #25
         
            $display("Finished simulation at:", $time);
            $display("<<Ending Simulation>>");
            $display(" ");
	        $finish;
            //End of simulation
              
        end
 
endmodule

/* Compilation code and GTKWave:
 iverilog tb_latch.v latch.v; vvp a.out; gtkwave output.vcd;
*/