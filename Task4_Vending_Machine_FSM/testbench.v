`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2025 18:31:42
// Design Name: 
// Module Name: testbench
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


module testbench;
 reg clock;
 reg reset;
 reg [1:0] coin;
 wire despended;
 
 vending_machine DTU (clock,reset,coin,despended);
 
 initial
  begin
   clock = 1'b0;
   forever #5 clock = ~clock;
  end
  
 initial 
  begin
   $monitor($time, " Coin = %b | Dispensed = %b | State = %b", coin, despended, DTU.curr_state);
   #5 reset =1;
   
   #15 reset =0;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=2 ;
   @ (posedge clock) coin=2 ;
   @ (posedge clock) coin=2 ;
   @ (posedge clock) coin=2 ;
   @ (posedge clock) coin=2 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=2 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=1 ;
   @ (posedge clock) coin=2 ;
   @ (posedge clock) coin=2 ;
  end
endmodule
