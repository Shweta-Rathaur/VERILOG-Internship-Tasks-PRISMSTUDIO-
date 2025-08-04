`timescale 1ns / 1ps

module error_timer (
    input clk,
    input trigger,
    output reg active
);
    integer count;
    reg last_trigger;

    always @(posedge clk) begin
        last_trigger <= trigger;
        if (trigger & ~last_trigger) begin // Detect rising edge of trigger
            active <= 1;
            count <= 25_000_000; // ~0.5s for 50MHz
        end else if (active) begin
            if (count == 0) begin
                active <= 0;
            end else begin
                count <= count - 1;
            end
        end
    end
endmodule
