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
    input               load_enable,
    input        [3:0]  load,
	output		 [3:0]  count
);

reg [3:0] mod10_ctr;
assign count = mod10_ctr;

always @ (posedge clock or negedge load_enable or negedge reset_n) begin
    if(reset_n == 0)begin // reset
        mod10_ctr <= load;
        end
    else if (~load_enable ) begin
        mod10_ctr <= load;
    end
    else if (mod10_ctr != 9) // has not hit top val yet
        mod10_ctr <= mod10_ctr + 1; // keep counting up 
    else // has hit top val
        mod10_ctr <= 0; // reset
end

endmodule