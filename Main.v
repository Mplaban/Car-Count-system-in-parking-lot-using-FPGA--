module Main (
  input Clk,
  input Reset,
  input Pin,
  input Pout,
  output [3:0] CarCount);
  wire Clkslow, Clk_deb, P;
 // wire [3:0] CarCount;
  assign P = Pout^Pin;
  Clk_Div a1 (.mClk(Clk), .Reset(Reset), .Clk190(Clkslow));
  Debouncer a2 (.Clk190(Clkslow), .Reset(Reset),.Din(P),.Dout( Clk_deb));
  Park_FSM a4 (.Clk(Clk_deb), .Reset(Reset), .Pin(Pin), .Pout(Pout), .CarCount(CarCount));
  vio_0 a5 (Clk,CarCount);

endmodule