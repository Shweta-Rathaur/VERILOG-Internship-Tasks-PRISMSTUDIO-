`timescale 1ns / 1ps

module tb_event_handler;

    reg clk;
    reg reset;
    reg button;
    wire [3:0] count;

    event_handler uut (
        .clk(clk),
        .reset(reset),
        .button(button),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("event_handler.vcd");
        $dumpvars(0, tb_event_handler);

        clk = 0;
        reset = 1;
        button = 0;

        #10;
        reset = 0;

        #15 button = 1;
        #10 button = 0;

        #20 button = 1;
        #10 button = 0;

        #30 button = 1;
        #10 button = 0;

        #50;
        $finish;
    end

endmodule
