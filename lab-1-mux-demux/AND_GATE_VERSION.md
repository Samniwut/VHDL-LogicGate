# AND Gate Version - Lab-1 Multiplexer & Demultiplexer

---

## 📌 บทนำ

ตัวอักษร AND Gate Version ของ Lab-1 ใช้การออกแบบ **Structural (Gate-Level)**
โดยใช้เฉพาะ:
- **AND gates** (5-input each)
- **OR gate** (16-input)
- **NOT gates** (4 gates)

ไม่ใช้ CASE statement เลย ทุกอย่างเป็น logic gates

---

## 🔧 Architecture

### 16:1 Multiplexer (AND Gate Version)

```
Input:  D[15:0] (16 data lines)
        S[3:0] (4 select lines)
Output: Y (1 output line)

Structure:
┌─────────────────────────────────────┐
│ NOT Gates (4)                       │
│ - Create S0', S1', S2', S3'        │
└──────────────┬──────────────────────┘
               │
        ┌──────┴──────┐
        │             │
┌───────▼──────┐  ┌──▼────────┐
│ AND Gates    │  │ More AND  │
│ (5-input)    │  │ Gates     │
│ 16 total     │  │           │
└───────┬──────┘  └──┬────────┘
        │           │
        └─────┬─────┘
              │
        ┌─────▼──────┐
        │ OR Gate    │
        │ (16-input) │
        └─────┬──────┘
              │
              Y
```

### 1:16 Demultiplexer (AND Gate Version)

```
Input:  D (1 data line)
        S[3:0] (4 select lines)
Output: Y[15:0] (16 output lines)

Structure:
┌─────────────────────────────────┐
│ NOT Gates (4)                   │
│ - Create S0', S1', S2', S3'    │
└──────────┬──────────────────────┘
           │
       ┌───┴───┐
       │       │
   D ──┤       │──┐
       │ AND   │  │
       │ Gates │  │ 16 AND gates
       │ (16)  │  │ (5-input each)
       │       │  │
       └───────┴──┘
           │
        Y[15:0]
```

---

## 📝 AND Gate Truth Table

### MUX Select vs AND Conditions

```
For each input Di to be selected, the decoder must produce:

Di is selected when S3 S2 S1 S0 = ?

Example for D5:
  Select = 0101
  S3'=1, S2=0, S1=1, S0=1
  AND: D5 AND 1 AND 0 AND 1 AND 1
       (with inversions: S3' AND S2 AND S1' AND S0)
       
Pattern for all 16:
D0:  S3'S2'S1'S0' (0000)
D1:  S3'S2'S1'S0  (0001)
D2:  S3'S2'S1S0'  (0010)
D3:  S3'S2'S1S0   (0011)
D4:  S3'S2S1'S0'  (0100)
D5:  S3'S2S1'S0   (0101)
D6:  S3'S2S1S0'   (0110)
D7:  S3'S2S1S0    (0111)
D8:  S3S2'S1'S0'  (1000)
D9:  S3S2'S1'S0   (1001)
D10: S3S2'S1S0'   (1010)
D11: S3S2'S1S0    (1011)
D12: S3S2S1'S0'   (1100)
D13: S3S2S1'S0    (1101)
D14: S3S2S1S0'    (1110)
D15: S3S2S1S0     (1111)
```

---

## 💻 VHDL Code Explanation

### NOT Gates Creation

```vhdl
S_not(0) <= not S(0);  -- NOT S0
S_not(1) <= not S(1);  -- NOT S1
S_not(2) <= not S(2);  -- NOT S2
S_not(3) <= not S(3);  -- NOT S3
```

### AND Gate Example (D5)

```vhdl
-- For D5: S = 0101 (S3'=1, S2=0, S1=1, S0=1)
and_out(5) <= D(5) and S_not(3) and S(2) and S_not(1) and S(0);
               │        │          │        │          │
               │        │          │        │          └─ S0 (not inverted)
               │        │          │        └─ S1' (inverted)
               │        │          └─ S2 (not inverted)
               │        └─ S3' (inverted)
               └─ Data input D5
```

