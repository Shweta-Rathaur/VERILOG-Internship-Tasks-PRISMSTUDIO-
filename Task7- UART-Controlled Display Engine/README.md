# UART-Controlled 7-Segment Display Engine

This Verilog project implements a real-time **UART-to-7-segment display system** where user commands sent over serial communication control a 4-digit 7-segment display. The design features modular integration of UART reception, command parsing using an FSM, and multiplexed display logic.

---

## 🧠 Objective

To integrate UART communication with command decoding, state-machine-based control, and live display updates — while maintaining proper timing, error handling, and glitch-free output — using a modular Verilog system.

---

## ✨ Features

- **UART-Based Command Interface**  
  Receives ASCII commands via UART protocol with accurate timing (e.g., 115200 baud @ 50 MHz clock).

- **Finite State Machine (FSM) Parsing**  
  Uses a clean state-machine design to parse commands like `S1234`, `C`, and handle invalid entries.

- **4-Digit 7-Segment Display Control**  
  Displays dynamic 4-digit values using multiplexing logic with segment decoding.

- **Error Handling with Timer**  
  Automatically detects invalid commands and holds "Err" display using delay counters.

- **Modular and Scalable Design**  
  Cleanly separated UART, parser, display, and timing logic for better testability and future upgrades.

- **Simulation-Ready Testbench**  
  A well-structured testbench simulates UART input and display updates for functional verification.

---


## 🧩 System Overview

### 🔧 Modules

| Module Name         | Functionality                                                                 |
|---------------------|-------------------------------------------------------------------------------|
| `uart_rx`           | Receives ASCII characters over UART and outputs 8-bit data with `rx_valid`   |
| `cmd_parser`        | Parses incoming UART commands (`S1234`, `C`, `E`) via FSM and generates display values or error flags |
| `display_driver`    | Drives 4-digit 7-segment display using multiplexing and digit decoding       |
| `error_timer`       | Holds the "Err" message on display for a fixed duration                      |
| `uart_display_system` | Top-level integration of all modules with proper wiring and control         |

---

## 🗂️ Command Format

| Command      | Action                                      |
|--------------|---------------------------------------------|
| `S1234`      | Show number `1234` on the display           |
| `C`          | Clear the display                           |
| Any invalid  | Triggers error message "Err"                |

---

## ⚙️ Simulation

### Prerequisites
- Xilinx Vivado 2020.2 or newer (tested with Vivado 2024.2)
- Behavioral simulation using XSim

### Simulation Steps

1. Open the project:
    ```
    open_project UART.xpr
    ```

2. Set top module for simulation:
    ```
    set_property top testbench [current_fileset]
    ```

3. Run simulation:
    ```
    launch_simulation
    ```

4. In the waveform viewer:
    - Observe `rx_data`, `rx_valid`, `display_val`, and `update_display` signals.
    - Check for expected number (`1234`) or `"Err"` on invalid commands.

---

## 🧪 Testbench Behavior

The `testbench.v` file:
- Generates UART input signals (`rx`)
- Sends a valid command (e.g., `S1234`) and checks display update
- Can be extended to test corner cases (`C`, wrong chars, short input)

---

