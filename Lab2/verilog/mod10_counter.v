/*
* OUTPUT: COUNT is a 4 bit unsigned binary # with range 0-9
*
* On every positive edge of the clock, the value of COUNT (in binary) will increase by 1.
* When the value in COUNT = 9, the counter will roll back to 0
* setting reset_n = 0 will reset the COUNT to 0, regardless of other factors. 
*/

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