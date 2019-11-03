/* 
   ECEN 2350: Lab 2
   Module acts as a key latch. Takes in a key and outputs a high value
   that is then held forever.
*/

module latch (input key_in, output reg latch_out);
    always @ (negedge key_in)
    begin
    latch_out <= ~key_in;
    end
endmodule