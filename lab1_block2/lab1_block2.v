
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module lab1_block2(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

wire [3:0] A;
wire [3:0] B;
wire [3:0] SUM_OUT;

wire [3:0] SUM;
wire SUMSIGN; //show sign = 1
wire [3:0] CARRY;

wire [3:0]OVERFLOW;

//=======================================================
//  Structural coding
//=======================================================
assign LEDR[9:0] = 10'b0; // LEDs off

adder b0(SW[4], SW[0], 1'b0, SUM[0], CARRY[0]);
adder b1(SW[5], SW[1], CARRY[0], SUM[1], CARRY[1]);
adder b2(SW[6], SW[2], CARRY[1], SUM[2], CARRY[2]);
adder b3(SW[7], SW[3], CARRY[2], SUM[3], CARRY[3]);

assign SUMSIGN = SUM[3]; // honestly this is unnecessary but it makes it more readable...

// input signs are the same AND sum sign is different = oF
assign OVERFLOW[0] = (SW[3] ~^ SW[7]) & (SUM[3] ^ SW[3]);
assign OVERFLOW[1] = (SW[3] ~^ SW[7]) & (SUM[3] ^ SW[3]);
assign OVERFLOW[2] = (SW[3] ~^ SW[7]) & (SUM[3] ^ SW[3]);
assign OVERFLOW[3] = (SW[3] ~^ SW[7]) & (SUM[3] ^ SW[3]);

twoscompval dispA(SW[7:4], A);
twoscompval dispB(SW[3:0], B);
twoscompval dispSUM(SUM[3:0], SUM_OUT);

sevensegment inst_ASIGN(4'b0, 1'b1, 1'b0, ~SW[7], HEX5);
sevensegment inst_A(A, 1'b0, 1'b0, 1'b0, HEX4);
sevensegment inst_BSIGN(4'b0, 1'b1, 1'b0, ~SW[3], HEX3);
sevensegment inst_B(B, 1'b0, 1'b0, 1'b0, HEX2);
sevensegment inst_SUMSIGN(4'b0, SUMSIGN & ~OVERFLOW[0], 1'b0, ~SUMSIGN & ~OVERFLOW[0], HEX1); // will disable if SUMSIGN = 0 AND OVERFLOW = 0. If OVERFLOW = 1 ignore SUMSIGN, if OVERFLOW = 0, display SUMSIGN
sevensegment inst_SUM((SUM_OUT & ~OVERFLOW) | (4'hF & OVERFLOW) , 1'b0, 1'b0, 1'b0, HEX0); // will disp SUM_OUT if OVERFLOW = 0, 0x0F if OVERFLOW = 1

endmodule
