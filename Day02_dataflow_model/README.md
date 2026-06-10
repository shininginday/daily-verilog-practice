# Day 02 - Dataflow & Structural Modeling + Verilog Operators

## 📚 Concepts Learned

### 1. Dataflow Modeling
Continued practicing dataflow modeling using assign statements.

| # | Circuit | Description |
|---|---------|-------------|
| 1 | Binary to Gray Code | Converts binary number to Gray code |
| 2 | Half Adder | Sum and Carry using assign |
| 3 | Multi-driver | Demonstrates multiple drivers on a net |
| 4 | Prime Number Detector | Detects if 4-bit input is a prime number |
| 5 | BCD to Excess-3 | Converts BCD input to Excess-3 code |
| 6 | Palindrome Detector | Checks if binary input reads same both ways |

---

### 2. Structural Modeling
Built complex circuits by instantiating smaller modules.

| # | Circuit | Built Using | Description |
|---|---------|-------------|-------------|
| 1 | 4:1 MUX | 2:1 MUX instances | Hierarchical MUX design |
| 2 | 8:1 MUX | 4:1 & 2:1 MUX instances | Multi-level MUX hierarchy |
| 3 | Full Adder | Half Adder instances | Classic structural approach |
| 4 | Parallel Adder | Full Adder instances | Multi-bit addition chain |

---

### 3. Verilog Operators (Dataflow)
Demonstrated all major Verilog operators using assign statements.

| # | Operator Type | Example |
|---|--------------|---------|
| 1 | Arithmetic | +, -, *, /, % |
| 2 | Concatenation | {a, b, c} |
| 3 | Conditional | (sel) ? a : b |
| 4 | Logical | &&, \|\|, ! |
| 5 | Reduction | &a, \|a, ^a |
| 6 | Replication | {3{a}} |
| 7 | Shift | <<, >> |

---

## 📁 Files in this Folder

| File | Description |
|------|-------------|
| binary_2_gray.v | Binary to Gray code converter |
| binary_2_gray_tb.v | Testbench |
| halfadder.v | Half adder - Dataflow |
| halfadder_tb.v | Testbench |
| multidriver_tb.v | Multi-driver demonstration |
| primenumdetector.v | Prime number detector |
| primenumdetector_tb.v | Testbench |
| bcd_to_excess3.v | BCD to Excess-3 converter |
| bcd_to_excess3_tb.v | Testbench |
| palindrome.v | Palindrome detector |
| palindrome_tb.v | Testbench |
| mux_4x1_structural.v | 4:1 MUX using 2:1 MUX |
| mux_8x1_structural.v | 8:1 MUX using 4:1 & 2:1 MUX |
| fulladder_structural.v | Full adder using Half adder |
| parallel_adder.v | Parallel adder using Full adder |
| arithmetic_operations.v | Arithmetic operators demo |
| concat_operator.v | Concatenation operator demo |
| conditional_operator.v | Conditional operator demo |
| logical_operators.v | Logical operators demo |
| reduction_operator.v | Reduction operators demo |
| replication_operator.v | Replication operator demo |
| shift_operators.v | Shift operators demo |

---

## 🛠️ Tools Used
- **Simulation:** EDA Playground
- **Synthesis Tool:** Vivado (upcoming)
- **Language:** Verilog HDL

---

## 🔄 Modeling Styles Covered So Far

| Day | Modeling Style |
|-----|---------------|
| Day 01 | Gate Level + Dataflow (intro) |
| Day 02 | Dataflow (advanced) + Structural |
| Day 03 | Behavioral (upcoming) |

---

## ✅ Simulation Status
All circuits simulated and verified successfully on EDA Playground.

---


## 💡 Key Takeaways
- Dataflow modeling is best for combinational logic using assign
- Structural modeling allows building complex circuits
  from smaller reusable modules (bottom-up approach)
- Hierarchy in structural modeling mirrors real hardware design
- Verilog operators reduce code and improve readability
  compared to gate-level primitives
- Replication {n{}} and Reduction operators are
  very powerful for compact code
