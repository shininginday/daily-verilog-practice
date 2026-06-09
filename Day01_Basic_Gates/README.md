# Day 01 - Basic Gates & Combinational Circuits

## 📚 Concepts Learned

### 1. Gate Level Modeling - Simulations
Practiced building combinational circuits using basic gate-level modeling in Verilog.

| # | Circuit | Description |
|---|---------|-------------|
| 1 | Full Adder | Adds 3 bits, produces Sum and Carry |
| 2 | AND Gate | Output HIGH only when all inputs HIGH |
| 3 | OR Gate | Output HIGH when any input is HIGH |
| 4 | NAND Gate | Inverted AND - Universal gate |
| 5 | NOR Gate | Inverted OR - Universal gate |
| 6 | XOR Gate | Output HIGH when inputs are different |
| 7 | XNOR Gate | Output HIGH when inputs are same |
| 8 | 2:1 MUX | Selects 1 output from 2 inputs |
| 9 | 2:4 Decoder | Decodes 2-bit input to 4 output lines |
| 10 | 4:2 Encoder | Encodes 4 input lines to 2-bit output |
| 11 | Parity Generator | Generates even/odd parity bit |

---

### 2. Dataflow Modeling
Practiced dataflow modeling style using assign statements.

| # | Circuit | Description |
|---|---------|-------------|
| 1 | 2:1 MUX | Implemented using assign & conditional operator |

---

## 📁 Files in this Folder

| File | Description |
|------|-------------|
| full_adder.v | Full adder - Gate level |
| and_gate.v | AND gate |
| or_gate.v | OR gate |
| nand_gate.v | NAND gate |
| nor_gate.v | NOR gate |
| xor_gate.v | XOR gate |
| xnor_gate.v | XNOR gate |
| mux_2x1_gate.v | 2:1 MUX - Gate level |
| decoder_2x4.v | 2:4 Decoder |
| encoder_4x2.v | 4:2 Encoder |
| parity_generator.v | Parity Generator |
| mux_2x1_dataflow.v | 2:1 MUX - Dataflow modeling |
| *_tb.v | Testbench files for each |

---

## 🛠️ Tools Used
- **Simulation:** EDA Playground
- **Synthesis Tool:** Vivado (upcoming)
- **Language:** Verilog HDL

---

## ✅ Simulation Status
All circuits simulated and verified successfully on EDA Playground.

---

## 💡 Key Takeaways
- Gate level modeling uses actual gate primitives (and, or, nand...)
- Dataflow modeling uses assign statements with operators
- Both styles produce the same hardware but differ in abstraction level



