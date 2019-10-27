module divider(input clock,input reset_n,output reg div_clock);

always @(posedge clock)  //Detects for positive edge of clock 
begin
     if (~reset_n)  //When reseting at a negetive edge, divides the clock in half
          div_clock <= 1'b0;
     else
          div_clock <= ~div_clock; //Otherwise just holds it
     end
endmodule
 