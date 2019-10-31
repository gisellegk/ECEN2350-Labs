/*
* OUTPUT: COUNT is a 4 bit unsigned binary # with range 0-9
*
* On every positive edge of the clock, the value of COUNT (in binary) will increase by 1.
* When the value in COUNT = 9, the counter will roll back to 0
* setting reset_n = 0 will reset the COUNT to 0, regardless of other factors. 
*/

module tenMhzToHzDivider(
    input               clock,
    input               reset_n,
	output 					newclock
);

reg [23:0] mod10_ctr;
reg newclocks;
assign newclock = newclocks;

initial begin
	mod10_ctr = 0;
	newclocks = 0;
end

always @ (posedge clock or negedge reset_n) begin
    if(reset_n == 0) begin //reset
        mod10_ctr <= 0;
		  newclocks <= 0;
		  end
    else if (mod10_ctr != 4999999) // has not hit top val yet
        mod10_ctr <= mod10_ctr + 1; // keep counting up 
    else // has hit top val
        begin
		  mod10_ctr <= 0; // reset
		  newclocks = ~newclocks;
		  end
	 
end

endmodule