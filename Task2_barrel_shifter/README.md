# 8-bit Barrel Shifter (Left/Right Rotation) - Verilog

This project implements an **8-bit barrel shifter** in Verilog, capable of both **left and right rotation** operations based on user input.

---

## 💡 What is a Barrel Shifter?

A **barrel shifter** is a combinational digital circuit that shifts or rotates a data word by a specified number of positions in a single clock cycle. It is faster than sequential shifters because it doesn't require multiple cycles to complete the shift.

### ✅ Advantages:
- **Fast execution** – O(1) time complexity
- **Efficient for arithmetic, cryptographic, and DSP operations**
- Supports **circular (rotational)** shifts which are common in hardware designs

---

## 🔧 Features

- Performs **circular/rotational shifting** (not zero-padding)
- Supports **left or right** shift depending on control input
- Fully synthesizable design using:
  - A **parameterized generate loop**
  - Custom **8x1 MUX** module for bit selection

---

## 🧠 How It Works

The barrel shifter rotates the input 8-bit number by a value between 0 and 7, specified using the `select_line` input.

- If `left_rot = 0`: **Right rotate**
- If `left_rot = 1`: **Left rotate**

Each output bit is calculated using a **MUX8X1**, selecting the correct rotated bit.

---

## 🧪 Test Example in Code

Here's a simple simulation snippet from the testbench:

```verilog
// Test right rotation
in = 8'b10110011;
left_rot = 0;
select_line = 3;
#10; // out = 01110110

// Test left rotation
in = 8'b10110011;
left_rot = 1;
select_line = 3;
#10; // out = 10011101
