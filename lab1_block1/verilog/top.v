module top(
	output		     [9:0]		LEDR,
	input 		     [9:0]		SW
);

assign LEDR[9:0] = SW[9:0];

endmodule