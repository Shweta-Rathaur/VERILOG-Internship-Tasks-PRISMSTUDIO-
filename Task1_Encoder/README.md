# Priority Encoder in Verilog

This project implements an 8-bit priority encoder in Verilog that outputs the binary index of the highest-priority active input (from MSB to LSB), with reset support and testbench validation.
## Features


- Implements an **8-bit priority encoder** in Verilog HDL  
- Detects the **highest-priority active input** from MSB (`in[7]`) to LSB (`in[0]`)
- Outputs a **3-bit binary value** indicating the index of the active input
- Includes **reset functionality** to clear output when needed
- Uses `casez` for efficient pattern matching with `don't care (?)` bits
- Synchronized with **positive edge of the clock** where with every positive clock edge a new input is given
- Includes a **Verilog testbench** for simulation and validation
- Compatible with **Xilinx Vivado**, **ModelSim**, or any standard Verilog simulator

## Tech Stack

- **Verilog HDL** – for hardware description  
- **Xilinx Vivado** – for simulation, synthesis, and waveform analysis  


## Acknowledgements

 - GeeksforGeeks article for providing quality content for understanding the encoder
- Open-source resources and README templates for formatting guidance

## Usage/Examples




### ✅ Input vs Output Behavior:

| `in[7:0]` (Binary Input) | Description                      | `out[2:0]` (Output) |
|--------------------------|----------------------------------|---------------------|
| `10000000`               | Highest bit is `in[7]`           | `111`               |
| `00010000`               | Highest bit is `in[4]`           | `100`               |
| `00000100`               | Highest bit is `in[2]`           | `010`               |
| `00000001`               | Only `in[0]` is high             | `000`               |
| `01010000`               | Both `in[6]` and `in[4]` high → picks `in[6]` | `110`     |
| `00000000`               | No inputs active                 | `000` (default)     |

> 🔁 Output reflects the position of the **highest-priority '1' bit** from MSB to LSB.




## Lessons Learned

- Gained practical understanding of the working of priority encoders
- Strengthened skills in Verilog HDL for designing and simulating digital circuits.
- Learned to use Xilinx Vivado for project setup, simulation, and waveform analysis.



