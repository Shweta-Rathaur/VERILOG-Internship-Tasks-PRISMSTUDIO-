`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 17:52:59
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
 reg clk;
 reg rst;
 reg [7:0] in;
 wire [2:0] out;
 
 priority_encoder DTU (clk,rst,in,out);
 
 //clock signal
 initial
  begin
   clk = 1'b0;
   forever #5 clk = ~clk;
  end
  
 //input given 
 initial 
  begin
  $monitor ($time," the input = %8b which is encoded as output = %3b",in,out);
   rst=1; 
   in = 8'b00001000;
   #10 rst = 0; 
   @(posedge clk) in = 8'b01000000;
   @(posedge clk) in = 8'b00000100;
   @(posedge clk) in = 8'b01010000;
   @(posedge clk) in = 8'b00000001;
   @(posedge clk) in = 8'b00000010;
   @(posedge clk) in = 8'b00001100;
   @(posedge clk) in = 8'b00010000;
   @(posedge clk) in = 8'b00101001;
   @(posedge clk) in = 8'b10000000;
   @(posedge clk) in = 8'b00000010;
   @(posedge clk) in = 8'b00000100;
   @(posedge clk) $finish;
  end
endmodule
