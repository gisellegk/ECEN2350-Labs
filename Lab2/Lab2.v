
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Lab2(

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

wire reset_n;
wire [3:0] num;
wire clockOneHz;
//=======================================================
//  Structural coding
//=======================================================

assign reset_n = ~KEY[0];
assign LEDR[1] = clockOneHz;

sevensegment inst_0(5, 0, 0, 0, HEX0);
tenMhzToHzDivider dividinator(ADC_CLK_10,reset_n,clockOneHz);



endmodule
