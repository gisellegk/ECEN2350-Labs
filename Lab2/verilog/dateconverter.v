/* 
   ECEN 2350: Lab 2
   Module takes number and converts to month and day.  
*/


module dateconverter(input [6:0]date, input leapYear, output [1:0]month, output [3:0]dayOnes, output [1:0]dayTens);
// leap by default is 0 for no leap year. Implement without it for now. 
@always()
begin
	if(leapYear) begin
		if(date>60)
			date = date-1;
		else if(date == 60)begin
			month = 2;
			dayOnes = 9;
			dayTens = 2;
		end
	end
	if (date <=31)
		month = 1;
	else if (31 < date && date <= 59) begin
		month = 2;
		date = date-31;
		end
	else if (59 < date)begin
		month = 3;
		date = date - 59;
	end
	dayOnes == date%10;
	dayTens == date/10;
end
endmodule