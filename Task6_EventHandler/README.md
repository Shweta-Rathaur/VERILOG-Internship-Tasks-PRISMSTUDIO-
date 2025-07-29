# 🔘 Event Handler – Verilog Project

## 📖 Project Definition
This project implements a finite state machine (FSM) in Verilog to handle and count valid push-button press events. It detects the **rising edge** of a button signal and increments a 4-bit counter for each valid press. The design ensures accurate event counting by preventing multiple counts during a long button hold (debouncing behavior) using a 3-state FSM.

---

## ✨ Features
- ✅ Edge-triggered event detection using `button_prev`
- ✅ Three-state FSM: `IDLE`, `COUNT`, `WAIT`
- ✅ Synchronous 4-bit counter for valid button events
- ✅ Glitch-free and noise-resistant button handling
- ✅ Active-high asynchronous reset support
- ✅ Designed for real-time embedded applications

---

## ⚙️ Working

### ➤ FSM States:

1. **IDLE**  
   - Waits for a rising edge on the button signal.  
   - Rising edge is detected using:  
     ```verilog
     wire button_rising = ~button_prev & button;
     ```

2. **COUNT**  
   - On detecting a valid press, the counter is incremented by 1.

3. **WAIT**  
   - Holds this state while the button is still pressed to prevent multiple increments.  
   - Returns to IDLE only when the button is released.

### ➤ Reset Behavior:
- When `reset` is high:
  - FSM goes to `IDLE`
  - Counter and button tracking register are reset to 0

---

## 🛠️ Tech Stack
- **HDL**: Verilog  
- **Simulation Tool**: Vivado Simulator (Xilinx Vivado)  
- **Waveform Viewer**: Vivado Integrated Waveform Viewer  
- **Synthesis/Implementation**: Xilinx Vivado  
- **Testbench**: Written in Verilog with sample button inputs and delays  

---

## 📂 File Structure
