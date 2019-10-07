//iverilog -o test.vvp test.v lab1_block2.v adder.v twoscompvalue.v sevensegment.v
//vvp test.vvp
`timescale 1 ns / 100 ps
module test_1();

reg [9:0] SW_IN;
reg [1:0] KEY_IN;
wire [7:0] HEX0;
wire [7:0] HEX1;
wire [7:0] HEX2;
wire [7:0] HEX3;
wire [7:0] HEX4;
wire [7:0] HEX5;
wire [7:0] LED_OUT;

lab1_block1 blah
(
    .HEX0(HEX0),
    .HEX1(HEX1),
    .HEX2(HEX2),
    .HEX3(HEX3),
    .HEX4(HEX4),
    .HEX5(HEX5),
    .SW(SW_IN),
    .LEDR(LED_OUT),
    .KEY(KEY_IN)
    //Need a key 1 
    //need a key 2
);

initial
    begin
       $dumpfile("out.vcd");
       $dumpvars;
       $display($time, "Starting Simulation");

        #20 SW_IN[7:0] = 8'b11110000; // alternate swithces
        #20 $display("switch states are 11110000\n\n");

        #20 KEY_IN[1:0] = 2'b00;

        #20 $display("LED states should be 11110000");
        #20 $display("HEX5 = 8'b11000000 0 in seven seg");
        #20 $display("HEX4 = 8'b10010000 (9 in seven seg)");
        #20 $display("HEX3 = 8'b11000000 (0 in seven seg)");
        #20 $display("HEX2 = 8'b11111001 (1 in seven seg)");
        #20 $display("HEX1 = 8'b10010000 (9 in seven seg)");
        #20 $display("HEX0 = 8'b10000000 (8 in seven seg)\n\n");
        

        #20 KEY_IN[1:0] = 2'b11; // press both buttons
        #20 $display("LED states should be 00001111");
        #20 $display("HEX5 = 8'b11000000 0 in seven seg");
        #20 $display("HEX4 = 8'b10000010 6 in seven seg)");
        #20 $display("HEX3 = 8'b11000000 (0 in seven seg)");
        #20 $display("HEX2 = 8'b10000000 (8 in seven seg)");
        #20 $display("HEX1 = 8'b10010000 (9 in seven seg)");
        #20 $display("HEX0 = 8'b10010010 (5 in seven seg)");
        #40;
    end
initial
    begin
        $monitor("SW: %b, LEDs: %b, HEX0: %b, HEX1: %b, HEX2: %b HEX3: %b, HEX4: %b, HEX5: %b, KEY %b \n",SW_IN[7:0], LED_OUT, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY_IN);//need to add keys and all switches
    end
endmodule