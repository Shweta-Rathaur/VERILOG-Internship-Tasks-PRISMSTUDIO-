`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2025 10:59:58
// Design Name: 
// Module Name: barallel_shifter
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

module barallel_shifter(
  input [7:0] in,
  input [2:0] select_line,
  output [7:0] out,
  input left_rot
);

  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : rotate_loop
      wire [7:0] rotated_input;
      assign rotated_input = (left_rot==1'b0)?
      //right shift
      { in[(i+7)%8],
        in[(i+6)%8],
        in[(i+5)%8],
        in[(i+4)%8],
        in[(i+3)%8],
        in[(i+2)%8],
        in[(i+1)%8],
        in[(i+0)%8]
      }:
      //left shift
      { in[(i+1)%8],
        in[(i+2)%8],
        in[(i+3)%8],
        in[(i+4)%8],
        in[(i+5)%8],
        in[(i+6)%8],
        in[(i+7)%8],
        in[(i+0)%8]
      }
      ;

      //calling MUX 8*1 for each i assigning 1 outout bit at a time 
      MUX8X1 calling (
        .MUX_in(rotated_input),
        .MUX_SL(select_line),
        .MUX_out(out[i])
      );
    end
  endgenerate
endmodule

// 8x1 MUX code
module MUX8X1 (
  input [7:0] MUX_in,
  input [2:0] MUX_SL,
  output MUX_out
);
  assign MUX_out = MUX_in[MUX_SL];
endmodule
