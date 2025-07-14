`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2025 11:34:39
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
  reg  [7:0] in;
  reg  [2:0] select_line;
  wire [7:0] out;
  reg        left_rot;

  barallel_shifter dut (in, select_line, out, left_rot);

  initial begin
    // Test right rotation
    in = 8'b10110011;
    left_rot = 0;
    select_line = 3;
    #10;
    $display("Time=%0t | Right Rotate: in = %b, shift = %d -> out = %b", $time, in, select_line, out);

    // Test left rotation
    in = 8'b10110011;
    left_rot = 1;
    select_line = 3;
    #10;
    $display("Time=%0t | Left  Rotate: in = %b, shift = %d -> out = %b", $time, in, select_line, out);

    // Another right rotate
    in = 8'b11001100;
    left_rot = 0;
    select_line = 2;
    #10;
    $display("Time=%0t | Right Rotate: in = %b, shift = %d -> out = %b", $time, in, select_line, out);

    // Another left rotate
    in = 8'b11001100;
    left_rot = 1;
    select_line = 2;
    #10;
    $display("Time=%0t | Left  Rotate: in = %b, shift = %d -> out = %b", $time, in, select_line, out);

    $finish;
  end
endmodule
