# 🔦 LED Controller (Verilog - Clock Divider + Button FSM)

This is a Verilog-based LED controller that uses a **button-controlled finite state machine (FSM)** to toggle between multiple LED blinking modes using internal **clock division logic**. It's designed for both **real hardware implementation** and **fast simulation**, thanks to a smart parameter switch.

---

### ✅ Features
- **Clock Divider Logic**: Generates two internal clocks (0.5 Hz and 2 Hz)
- **Button Edge Detection**: Detects rising edge to switch states
- **4 LED Modes**:
  - Mode 0: All LEDs OFF
  - Mode 1: LED[0] blinks at 0.5 Hz
  - Mode 2: LED[1] blinks at 2 Hz
  - Mode 3: All LEDs blink together at 2 Hz
- **Simulation-friendly**: `FAST_SIM` macro reduces clock divider counts for quick waveform viewing

---

### ⚙️ How It Works
- The main clock drives two counters that divide frequency into 0.5 Hz and 2 Hz clocks.
- On each **button press**, the FSM increments its state (from 0 to 3).
- LEDs are controlled based on the FSM state and selected clock signal.
- Testbench (`tb_led_controller.v`) simulates the clock, reset, and button presses.

---

- Waveform shows clock division, button edges, and LED outputs

---

### 💡 Advantages
- Great for understanding clock division and FSMs
- Easily portable to FPGA boards (e.g., using 50 MHz clock)
- Clean modular code with simulation + synthesis support
- Good starter project for digital/embedded learners

---

### 🧰 Tech Stack
- **HDL**: Verilog  
- **Design & Simulation Tool**: Xilinx Vivado  
- **Target Platform**: FPGA (tested with 50 MHz base clock)
