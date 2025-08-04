`timescale 1ns / 1ps

module display_driver (
    input clk,
    input [15:0] value,
    output reg [3:0] anode,
    output reg [6:0] seg
);
    reg [1:0] scan = 0;
    reg [3:0] digit;

    always @(posedge clk) begin
        scan <= scan + 1;
        case (scan)
            2'd0: begin digit = value / 1000; anode = 4'b1110; end
            2'd1: begin digit = (value / 100) % 10; anode = 4'b1101; end
            2'd2: begin digit = (value / 10) % 10; anode = 4'b1011; end
            2'd3: begin digit = value % 10; anode = 4'b0111; end
        endcase

        case (digit)
            4'd0: seg = 7'b1000000;
            4'd1: seg = 7'b1111001;
            4'd2: seg = 7'b0100100;
            4'd3: seg = 7'b0110000;
            4'd4: seg = 7'b0011001;
            4'd5: seg = 7'b0010010;
            4'd6: seg = 7'b0000010;
            4'd7: seg = 7'b1111000;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
endmodule
