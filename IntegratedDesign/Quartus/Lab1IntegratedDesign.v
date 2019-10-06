
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Lab1IntegratedDesign(

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
	reg [7:0] HEX0_OUT;
	reg [7:0] HEX1_OUT;
	reg [7:0] HEX2_OUT;
	reg [7:0] HEX3_OUT;
	reg [7:0] HEX4_OUT;
	reg [7:0] HEX5_OUT;
	reg [9:0] LED_OUT;

	wire [7:0] HEX0_1;
	wire [7:0] HEX1_1;
	wire [7:0] HEX2_1;
	wire [7:0] HEX3_1;
	wire [7:0] HEX4_1;
	wire [7:0] HEX5_1;
	wire [9:0] LED_1;

	wire [7:0] HEX0_2;
	wire [7:0] HEX1_2;
	wire [7:0] HEX2_2;
	wire [7:0] HEX3_2;
	wire [7:0] HEX4_2;
	wire [7:0] HEX5_2;
	wire [9:0] LED_2;

	wire [7:0] HEX0_3;
	wire [7:0] HEX1_3;
	wire [7:0] HEX2_3;
	wire [7:0] HEX3_3;
	wire [7:0] HEX4_3;
	wire [7:0] HEX5_3;
	wire [9:0] LED_3;



//=======================================================
//  Structural coding
//=======================================================
lab1_block1 block_1
(
	.HEX0(HEX0_1),
    .HEX1(HEX1_1),
    .HEX2(HEX2_1),
    .HEX3(HEX3_1),
    .HEX4(HEX4_1),
    .HEX5(HEX5_1),
	.LEDR(LED_1),
    .SW(SW),
	.KEY(KEY)
);
lab1_block2 block_2
(
    .HEX0(HEX0_2),
    .HEX1(HEX1_2),
    .HEX2(HEX2_2),
    .HEX3(HEX3_2),
    .HEX4(HEX4_2),
    .HEX5(HEX5_2),
	.LEDR(LED_2),
    .SW(SW),
	.KEY(KEY)
);

Lab1DesignBlock3 block_3
(
	.HEX0(HEX0_3),
    .HEX1(HEX1_3),
    .HEX2(HEX2_3),
    .HEX3(HEX3_3),
    .HEX4(HEX4_3),
    .HEX5(HEX5_3),
	.LEDR(LED_3),
    .SW(SW),
	.KEY(KEY)
);


assign LEDR[9:0] = LED_OUT[9:0];
assign HEX0 = HEX0_OUT;
assign HEX1 = HEX1_OUT;
assign HEX2 = HEX2_OUT;
assign HEX3 = HEX3_OUT;
assign HEX4 = HEX4_OUT;
assign HEX5 = HEX5_OUT;

always @ (SW[9:8]) begin
	if( SW[9:8] == 2'b00) begin
		//run code from block 1
		HEX0_OUT = HEX0_1;
		HEX1_OUT = HEX1_1;
		HEX2_OUT = HEX2_1;
		HEX3_OUT = HEX3_1;
		HEX4_OUT = HEX4_1;
		HEX5_OUT = HEX5_1;
		LED_OUT = LED_1;
	end else if( SW[9:8] == 2'b01) begin
		//run code from block 2
		HEX0_OUT = HEX0_2;
		HEX1_OUT = HEX1_2;
		HEX2_OUT = HEX2_2;
		HEX3_OUT = HEX3_2;
		HEX4_OUT = HEX4_2;
		HEX5_OUT = HEX5_2;
		LED_OUT = LED_2;
	end else begin
		//run code from block 3
		HEX0_OUT = HEX0_3;
		HEX1_OUT = HEX1_3;
		HEX2_OUT = HEX2_3;
		HEX3_OUT = HEX3_3;
		HEX4_OUT = HEX4_3;
		HEX5_OUT = HEX5_3;
		LED_OUT = LED_3;
	end
end


endmodule