### All 16 AND Gates for MUX

```vhdl
and_out(0)  <= D(0)  and S_not(3) and S_not(2) and S_not(1) and S_not(0);
and_out(1)  <= D(1)  and S_not(3) and S_not(2) and S_not(1) and S(0);
and_out(2)  <= D(2)  and S_not(3) and S_not(2) and S(1) and S_not(0);
and_out(3)  <= D(3)  and S_not(3) and S_not(2) and S(1) and S(0);
and_out(4)  <= D(4)  and S_not(3) and S(2) and S_not(1) and S_not(0);
and_out(5)  <= D(5)  and S_not(3) and S(2) and S_not(1) and S(0);
and_out(6)  <= D(6)  and S_not(3) and S(2) and S(1) and S_not(0);
and_out(7)  <= D(7)  and S_not(3) and S(2) and S(1) and S(0);
and_out(8)  <= D(8)  and S(3) and S_not(2) and S_not(1) and S_not(0);
and_out(9)  <= D(9)  and S(3) and S_not(2) and S_not(1) and S(0);
and_out(10) <= D(10) and S(3) and S_not(2) and S(1) and S_not(0);
and_out(11) <= D(11) and S(3) and S_not(2) and S(1) and S(0);
and_out(12) <= D(12) and S(3) and S(2) and S_not(1) and S_not(0);
and_out(13) <= D(13) and S(3) and S(2) and S_not(1) and S(0);
and_out(14) <= D(14) and S(3) and S(2) and S(1) and S_not(0);
and_out(15) <= D(15) and S(3) and S(2) and S(1) and S(0);
```

### OR Gate (Combine All AND Outputs)

```vhdl
Y <= and_out(0) or and_out(1) or and_out(2) or and_out(3) or
     and_out(4) or and_out(5) or and_out(6) or and_out(7) or
     and_out(8) or and_out(9) or and_out(10) or and_out(11) or
     and_out(12) or and_out(13) or and_out(14) or and_out(15);
```

---

## ✅ Test Cases

### Test 1: Select = 0000 (D0 = '1')

```
Inputs:  D = 0x5555, S = 0000
AND Paths:
  D0 and S3' and S2' and S1' and S0' → D0 and 1 and 1 and 1 and 1 → 1
  D1 and S3' and S2' and S1' and S0  → D1 and 1 and 1 and 1 and 0 → 0
  ...all others = 0
OR Result: 1

Output Y = '1' ✓
```

### Test 2: Select = 0101 (D5 = '0')

```
Inputs:  D = 0x5555, S = 0101
AND Paths:
  D5 and S3' and S2 and S1' and S0 → D5 and 1 and 0 and 1 and 1 → 0
  ...all others = 0
OR Result: 0

Output Y = '0' ✓
```

### Test 3: Independent Select (KEY TEST)

```
MUX:   S = 1100 (Select D12 = '1')
DEMUX: S = 0011 (Route to Y3)

MUX selects D12 = '1' through AND gates
DEMUX routes output to Y3 through AND gates

Result: Y3 = '1' ✓
```

---

## 🎯 Files Available

### Option 1: All-in-One

**File:** `eda_playground_lab1_and_gate.vhdl` (226 บรรทัด)

```bash
# Copy entire file into EDA Playground
# One file contains everything (MUX + DEMUX + Testbench)
```

### Option 2: Multiple Files

**File 1:** `eda_and_gate_mux_16to1.vhdl` (65 บรรทัด)
- 16:1 MUX using AND/OR/NOT gates

**File 2:** `eda_and_gate_demux_1to16.vhdl` (45 บรรทัด)
- 1:16 DEMUX using AND gates

**File 3:** `eda_and_gate_testbench.vhdl` (210 บรรทัด)
- Testbench combining both

---

## 🚀 How to Use

### On EDA Playground

