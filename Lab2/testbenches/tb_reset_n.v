// iverilog -o tb_reset_n.out tb_reset_n.v ../verilog/div10M_5.v ../verilog/div10M_1.v; vvp tb_reset_n.out > tb_reset_n.txt; gtkwave tb_reset_n.vcd -g

/* ECEN 2350: Lab 2 - Effect of Reset on the Clock Dividers
This testbench shows the effect of reset on the clock dividers
when the reset is triggered on the negative edge of the clock.
*/

`timescale 1 ns / 100 ps

module tb_reset_n();

reg clock;
reg reset;
wire count_out_one;
wire count_out_five;

// 10MHz to 1Hz
div10M_1 div10M_1(
    .clock(clock),
    .reset_n(reset),
    .div_clock(count_out_one)
    );
// 10MHz to 5Hz
div10M_5 div10M_5(
    .clock(clock),
    .reset_n(reset),
    .div_clock(count_out_five)
    );
    
 always  
        #50  clock = ~clock;  // creates a 10Mhz clock

    initial 
        begin
        $dumpfile("tb_reset_n.vcd");
     
    $dumpvars;
    $display("Starting simulation");
    clock=0;
    reset=0;
    #100 reset = 1;

    #2000000000  $display("Simulation ended.");
    $finish;
        end
    initial 
      begin
        #1000 $monitor($time, "  reset = %b,  count_one = %b, count_five = &b", reset, count_out_one, count_out_five);
      end
endmodule