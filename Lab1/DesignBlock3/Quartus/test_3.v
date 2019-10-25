//iverilog -o test.vvp test.v lab1_block2.v adder.v twoscompvalue.v sevensegment.v
//vvp test.vvp
`timescale 1 ns / 100 ps
module test();

reg [9:0] SW_IN;
reg [1:0] KEY_IN;
wire [7:0] HEX0;
wire [7:0] HEX1;
wire [7:0] HEX2;
wire [7:0] HEX3;
wire [7:0] HEX4;
wire [7:0] HEX5;

Lab1DesignBlock3 blah
(
    .HEX0(HEX0),
    .HEX1(HEX1),
    .HEX2(HEX2),
    .HEX3(HEX3),
    .HEX4(HEX4),
    .HEX5(HEX5),
    .SW(SW_IN),
    .KEY(KEY_IN)
    //Need a key 1 
    //need a key 2
);

initial
    begin
       $dumpfile("out.vcd");
       $dumpvars;
       $display($time, "Starting Simulation");

        SW_IN[3:0] = 4'b0000;
        SW_IN[7:4] = 4'b0000;
        KEY_IN[1:0] = 2'b00;

        #20 SW_IN[7:0] = 8'b00000001; // alternate swithces
        #20 $display("switch states are 00000001");
        #20 $display("LED states should be 00000001");
        #20 $display("HEX4 = 8'b11000000 (0 in seven seg)");
        #20 $display("HEX0 = 8'b11111001 (1 in seven seg)");
        #40;
    end
initial
    begin
        $monitor("SW: %b, HEX0: %b, HEX4: %b \n",SW_IN[7:0], HEX0, HEX4, );//need to add keys and all switches
    end
endmodule