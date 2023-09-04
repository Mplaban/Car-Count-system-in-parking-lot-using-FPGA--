module Park_FSM (
  input Clk,
  input Reset,
  input Pin,
  input Pout,
  output reg[3:0] CarCount);
  reg [2:0] present_state,next_state;
//  reg [3:0] count;
  reg car_in, car_out;
  parameter start = 0, carinc = 1, check1=2, cardec=3, check2=4;
  
  
  always@(posedge Clk, posedge Reset)
  if(Reset==1)
  present_state = start;
  else
  present_state = next_state;
  
  
  always@(*)
  case(present_state)
start: if(Pout == 1 && Pin==0)
        next_state = carinc;
carinc: if(Pin == 1 && Pout ==0 )begin
        next_state = check1;
        car_in <= 1 ; car_out <= 0;
        end
        else
        next_state = carinc;
check1: if(Pout == 0 && Pin == 1)
        next_state = cardec;
        else
        next_state = carinc;
cardec: if(Pout == 1 && Pin == 0)
        begin
        next_state = check2;
        car_in <= 0; car_out <= 1;
        end
        else
        next_state = cardec;
check2:  if(Pout==0 && Pin==1) 
        next_state=cardec;
     else if (Pout==1 && Pin==0) 
        next_state=carinc;

default: next_state = start;
  endcase
  
  
  always@(posedge Clk , posedge Reset ) begin
        if (Reset==1'b1) CarCount <= 4'b0000;
        else if (car_in==1 && CarCount < 15) 
                CarCount <= CarCount + 1;
        else if (car_out==1 && CarCount>0) 
                CarCount <= CarCount - 1;
    end
    
    
//   always@(*) begin
//            CarCount = count;
//        end    
endmodule