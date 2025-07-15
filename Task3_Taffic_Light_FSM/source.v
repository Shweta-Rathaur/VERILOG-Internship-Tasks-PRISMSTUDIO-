`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2025 11:03:21
// Design Name: 
// Module Name: Mealey_traffic
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


module Mealey_traffic(
 input clock,
 input reset,
 output reg [1:0] Highway,
 output reg [1:0] Cityroad,
 input [2:0] carCount
     );
    
  //Colors definition
  parameter [1:0]
   red = 2'b00,
   yellow = 2'b01,
   green = 2'b10;
   
  //states definition
  parameter [1:0]
   HG_CR = 2'b00,
   HY_CR = 2'b01,
   HR_CG = 2'b10,
   HR_CY = 2'b11;
   
  //temporary registers used
   reg [1:0] curr_state;
   reg [1:0] next_state;
   reg [1:0] yellowCount;
   reg [3:0] cityGreen;
   
  //what symbols mean?
   always @(*)
    begin
     case(curr_state)
      HG_CR : begin
               Highway = green;
               Cityroad = red;
              end
      HY_CR : begin
               Highway = yellow;
               Cityroad = red;
              end
      HR_CG : begin
               Highway = red;
               Cityroad = green;
              end
      HR_CY : begin
               Highway = red;
               Cityroad = yellow;
              end
      default : begin
                 Highway = green;
                 Cityroad = red;
                end
     endcase
    end
    
   //definition of next state
    always @(*)
     begin
      case(curr_state)
       HG_CR : begin
                next_state = (carCount==5) ? HY_CR : HG_CR;
               end
       HY_CR : begin
                if(yellowCount==2)
                  next_state = HR_CG;
                else
                 next_state = HY_CR;
               end
       HR_CG : begin
                if(cityGreen==10)
                  next_state = HR_CY;
                else
                 next_state = HR_CG;
               end
       HR_CY : begin
                if(yellowCount==2)
                  next_state = HG_CR;
                else
                 next_state = HR_CY;
               end
       default : begin
                  next_state = HG_CR;
                 end
      endcase
     end
     
    //cycle working 
    always @(posedge clock or posedge reset)
     begin
      if(reset)
       begin
        yellowCount <= 0;
        cityGreen <= 0;
        curr_state <= HG_CR;
       end 
       
      else
       begin
       curr_state <= next_state;
         if(curr_state == HY_CR   ||  curr_state == HR_CY)
          begin
          if(yellowCount == 2)
            yellowCount <= 0;
          else
           yellowCount <= yellowCount + 1;
          end
         else 
          yellowCount <= 0;
          
         
         if(curr_state == HR_CG)
          begin
           if(cityGreen == 10 )
            cityGreen <= 0;
           else
           cityGreen <= cityGreen + 1;
          end
         else
          cityGreen <= 0;
          
       end
     end
endmodule
