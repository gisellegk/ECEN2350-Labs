module binary_counter (input wire clk, reset, output wire [3:0] num);
 
   reg [3:0] bin;	//Gives the binary equivalent of the number wanted
   wire [31:0] incr; //32 bit counter
 
   always @(posedge clk, negedge reset) 
   begin
      if (~reset) 
         bin <= 0; //resets to 0 if n_reset is true
      else
         bin <= incr;	//otherwise sets the initial register to the incremented value
	end	
	assign num  = bin;
	assign incr = bin+1; //increments the counter by one
	
endmodule