module Debouncer (
    input Clk190,
    input Reset,
    input Din,
    output Dout);
reg A, B, C;
always@(posedge Clk190, posedge Reset)
if(Reset == 1)
begin
A <= 0;
B <= 0;
C <= 0;
end
else
begin
A <= Din;
B <= A;
C <= B;
//A2 <= Din2;
//B2 <= A2;
//C2 <= B2;
end
assign Dout = A & B & ~C;
//assign Dout2 = A2 & B2 & ~C2;
endmodule