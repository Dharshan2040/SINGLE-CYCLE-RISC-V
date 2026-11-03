# 32-bit RISC-V Single-Cycle Processor

## Overview
Designed and implemented a **32-bit RISC-V single-cycle processor** using **SystemVerilog** and **Xilinx Vivado**. The processor follows a modular architecture with separate Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory (MEM), and Write-Back (WB) stages.

## Features
- 32-bit RISC-V single-cycle architecture
- Modular design with separate stage files
- Program Counter and instruction memory
- Register file with 32 general-purpose registers
- Instruction decoder and control unit
- ALU supporting arithmetic and logical operations
- Immediate generator and multiplexers
- Data memory for load/store operations
- Branch support with PC update logic
- RTL simulation and verification using Vivado

## Supported Instructions
| Type | Instructions |
|---|---|
| R-Type | ADD, SUB, AND, OR, XOR, SLT |
| I-Type | ADDI |
| Load | LW |
| Store | SW |
| Branch | BEQ |

## Architecture
```text
                 ┌──────────────┐
                 │ Instruction  │
                 │    Fetch     │
                 │     (IF)     │
                 └──────┬───────┘
                        │
                 ┌──────▼───────┐
                 │ Instruction  │
                 │    Decode    │
                 │     (ID)     │
                 └──────┬───────┘
                        │
                 ┌──────▼───────┐
                 │   Execute    │
                 │     (EX)     │
                 └──────┬───────┘
                        │
                 ┌──────▼───────┐
                 │    Memory    │
                 │    (MEM)     │
                 └──────┬───────┘
                        │
                 ┌──────▼───────┐
                 │ Write-Back   │
                 │     (WB)     │
                 └──────────────┘
```

## Project Structure
```text
RISC_V_Single_Cycle/
├── IF_STAGE/
│   ├── pc.sv
│   ├── adder.sv
│   ├── inst_mem.sv
│   └── if_stage.sv
├── ID_STAGE/
│   ├── instruction_decoder.sv
│   ├── register_file.sv
│   ├── immediate_generator.sv
│   ├── control_unit.sv
│   └── ID_stage.sv
├── EX_STAGE/
│   ├── alu.sv
│   ├── alu_operation.sv
│   ├── mux.sv
│   ├── shifter.sv
│   ├── adder_branc.sv
│   └── ex_stage.sv
├── MEM_STAGE/
│   ├── data_memory.sv
│   ├── and_gate.sv
│   └── mem_stage.sv
├── WB_STAGE/
│   ├── writeback_mux.sv
│   └── wb_stage.sv
├── TOP_STAGE.sv
├── TOP_STAGE_tb.sv
└── instruction.mem
```

## Simulation and Verification
The processor was simulated using **Vivado RTL simulation**. The testbench verifies instruction execution by monitoring the PC, instruction, control signals, ALU output, memory activity, and register-file contents.

Example verification:
```text
ADDI x1, x0, 5
ADDI x2, x0, 10
ADD  x3, x1, x2
```

Expected register values:
```text
x1 = 5
x2 = 10
x3 = 15
```

The expected results were observed in the register file during simulation.

## Tools Used
- SystemVerilog
- Xilinx Vivado
- RTL Simulation

## Learning Outcomes
- Understanding RISC-V instruction formats and execution
- Designing a modular processor datapath
- Implementing control and data paths
- Verifying processor functionality through RTL simulation
- Debugging hardware designs using waveforms and simulation output

