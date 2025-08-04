`timescale 1ns / 1ps

module testbench;

    reg clk;
    reg reset;
    reg rx;

    wire [6:0] seg;
    wire [3:0] an;

    // Instantiate the top module
    uart_display_system dut (
        .clk(clk),
        .reset(reset),
        .rx(rx),
        .seg(seg),
        .an(an)
    );

    // Clock generator (50MHz)
    initial clk = 0;
    always #10 clk = ~clk;  // 20ns period = 50MHz

    // Simple reset process
    initial begin
        reset = 1;
        #100;
        reset = 0;
    end

    // UART transmit task to send a byte with proper UART timing at 115200 baud
    task send_uart_byte(input [7:0] data);
        integer i;
        begin
            // Start bit (logic 0)
            rx = 0;
            #(434 * 20); // One bit duration at 115200 baud (CLK_PER_BIT=434)

            // Send 8 data bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                rx = data[i];
                #(434 * 20);
            end

            // Stop bit (logic 1)
            rx = 1;
            #(434 * 20);

            // Additional idle bit time between bytes
            #(434 * 20);
        end
    endtask

    initial begin
        // Default idle line state
        rx = 1;
        #1000;

        // Send "S1234" command over UART to test updating display
        send_uart_byte("S");
        send_uart_byte("1");
        send_uart_byte("2");
        send_uart_byte("3");
        send_uart_byte("4");

        #2000;

        // Send "C" command to clear display
        send_uart_byte("C");

        #2000;

        $stop; // end simulation
    end

endmodule
