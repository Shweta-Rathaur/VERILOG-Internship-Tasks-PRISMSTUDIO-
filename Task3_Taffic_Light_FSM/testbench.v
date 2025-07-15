`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2025 12:37:00
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

  // Inputs
  reg clock;
  reg reset;
  reg [2:0] carCount;

  // Outputs
  wire [1:0] Highway;
  wire [1:0] Cityroad;

  // Instantiate the Unit Under Test (UUT)
  Mealey_traffic uut (
    .clock(clock),
    .reset(reset),
    .Highway(Highway),
    .Cityroad(Cityroad),
    .carCount(carCount)
  );

  // Clock generation (10ns period)
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Stimulus
  initial begin

    // Initial values
    reset = 1;
    carCount = 3'b000;

    // Hold reset for a few cycles
    #20;
    reset = 0;

    // Simulate low car count
    carCount = 3'b010;  // Less than 5
    #100;

    // Simulate carCount reaching threshold
    carCount = 3'b101;  // Exactly 5
    #50;

    // Stay high to let full cycle happen
    carCount = 3'b111;
    #200;

    // Simulate drop in traffic
    carCount = 3'b001;
    #100;

    // Trigger another transition
    carCount = 3'b101;
    #200;

    // Finish simulation
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time=%0t | State Output -> Highway: %b, Cityroad: %b | carCount: %d", $time, Highway, Cityroad, carCount);
  end

endmodule

