// iverilog -o Dividinator_test.out Dividinator_test.v ../verilog/divider.v; vvp Dividinator_test.out > Dividinator_test.txt; gtkwave Dividinator_test.vcd -g


`timescale 1 ns / 100 ps

module Dividinator_test();

reg clock;
reg reset;

wire count_out;

divider u1 
(
    .clock(clock),
    .reset_n(reset),
    .div_clock(count_out)
);

initial begin
    $dumpfile("Dividinator_test.vcd");
    $dumpvars;
    $display("Starting simulation");
    clock=0;
    reset=0;
    #5 reset = 1;

    #2000000000  $display("Simulation ended.");
    $finish;
end
always  
        #50  clock = ~clock;  // creates a 10Mhz clock

initial begin
      #1000 $monitor($time, "  reset = %b,  count = %b", reset, count_out);
end

endmodule
