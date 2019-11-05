// iverilog -o DateConverterTest.out DateConverterTest.v ../verilog/dateconverter.v; vvp DateConverterTest.out > DateConverterTest.txt; gtkwave DateConverterTest.vcd -g
//iverilog -o DateConverterTest.out DateConverterTest.v ../verilog/dateconverter.v; vvp DateConverterTest.out; gtkwave DateConverter_test.vcd -g

`timescale 1 ns / 100 ps

module DateConverter_test();


reg [6:0] date;
reg leapYear;
wire [1:0] month;
wire [3:0] dayOnes;
wire [1:0] dayTens;

dateconverter u1 
(//module dateconverter(input [6:0]date, input leapYear, output [1:0]month, output [3:0]dayOnes, output [1:0]dayTens);
    .date(date),
    .leapYear(leapYear),
    .month(month),
    .dayOnes(dayOnes),
    .dayTens(dayTens)
);

initial begin
    $dumpfile("DateConverter_test.vcd");
    $dumpvars;
    $display("Starting simulation");
    date = 0;
    leapYear = 0;
    #990  $display("Simulation ended.");
    $finish;
end
always  
        #10  date = date + 1;  

initial begin
      #1000 $monitor($time, "  date = %b,  leapYear = %b,   month = %b,  day = %b %b", date, leapYear,month, dayTens, dayOnes);
end

endmodule
