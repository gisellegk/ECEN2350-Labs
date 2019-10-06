module flipsign(
    input [3:0] TWOSCOMP,
    output [3:0] SBINARY
);

assign SBINARY = ~TWOSCOMP + 1'b1;

endmodule