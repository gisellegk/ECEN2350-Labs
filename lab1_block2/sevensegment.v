module sevensegment(
    input       [3:0]   NUM,
    input               NEGATIVE,
    input               DECIMAL,
    input               DISABLE,

    //////////// SEG7 //////////
	output		     [7:0]		SEVENSEG_OUT
);

reg [7:0] OUTPUT;

always @ (NUM[3:0], NEGATIVE, DECIMAL, DISABLE)
    begin
        if(DISABLE)
            OUTPUT[7:0] = 8'b_1111_1111;
        else 
        begin
            OUTPUT[7] = ~DECIMAL;
            if(NEGATIVE)
                OUTPUT[6:0] = 7'b_011_1111;
            else
                case(NUM[3:0])
                    8'h0:
                        OUTPUT[6:0] = 7'b_100_0000;
                    8'h1: 
                        OUTPUT[6:0] = 7'b_111_1001;
                    8'h2:
                        OUTPUT[6:0] = 7'b_010_0100;
                    8'h3:
                        OUTPUT[6:0] = 7'b_011_0000;
                    8'h4:
                        OUTPUT[6:0] = 7'b_001_1001;
                    8'h5:
                        OUTPUT[6:0] = 7'b_001_0010;
                    8'h6:
                        OUTPUT[6:0] = 7'b_000_0010;
                    8'h7:
                        OUTPUT[6:0] = 7'b_111_1000;
                    8'h8:
                        OUTPUT[6:0] = 7'b_000_0000;
                    8'h9:
                        OUTPUT[6:0] = 7'b_001_1000;
                    8'ha:
                        OUTPUT[6:0] = 7'b_000_1000;
                    8'hb:
                        OUTPUT[6:0] = 7'b_000_0011;
                    8'hc:
                        OUTPUT[6:0] = 7'b_100_0110;
                    8'hd:
                        OUTPUT[6:0] = 7'b_010_0001;
                    8'he:
                        OUTPUT[6:0] = 7'b_000_0110;
                    8'hf:
                        OUTPUT[6:0] = 7'b_000_1110;

                    default: OUTPUT[6:0] = 7'b010_0111; // this is like a lower case c. should never run, but just in case it does, it will do something.
                endcase
        end
    end

    assign SEVENSEG_OUT = OUTPUT;
    
endmodule