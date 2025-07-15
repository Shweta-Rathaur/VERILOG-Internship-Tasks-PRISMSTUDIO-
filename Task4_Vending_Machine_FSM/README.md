# 🥤 Vending Machine FSM (Verilog)

This project implements a **Finite State Machine (FSM)-based Vending Machine** in Verilog. It accepts 1-rupee and 2-rupee coins, and **dispenses an item when the total reaches ₹5**. The machine resets after every successful dispense.

---

## ✨ Features

- 💰 **Supports Multiple Coin Denominations**
  - Accepts ₹1 (`coin = 2'b01`) and ₹2 (`coin = 2'b10`)

- ⏱️ **FSM-Based State Tracking**
  - States represent the total inserted amount (₹0 to ₹5)
  - Uses a 3-bit state machine to track value accumulation

- 🛠️ **Auto Reset After Dispense**
  - Dispensing triggers at ₹5 and returns the machine to ₹0 state

- 📦 **Dispense Indicator**
  - `despended = 1` when total ₹5 is reached

- 🧪 **Comprehensive Testbench**
  - Clock generation
  - Reset behavior
  - Multiple test cases with varying coin sequences
  - Live output via `$monitor` including internal state visibility

- 🔧 **Synthesizable**
  - Written in standard Verilog-2001
  - Suitable for simulation and synthesis

---



## 🧠 FSM State Encoding

| State | Meaning                      |
|-------|------------------------------|
| `S0`  | ₹0 inserted (Idle)           |
| `S1`  | ₹1 inserted                  |
| `S2`  | ₹2 inserted                  |
| `S3`  | ₹3 inserted                  |
| `S4`  | ₹4 inserted                  |
| `S5`  | ₹5 inserted — **Dispense!**  |

---

## 🧮 Inputs and Outputs

### 🔌 Inputs:
- `clock` : System clock
- `reset` : Active-high reset signal
- `coin`  : 2-bit input representing inserted coin
  - `2'b01` = ₹1
  - `2'b10` = ₹2

### 💡 Outputs:
- `despended` : High (`1`) when ₹5 is reached and item is dispensed

---





## Tech Stack

- **Verilog HDL** – for hardware description  
- **Xilinx Vivado** – for simulation, synthesis, and waveform analysis  
