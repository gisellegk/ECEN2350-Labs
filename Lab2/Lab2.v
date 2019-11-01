
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

reg init;
wire reset_n;
wire [3:0] num_0;
wire [3:0] num_1;
wire clock_1Hz;

//=======================================================
//  Structural coding
//=======================================================

divider div(ADC_CLK_10, reset_n, clock_1Hz);
mod10_counter counter_0(clock_1Hz, reset_n, num_0);
mod10_counter counter_1((num_0==0), reset_n, num_1);
assign reset_n = KEY[0]; // active LOW. When button is pressed, reset_n = 0 
assign LEDR[1] = clock_1Hz;

sevensegment inst_0(num_0[3:0], 0, 0, 0, HEX4);
sevensegment inst_1(num_1[3:0], 0, 0, (num_1==0), HEX5);

endmodule
