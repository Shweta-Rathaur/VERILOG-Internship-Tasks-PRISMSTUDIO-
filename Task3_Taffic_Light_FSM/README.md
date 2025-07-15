# 🚦 Mealy Traffic Light Controller (Verilog)

This project implements a **Mealy Machine-based Traffic Light Controller** in Verilog. It simulates a two-road intersection: one **Highway** and one **City Road**, using **traffic density (car count)** to manage traffic lights efficiently.


## 🧠 FSM Design (Mealy Machine)

The controller has 4 states:
- `HG_CR`: Highway Green, City Road Red
- `HY_CR`: Highway Yellow, City Road Red
- `HR_CG`: Highway Red, City Road Green
- `HR_CY`: Highway Red, City Road Yellow

### 🚥 Light Encodings:
- `2'b00`: Red
- `2'b01`: Yellow
- `2'b10`: Green

### 🔁 Transitions:
| Current State | Condition                                  | Next State |
|---------------|---------------------------------------------|------------|
| `HG_CR`       | `carCount == 5`                             | `HY_CR`    |
| `HY_CR`       | After 2 cycles                              | `HR_CG`    |
| `HR_CG`       | After 10 cycles                             | `HR_CY`    |
| `HR_CY`       | After 2 cycles                              | `HG_CR`    |

---

## 📟 Inputs/Outputs

### 🔌 Inputs:
- `clock` (1-bit): System clock
- `reset` (1-bit): Active-high synchronous reset
- `carCount` (3-bit): Number of cars on city road

### 💡 Outputs:
- `Highway` (2-bit): Signal for highway light
- `Cityroad` (2-bit): Signal for city road light

---
## ✨ Features

- 🚦 **Mealy FSM-Based Design**  
  Output depends on **current state and input** (`carCount`), making the system responsive.

- ⏱️ **Accurate Timing Using Counters**  
  - Yellow lights remain ON for **2 cycles**.  
  - City road gets green light for **10 cycles**.

- 🧠 **Traffic Density-Based Decisions**  
  City road is allowed green only when `carCount == 5`, prioritizing highway traffic otherwise.

- 🔄 **Autonomous State Transitions**  
  FSM automatically transitions between states with internal timing and traffic conditions.

- 🧪 **Comprehensive Testbench Included**  
  - Simulates clock and car flow.  
  - Tests transition logic based on input changes.  
  - Displays output in real-time with `$monitor`.



## Tech Stack

- **Verilog HDL** – for hardware description  
- **Xilinx Vivado** – for simulation, synthesis, and waveform analysis  
