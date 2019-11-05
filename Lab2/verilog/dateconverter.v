/* 
   ECEN 2350: Lab 2
   Module takes number and converts to month and day.  
*/


module dateconverter(input [6:0]date, input leapYear, output [1:0]month, output [3:0]dayOnes, output [1:0]dayTens);
// leap by default is 0 for no leap year. Implement without it for now. 
reg [6:0]date_reg;

//assign outputs
reg [1:0]month_reg;
assign month = month_reg;
reg [3:0]dayOnes_reg;
assign dayOnes = dayOnes_reg;
reg [1:0]dayTens_reg;
assign dayTens = dayTens_reg;

wire leapDay = (date == 60) & leapYear;

always@(date)
begin
    date_reg = date;
	if(leapYear) begin
		if(date>60)
			date_reg = date_reg-1;
	end
    if(leapDay) begin
		month_reg = 1;
		date_reg = 29;
	end
	else if (date_reg <=31)
		month_reg = 0;
	else if (31 < date_reg && date_reg <= 59) begin
		month_reg = 1;
		date_reg = date_reg-31;
	end
	else if (59 < date_reg && date_reg <=90) begin
		month_reg = 2;
		date_reg = date_reg - 59;
	end 
    else if (90 < date_reg) begin
        month_reg = 3;
        date_reg = date_reg - 90;
    end
	dayOnes_reg = date_reg%10;
	dayTens_reg = date_reg/10;
end
endmodule