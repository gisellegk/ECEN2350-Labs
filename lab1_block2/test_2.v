//iverilog -o test_2.vvp test_2.v lab1_block2.v adder.v twoscompvalue.v sevensegment.v flipsign.v
//vvp test_2.vvp
`timescale 1 ns / 100 ps
module test_2();

reg [9:0] SW_IN;
wire [7:0] HEX0;
wire [7:0] HEX1;
wire [7:0] HEX2;
wire [7:0] HEX3;
wire [7:0] HEX4;
wire [7:0] HEX5;

lab1_block2 blah
(
    .HEX0(HEX0),
    .HEX1(HEX1),
    .HEX2(HEX2),
    .HEX3(HEX3),
    .HEX4(HEX4),
    .HEX5(HEX5),
    .SW(SW_IN)
);

initial
    begin
       $dumpfile("out.vcd");
       $dumpvars;
       $display($time, "Starting Simulation");

        SW_IN[3:0] = 4'b0000;
        SW_IN[7:4] = 4'b0000;

        #20 SW_IN[3:0] = 4'b0010; // +2
        #20 $display("2 - 4 = -2");
        #20 $display("HEX1 = 8'b10111111 - negative sign");
        #20 $display("HEX0 = 8'b10100100 (2 in seven seg)");
        #20 SW_IN[7:4] = 4'b1100; // -4
        // add pos and neg #'s - no overflow 

        #20 SW_IN[3:0] = 4'b0010; // +2
        #20 $display("2 + 4 = 6");
        #20 $display("HEX1 = all 1's (no negative sign)");
        #20 $display("HEX0 = 8'b10000010 (6 in seven seg)");
        #20 SW_IN[7:4] = 4'b0100; // +4
        // add 2 positive #'s - no overflow 
        
        #20 SW_IN[3:0] = 4'b1110; // -2
        #20 $display("-2 -4 = -6");
        #20 $display("HEX1 = 8'b10111111 - negative sign");
        #20 $display("HEX0 = 8'b10000010 (6 in seven seg)");
        #20 SW_IN[7:4] = 4'b1100; // -4
        // add 2 negative #'s - no overflow 
        

        #20 SW_IN[3:0] = 4'b0111; // +7
        #20 $display("7 + 4 = 13 (0F = 11000000 10001110)");
        #20 SW_IN[7:4] = 4'b0100; // +4
        // add 2 positive #'s - overflow 
        
        #20 SW_IN[3:0] = 4'b1001; // -7
        #20 $display("-7 -4 = -13 (0F = 11000000 10001110)");
        #20 SW_IN[7:4] = 4'b1100; // -4
        // add 2 negative #'s - overflow 
        #40;
    end
initial
    begin
        $monitor("SW1: %b, SW2: %b, HEX1: %b, HEX0: %b \n",SW_IN[3:0], SW_IN[7:4], HEX1, HEX0);
    end
endmodule