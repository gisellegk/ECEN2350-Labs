// iverilog -o mod10_counter_test.out mod10_counter_test.v ../verilog/mod10_counter.v
// vvp mod10_counter_test.out > mod10_counter_test.txt
// gtkwave mod10_counter_test.vcd

`timescale 1 ns / 100 ps

module mod10_counter_test();

reg clock;
reg reset;

wire [3:0]count_out;

mod10_counter u1 
(
    .clock(clock),
    .reset_n(reset),
    .count(count_out)
);

initial begin
    $dumpfile("mod10_counter_test.vcd");
    $dumpvars;
    $display("Starting simulation");
    clock=0;
    reset=0;
    #10 clock = 1; reset = 1;
    #10 clock = 0;
    #10 clock = 1; 
    #10 clock = 0; 
    #10 clock = 1; 
    #10 clock = 0; 
    #10 clock = 1; 
    #10 clock = 0;
    #10 clock = 1; 
    #10 clock = 0;
    #10 clock = 1;
    #10 clock = 0;
    #10 clock = 1;
    #10 clock = 0;
    #10 clock = 1;
    #10 clock = 0;
    #10 clock = 1; 
    #10 clock = 0; 
    #10 clock = 1; 
    #10 clock = 0; 
    #10 clock = 1; 
    #10 clock = 0;
    #10 clock = 1; 
    #10 clock = 0;
    #10 clock = 1;
    #10 clock = 0;
    #10 clock = 1;
    #10 clock = 0;
    #10 clock = 1;
    #10 clock = 0;
    #10 clock = 1; 
    #10 clock = 0; 
    #10 clock = 1; 
    #10 clock = 0; 
    #10 clock = 1; 
    #10 clock = 0;
    #10 clock = 1; 
    #10 clock = 0;
    #10 clock = 1;
    #10 clock = 0;
    #10 clock = 1;
    #10 clock = 0;

    #10 $display("Simulation ended.");
    $finish;
end

initial begin
      $monitor($time, "  clock = %b,  reset = %b,  count = %b", clock, reset, count_out);
end

endmodule
