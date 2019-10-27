`timescale 1 ns / 100 ps
module tb_bcd();
    reg clock,reset_n;

    binary_counter UUT_bcd(
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
            #5
            reset_n = 1'b1;
            #500
            $display("");     
            $display("Finished simulation at:",$time);
            $display("<<Ending Simulation>>");
            $display(" ");
	        $finish;
            //End of simulation
              
        end

        always 
           #10  clock =  !clock;
endmodule

/* Compilation code and GTKWave:
iverilog binary_counter.v tb_bcd.v; vvp a.out; gtkwave output.vcd;
*/