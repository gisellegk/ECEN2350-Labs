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
    input        [3:0]  load,
	output		 [3:0]  count,
    output       [3:0]  count_tens
);

reg [3:0] count_reg;
reg [3:0] count_tens_reg;
assign count = count_reg;
assign count_tens = count_tens_reg;

always @ (posedge clock or negedge reset_n) begin
    if(reset_n == 0) begin // reset
        count_reg <= load;
        count_tens_reg <= 0;
    end
    else if (count_reg == 9 & count_tens_reg == 9) begin// has not hit top val yet
        count_reg <= load;
        count_tens_reg <= 0;
    end
    else if (count_reg == 9) begin
        count_reg <= 0;
        count_tens_reg <= count_tens_reg + 1;
    end
    else // has hit top val
        count_reg <= count_reg + 1; // keep counting up 
end

endmodule