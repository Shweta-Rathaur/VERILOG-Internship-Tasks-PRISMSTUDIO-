`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2025 17:54:50
// Design Name: 
// Module Name: vending_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vending_machine(
 input clock,
 input reset,
 input [1:0]coin,
 output reg despended
    );
    
 parameter [2:0]
  S0 = 3'b000,
  S1 = 3'b001,
  S2 = 3'b010,
  S3 = 3'b011,
  S4 = 3'b100,
  S5 = 3'b101;
  
 reg [2:0] curr_state;
 reg [2:0] next_state;
  
 always @(*)
 begin
  case(curr_state)
   S0 : begin
         if(coin==2'b01)
          next_state = S1;
         else if (coin==2'b10)
          next_state = S2;
         else
          next_state = S0;
        end
   S1 : begin
         if(coin==2'b01)
          next_state = S2;
         else if(coin==2'b10)
          next_state = S3;
         else
          next_state = S1;
        end
   S2 : begin
         if(coin==2'b01)
          next_state = S3;
         else if (coin==2'b10)
          next_state = S4;
         else
          next_state = S2;
        end
   S3 : begin
         if(coin==2'b01)
          next_state = S4;
         else if (coin==2'b10)
          next_state = S5;
         else
          next_state = S3;
        end
    S4 : begin
          if(coin==2'b01)
           next_state = S5;
          else if(coin==2'b10)
           next_state = S5;
          else
           next_state = S4;
         end
    S5 : begin
           next_state = S0;
         end
    default : next_state = S0;
   endcase
 end
 
 always @(posedge clock or posedge reset)
  begin
   if(reset)
    begin
     curr_state <= S0;
     next_state <= S0;
    end
   else
    curr_state <= next_state;
  end
  
  always @(*)
   begin
    if(curr_state==S5)
     despended <= 1'b1;
    else
     despended <= 1'b0;
   end
endmodule
