# Verilog Digital Design Projects

This repository contains **three Verilog HDL projects** demonstrating fundamental digital design concepts: **RAM, ROM, and Traffic Light Controller (TLC)**. Each project includes the design files and corresponding testbenches for simulation and verification.

---

## Projects Overview

### 1. Single-Port RAM (8x8)
- **Description:** An 8x8 single-port RAM implemented in Verilog using behavioral modeling. Supports **synchronous read and write** operations controlled by `enable` and `write` signals.
- **Features:**
  - 8-bit data width, 8 memory locations
  - Synchronous updates on positive clock edge
  - Verified with a testbench covering reset, write, and read operations
- **Applications:** Temporary data storage, registers in digital systems.

### 2. ROM (8x8)
- **Description:** An 8x8 read-only memory with predefined data initialized using a `case` statement. Data can only be read and not written.
- **Features:**
  - Preloaded memory content
  - Read operation controlled by address input
  - Testbench validates correct output for all valid addresses
- **Applications:** Instruction storage, lookup tables, embedded systems.

### 3. Traffic Light Controller (TLC)
- **Description:** A Traffic Light Controller designed as a **Finite State Machine (FSM)**. Controls **Red, Yellow, and Green signals** for a 4-way intersection.
- **Features:**
  - Implements both Moore and Mealy FSM models
  - Proper timing and sequencing of traffic lights
  - Testbench simulates realistic traffic behavior
- **Applications:** Traffic signal management, FSM-based digital control systems.

---

## How to Run the Projects

cd RAM
iverilog -o ram_tb.out ram.v ram_tb.v
vvp ram_tb.out
gtkwave ram_tb.vcd  # Optional: view waveforms

cd ../ROM
iverilog -o rom_tb.out rom.v rom_tb.v
vvp rom_tb.out
gtkwave rom_tb.vcd

cd ../TLC
iverilog -o tlc_tb.out tlc.v tlc_tb.v
vvp tlc_tb.out
gtkwave tlc_tb.vcd

Tools Used

Language: Verilog HDL
Simulator: ModelSim / Vivado
Editor: gVim
