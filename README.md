# VHDL-OS Learning Project

รวมศูนย์การเรียนรู้ VHDL: Multiplexer, Demultiplexer, และ Combinational Logic

---

## 📁 โครงสร้างโปรเจค

```
VHDL-OS/
├── lab-1-1/              # Mux 16→1 (if-elsif)
├── lab-1-1-mux/          # Mux 16→1 (Combinational Logic: AND-OR)
├── lab-1-2-demux/        # Demux 1→16 (Combinational Logic: AND)
├── lab-1-3-combined/     # Combined Mux + Demux with Selectors
└── README.md
```

---

## 🚀 วิธี Save & Run VHDL

### 1️⃣ Save ไฟล์

ไฟล์ที่สำคัญสำหรับแต่ละโปรเจค:
- **design.vhd** - ไฟล์ design หลัก (entity + architecture)
- **testbench.vhd** - ไฟล์ testbench (ทดสอบวงจร)

### 2️⃣ Compile & Run บนเครื่อง

```bash
# เข้าไปในโฟลเดอร์ที่ต้องการ
cd /path/to/lab-xxx

# Compile ทั้งสองไฟล์
ghdl -i design.vhd testbench.vhd

# Link/elaborate
ghdl -m testbench

# Run simulation และสร้าง VCD file
ghdl -r testbench --vcd=dump.vcd

# ดู waveform
gtkwave dump.vcd
```

---

## 📊 รายละเอียดแต่ละ Lab

### **lab-1-1: Mux 16→1 (if-elsif)**
- **Logic:** if-elsif statement
- **Inputs:** D0-D15 (16), S3-S0 (4-bit select)
- **Output:** Y (1)

**Run:**
```bash
cd lab-1-1
ghdl -i design.vhd testbench.vhd && ghdl -m testbench && ghdl -r testbench --vcd=dump.vcd
gtkwave dump.vcd
```

---

### **lab-1-1-mux: Mux 16→1 (Combinational Logic)**
- **Logic:** Sum-of-Products (AND-OR gates)
- **Inputs:** D0-D15 (16), S3-S0 (4-bit select)
- **Output:** Y (1)

**Logic Equation:**
```
Y = (D0·S̄3·S̄2·S̄1·S̄0) + (D1·S̄3·S̄2·S̄1·S0) + ... + (D15·S3·S2·S1·S0)
```

**Run:**
```bash
cd lab-1-1-mux
ghdl -i design.vhd testbench.vhd && ghdl -m testbench && ghdl -r testbench --vcd=dump.vcd
gtkwave dump.vcd
```

---

### **lab-1-2-demux: Demux 1→16 (Combinational Logic)**
- **Logic:** AND gates
- **Input:** In_signal (1), S3-S0 (4-bit select)
- **Outputs:** D0-D15 (16)

**Logic Equation:**
```
D0 = In · S̄3 · S̄2 · S̄1 · S̄0
D1 = In · S̄3 · S̄2 · S̄1 · S0
...
D15 = In · S3 · S2 · S1 · S0
```

**Run:**
```bash
cd lab-1-2-demux
ghdl -i design.vhd testbench.vhd && ghdl -m testbench && ghdl -r testbench --vcd=dump.vcd
gtkwave dump.vcd
```

---

### **lab-1-3-combined: Combined Selector**
- **Logic:** Mux (AND-OR) + Demux (AND)
- **Inputs:** D0-D15 (16), S3_input-S0_input (4-bit select input)
- **Outputs:** D0_out-D15_out (16), S3_output-S0_output (4-bit select output)

**Flow:**
```
D_in[0-15] → (Select Input) → internal_signal → (Select Output) → D_out[0-15]
```

**Run:**
```bash
cd lab-1-3-combined
ghdl -i design.vhd testbench.vhd && ghdl -m testbench && ghdl -r testbench --vcd=dump.vcd
gtkwave dump.vcd
```

---

## 🔧 Tools Required

- **GHDL** - VHDL Compiler/Simulator
- **GTKWave** - Waveform Viewer

### Install (Mac):
```bash
brew install ghdl
brew install gtkwave
```

### Install (Linux):
```bash
sudo apt-get install ghdl
sudo apt-get install gtkwave
```

---

## 📝 Test Cases

### Mux 16→1
```
Select | Input  | Output
-------|--------|-------
0000   | D0=1   | Y=1
0001   | D1=1   | Y=1
...
1111   | D15=1  | Y=1
```

### Demux 1→16
```
Select | In=1   | Output
-------|--------|-------
0000   | Y=1    | D0=1, others=0
0001   | Y=1    | D1=1, others=0
...
1111   | Y=1    | D15=1, others=0
```

### Combined
```
Input Select | Output Select | Flow
---------------|----------------|----------
D0 (0000)      | D0 (0000)      | D0 → D0 ✓
D0 (0000)      | D1 (0001)      | D0 → D1 ✓
D7 (0111)      | D11 (1011)     | D7 → D11 ✓
D15 (1111)     | D7 (0111)      | D15 → D7 ✓
```

---

## 💾 File Structure

```
lab-1-1-mux/
├── design.vhd       # Mux logic
├── testbench.vhd    # Test cases
└── dump.vcd         # Generated waveform

lab-1-2-demux/
├── design.vhd       # Demux logic
├── testbench.vhd    # Test cases
└── dump.vcd         # Generated waveform

lab-1-3-combined/
├── design.vhd       # Combined logic
├── testbench.vhd    # Test cases
└── dump.vcd         # Generated waveform
```

---

## 📚 Learning Resources

- **Multiplexer (Mux):** เลือก 1 จาก N inputs
- **Demultiplexer (Demux):** ส่ง 1 input ไปยัง 1 จาก N outputs
- **Combinational Logic:** Logic ที่ output ขึ้นอยู่กับ input ในขณะนั้น (ไม่มี memory)
- **SOP (Sum-of-Products):** A·B + C·D + ...

---

## ✅ Status

- ✅ lab-1-1: Mux (if-elsif) - Complete
- ✅ lab-1-1-mux: Mux (AND-OR) - Complete
- ✅ lab-1-2-demux: Demux (AND) - Complete
- ✅ lab-1-3-combined: Combined Selector - Complete

**Total Test Cases:** 16 + 16 + 5 = **37 cases** ✓

---

## 📞 Notes

- ไฟล์ design.vhd มี entity + architecture
- ไฟล์ testbench.vhd มี component declaration + test process
- VCD file ถูกสร้างอัตโนมัติ และสามารถดูได้ใน GTKWave
- ทั้งหมดใช้ Combinational Logic (ไม่มี clocks)

---

**Last Updated:** 2026-07-12
**Author:** Sam_Mac
**Status:** 🎉 All labs completed successfully!
