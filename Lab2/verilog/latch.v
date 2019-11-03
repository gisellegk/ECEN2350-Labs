module latch (input key_in, output reg latch_out);
    always @ (negedge key_in)
    begin
    latch_out <= ~key_in;
    end
endmodule