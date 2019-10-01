module twoscompval(
    input [3:0] TWOSCOMP,
    output reg [3:0] SBINARY
);


always @ (TWOSCOMP[3:0])
    begin
        if(TWOSCOMP[3])
            begin
                SBINARY = ~TWOSCOMP + 1'b1;
            end
        else 
            SBINARY = TWOSCOMP;
    end
endmodule