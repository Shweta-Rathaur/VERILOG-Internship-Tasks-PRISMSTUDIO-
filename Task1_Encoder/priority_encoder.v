`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 17:44:21
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(
 input clk,
 input rst,
 input [7:0] in,
 output reg [2:0] out
    );

 //defination of different input combinations possible
//here "?" means "don't care"
//whenever it encounters any "1" the priority will be given to it no matter how many "1" are after that
 parameter [7:0]
  I0 = 8'b00000001,
  I1 = 8'b0000001?,
  I2 = 8'b000001??,
  I3 = 8'b00001???,
  I4 = 8'b0001????,
  I5 = 8'b001?????,
  I6 = 8'b01??????,
  I7 = 8'b1???????;

 //encoder logic 
 always @(posedge clk or posedge rst)
  if(rst)
   out <= 3'b000;
  else
   begin
    casez(in)
     I7 : out <= 3'b111;
     I6 : out <= 3'b110;
     I5 : out <= 3'b101;
     I4 : out <= 3'b100;
     I3 : out <= 3'b011;
     I2 : out <= 3'b010;
     I1 : out <= 3'b001;
     I0 : out <= 3'b000;
     default : out <= 3'b000;
    endcase
   end
endmodule
