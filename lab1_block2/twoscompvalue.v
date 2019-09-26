module twoscompval(
    input [3:0] TWOSCOMP,
    output reg [3:0] SBINARY
);

reg PH;
always @ (TWOSCOMP[3:0])
    begin
        if(TWOSCOMP[3])
            begin
                PH = ~TWOSCOMP;
                SBINARY = PH + 1;
            end
        else 
            SBINARY = TWOSCOMP;
    end
endmodule