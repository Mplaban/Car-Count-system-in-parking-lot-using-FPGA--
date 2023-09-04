`timescale 1ns / 1ps

module Clk_Div(
    input mClk,
    input Reset,
    output Clk190
    );
    reg [18:0] Clk_div;
always@(posedge mClk, posedge Reset)          // Clock Divider Block
begin 
if(Reset==1)
Clk_div <= 0;
else 
Clk_div <= Clk_div + 1;
end
assign Clk190 = Clk_div[18];
endmodule
