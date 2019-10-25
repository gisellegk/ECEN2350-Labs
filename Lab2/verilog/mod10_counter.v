module mod10_counter(
    input               clock,
    input               reset_n,
	output		 [3:0]  count
);

reg [3:0] mod10_ctr;

assign count = mod10_ctr;

always @ (posedge clock or negedge reset_n) begin
    if(reset_n == 0) // reset
        mod10_ctr <= 0;
    else if (mod10_ctr != 9) // has not hit top val yet
        mod10_ctr <= mod10_ctr + 1; // keep counting up 
    else // has hit top val
        mod10_ctr <= 0; // reset
end

endmodule