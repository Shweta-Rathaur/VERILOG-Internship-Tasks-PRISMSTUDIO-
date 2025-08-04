`timescale 1ns / 1ps
module uart_display_system (
    input clk,
    input reset,
    input rx,
    output [6:0] seg,
    output [3:0] an
);
    wire [7:0] rx_data;
    wire rx_valid;

    wire [15:0] display_val;
    wire show_error, update_display;
    reg [15:0] display_buffer;

    wire error_active;

    uart_rx uart (.clk(clk), .reset(reset), .rx(rx), .data_out(rx_data), .data_valid(rx_valid));
    cmd_parser parser (.clk(clk), .reset(reset), .rx_data(rx_data), .rx_valid(rx_valid),
                       .display_val(display_val), .show_error(show_error), .update_display(update_display));
    display_driver display (.clk(clk), .value(display_buffer), .anode(an), .seg(seg));
    error_timer timer (.clk(clk), .trigger(show_error), .active(error_active));

    always @(posedge clk or posedge reset) begin
        if (reset)
            display_buffer <= 0;
        else if (error_active)
            display_buffer <= 16'hEEEE;
        else if (update_display)
            display_buffer <= display_val;
    end
endmodule