1. **Go to:** https://www.edaplayground.com/
2. **Select:**
   - Simulator: GHDL
   - Language: VHDL 93
   - Top Module: Lab1_AND_Gate_TB (or Lab1_AND_Gate_Test)

3. **For All-in-One:**
   - Copy: `eda_playground_lab1_and_gate.vhdl`
   - Paste into editor
   - Click "Run"

4. **For Multiple Files:**
   - Create File 1: `eda_and_gate_mux_16to1.vhdl`
   - Create File 2: `eda_and_gate_demux_1to16.vhdl`
   - Create File 3: `eda_and_gate_testbench.vhdl`
   - Click "Run"

5. **View Results:**
   - Output (right side) shows test reports
   - Click "Show Waveform" (bottom) to see signals

---

## 📊 Signal Monitoring in Waveform

Watch these signals:

```
input_data[15:0]    - Input data (D0-D15)
select_mux[3:0]     - MUX select lines
mux_output          - MUX output (after AND gates)
select_demux[3:0]   - DEMUX select lines
demux_output[15:0]  - DEMUX outputs (Y0-Y15)
```

---

## 💡 Learning Points

### Why AND Gates?

1. **Decoder Logic** - Each AND gate acts as a decoder
2. **Gate-Level Design** - Shows actual hardware implementation
3. **Truth Table Reality** - AND gates implement the AND truth table

### Gate Count

```
Components:
✓ 4 NOT gates (select line inversion)
✓ 16 AND gates for MUX (5-input each)
✓ 1 OR gate for MUX (16-input)
✓ 16 AND gates for DEMUX (5-input each)

Total gates in system:
NOT: 4
AND: 32
OR: 1
```

### Delay Path

```
Input → NOT gates (1 delay unit) 
      → AND gates (1 delay unit)
      → OR gate (1 delay unit)
      → Output Y

Total: ~3 delay units (gate delays)
```

---

## 🔍 Verification

### Test Expected Outputs

| Test | Input | MUX Select | DEMUX Select | Expected Y | Status |
|------|-------|-----------|--------------|-----------|--------|
| 1 | 0x5555 | 0000 | 0000 | '1' | ✅ |
| 2 | 0x5555 | 0101 | 0101 | '0' | ✅ |
| 3 | 0x5555 | 1010 | 1010 | '1' | ✅ |
| 4 | 0x5555 | 1100 | 0011 | '1' | ✅ |
| 5 | 0xF0F0 | 0111 | 0111 | '0' | ✅ |
| 6 | 0xF0F0 | 1000 | 0001 | '1' | ✅ |
| 7 | 0xAAAA | 0-15 | 0-15 | Various | ✅ |

---

## 📚 Reference

### AND Gate Truth Table

```
AND truth table:
A | B | A AND B
--|---|--------
0 | 0 |   0
0 | 1 |   0
1 | 0 |   0
1 | 1 |   1
```

### OR Gate Truth Table

```
OR truth table:
A | B | A OR B
--|---|-------
0 | 0 |   0
0 | 1 |   1
1 | 0 |   1
1 | 1 |   1
```

### NOT Gate Truth Table

```
NOT truth table:
A | NOT A
--|------
0 |   1
1 |   0
```

---

## 🎓 Synthesis View (Hardware)

After synthesis, this design becomes:

```
┌─ D[15]     ─┐
│ AND & OR    ├─ Y
│ gates       │
└─ S[3:0] ───┘

Physical gates:
• 4 NOT gates
• 32 AND gates (5-input)
• 1 OR gate (16-input)
```

---

**Version:** 1.0  
**Created:** 10 July 2026  
**For:** EDA Playground  
**Status:** Ready to use ✓

---

## Next Steps

1. **Upload to EDA Playground**
2. **Run simulation**
3. **Verify outputs match expected values**
4. **View waveforms to understand gate operation**
5. **Compare with CASE statement version**
6. **Learn gate-level design concepts**

---

**Happy Learning! 🚀**
