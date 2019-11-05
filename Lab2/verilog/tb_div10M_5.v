// iverilog tb_div10M_5.v div10M_5.v; vvp a.out; gtkwave div5.vcd.vcd;


`timescale 1 ns / 100 ps

module tb_div10M_5();

reg clock;
reg reset;

wire count_out;

div10M_5 u1 
(
    .clock(clock),
    .reset_n(reset),
    .div_clock(count_out)
);

initial begin
    $dumpfile("div5.vcd");
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
