# EDA Playground Setup สำหรับ Lab-1

---

## 🚀 วิธีใช้ Lab-1 Code กับ EDA Playground

### ✅ ตัวเลือก 1: All-in-One File (แนะนำสำหรับเริ่มต้น)

**ไฟล์:** `eda_playground_lab1_all_in_one.vhdl`

#### ขั้นตอน:

1. **เข้า EDA Playground**
   - ไปที่ https://www.edaplayground.com/
   - Click "Launch EDA Playground"

2. **Select Tools**
   - Simulator: **GHDL**
   - Language: **VHDL 93** (or 2008)
   - Top Module: **Lab1_Test**

3. **Copy Code**
   - เปิดไฟล์ `eda_playground_lab1_all_in_one.vhdl`
   - Copy ทั้งหมด (Ctrl+A, Ctrl+C)

4. **Paste ใน EDA Playground**
   - ด้านซ้าย (Code Editor) ให้เว้นว่างไว้
   - Paste code (Ctrl+V)

5. **Run Simulation**
   - Click ปุ่ม **Run** ▶
   - รอจนกว่า Simulation ทำงานเสร็จ

6. **ดูผลลัพธ์**
   - ด้านขวา (Output) จะแสดง report ทั้งหมด
   - Click **"Show Waveform"** ด้านล่าง

#### ข้อดี:
- ✓ ง่าย - ไฟล์เดียว
- ✓ ไม่ต้องสร้างหลายไฟล์
- ✓ Run ได้เลย

#### ข้อเสีย:
- ✗ Code ยาว (1 ไฟล์)
- ✗ ไม่ดีสำหรับการจัดการ version ใหญ่

---

### ✅ ตัวเลือก 2: Multiple Files (แนะนำสำหรับขั้นสูง)

**ไฟล์:**
- `eda_mux_16to1.vhdl`
- `eda_demux_1to16.vhdl`
- `eda_testbench_lab1.vhdl`

#### ขั้นตอน:

1. **เข้า EDA Playground**
   - ไปที่ https://www.edaplayground.com/
   - Click "Launch EDA Playground"

2. **Select Tools**
   - Simulator: **GHDL**
   - Language: **VHDL 93** (or 2008)
   - Top Module: **Lab1_Test**

3. **เพิ่มไฟล์ที่ 1: MUX**
   - Click ปุ่ม **+** (เพิ่มไฟล์ใหม่)
   - ตั้งชื่อ: `mux.vhd`
   - Copy code จาก `eda_mux_16to1.vhdl`
   - Paste ใน editor

4. **เพิ่มไฟล์ที่ 2: DEMUX**
   - Click ปุ่ม **+** อีกครั้ง
   - ตั้งชื่อ: `demux.vhd`
   - Copy code จาก `eda_demux_1to16.vhdl`
   - Paste ใน editor

5. **เพิ่มไฟล์ที่ 3: Testbench**
   - Click ปุ่ม **+** อีกครั้ง
   - ตั้งชื่อ: `tb.vhd`
   - Copy code จาก `eda_testbench_lab1.vhdl`
   - Paste ใน editor

6. **Run Simulation**
   - Click ปุ่ม **Run** ▶
   - EDA Playground จะ compile ทั้ง 3 ไฟล์โดยอัตโนมัติ

7. **ดูผลลัพธ์**
   - ด้านขวา (Output) จะแสดง report
   - Click **"Show Waveform"** ด้านล่าง

#### ข้อดี:
- ✓ Code จัดระเบียบดี
- ✓ ง่ายต่อการแก้ไข
- ✓ เหมือน professional project

#### ข้อเสีย:
- ✗ ต้องสร้าง 3 ไฟล์
- ✗ ซับซ้อนเล็กน้อย

---

## 📝 Code Structure

### File 1: mux.vhd (26 บรรทัด)

```vhdl
entity MUX_16to1 is
    Port (
        D : in STD_LOGIC_VECTOR(15 downto 0);
        S : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC
    );
end MUX_16to1;
```

**หลักการ:**
- Input: D[15:0] (16 data lines) + S[3:0] (4 select lines)
- Output: Y (1 output line)
- Selects 1 input จาก 16 inputs

### File 2: demux.vhd (28 บรรทัด)

```vhdl
entity DEMUX_1to16 is
    Port (
        D : in STD_LOGIC;
        S : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(15 downto 0)
    );
end DEMUX_1to16;
```

**หลักการ:**
- Input: D (1 input line) + S[3:0] (4 select lines)
- Output: Y[15:0] (16 output lines)
- Routes 1 input ไปยัง 1 of 16 outputs

### File 3: tb.vhd (210 บรรทัด)

```vhdl
entity Lab1_Test is
end Lab1_Test;

architecture test of Lab1_Test is
    component MUX_16to1
        Port (D, S, Y);
    end component;
    
    component DEMUX_1to16
        Port (D, S, Y);
    end component;
begin
    MUX: MUX_16to1 port map (D, S, mux_output);
    DEMUX: DEMUX_1to16 port map (mux_output, S, demux_output);
    
    process begin
        -- Tests here
    end process;
end test;
```

**หลักการ:**
- Instantiate MUX และ DEMUX
- Connect MUX output → DEMUX input
- Test ด้วย independent select lines

---

## 📊 Test Cases ที่รวมอยู่

### Test 1: Basic MUX (Select = 0000)
```
Input: 0x5555 = 0101010101010101
Select MUX = 0000 (D0)
Select DEMUX = 0000 (Y0)
Expected: MUX Output = '1' (D0=1)
Expected: DEMUX Y0 = '1'
```

### Test 2: Basic MUX (Select = 0101)
```
Select MUX = 0101 (D5)
Select DEMUX = 0101 (Y5)
Expected: MUX Output = '0' (D5=0)
Expected: DEMUX Y5 = '0'
```

### Test 3: Basic MUX (Select = 1010)
```
Select MUX = 1010 (D10)
Select DEMUX = 1010 (Y10)
Expected: MUX Output = '1' (D10=1)
Expected: DEMUX Y10 = '1'
```

### Test 4: ⭐ INDEPENDENT SELECT (KEY TEST)
```
MUX Select = 1100 (D12='1')
DEMUX Select = 0011 (Y3)
Expected: MUX selects D12 (='1')
Expected: DEMUX routes to Y3 (='1')
Result: Y3='1', Y12='0' (because Y12 is not selected in DEMUX)
```

### Test 5: Different Input (0xF0F0)
```
Input: 0xF0F0 = 1111000011110000
D0-D7=0, D8-D15=1
Select MUX = 0111 (D7='0')
Select DEMUX = 0111 (Y7)
Expected: MUX Output = '0'
Expected: DEMUX Y7 = '0'
```

### Test 6: Another Independent Select
```
Input: 0xF0F0
MUX Select = 1000 (D8='1')
DEMUX Select = 0001 (Y1)
Expected: Y1='1'
```

### Test 7: Sweep All 16 Values
```
Loop through Select = 0 to 15
For each value: verify MUX & DEMUX
Input: 0xAAAA = 1010101010101010
```

---

## 🖥️ Expected Output (Console)

```
========================================
  Lab-1: MUX (16:1) + DEMUX (1:16)
========================================

Input Data: 0x5555 (binary: 0101010101010101)
D0=1, D1=0, D2=1, D3=0, ... D14=1, D15=0

------- Test 1: Select = 0000 (D0) -------
MUX selects D0 = '1'
DEMUX routes to Y0 = 1
Expected: Y0='1', others='0'
PASS: MUX Output = '1', DEMUX Y0 = '1'

...

========================================
  SIMULATION COMPLETED
========================================
All 7 tests completed successfully!
16:1 MUX and 1:16 DEMUX working correctly
Independent select lines functioning
========================================
```

---

## 🌊 Waveform Signals ที่ต้องดู

**Add เหล่านี้ไป Waveform:**

1. **input_data[15:0]** - Input data (16-bit)
2. **select_mux[3:0]** - MUX select lines
3. **mux_output** - MUX output (1-bit)
4. **select_demux[3:0]** - DEMUX select lines
5. **demux_output[15:0]** - DEMUX output (16-bit)

**การดู Waveform:**
```
Time (ns):  0    20   40   60   80   100  120  140
           ┌────────────────────────────────────────┐
input_data │5555..............................│
select_mux │0000│0101│1010│1100│0111│1000│...│
mux_output │ 1  │ 0  │ 1  │ 1  │ 0  │ 1  │...│
select_demux│000│0101│1010│0011│0111│0001│...│
demux_output│Y0:1│Y5:0│Y10:1│Y3:1│Y7:0│Y1:1│...│
           └────────────────────────────────────────┘
```

---

## ⚙️ Settings ที่ถูกต้อง

### Simulator Settings

| Setting | Value |
|---------|-------|
| Simulator | GHDL |
| Language | VHDL 93 (หรือ 2008) |
| Top Module | Lab1_Test |
| Elaboration Time | 10s+ |

### Compilation Options (ถ้าเป็นอัตโนมัติ)

```bash
ghdl -i --workdir=work *.vhd
ghdl -m --workdir=work Lab1_Test
ghdl -r --workdir=work Lab1_Test --vcd=test.vcd
```

---

## 🎯 ตรวจสอบผลลัพธ์

### ✅ ถ้า Simulation สำเร็จ

```
Output:
✓ Simulation completed
✓ All tests passed
✓ Waveform generated
```

### ❌ ถ้า Error

| Error | สาเหตุ | วิธีแก้ |
|-------|--------|--------|
| `Entity not found` | Missing entity | ตรวจสอบชื่อ entity ถูกต้อง |
| `Port mismatch` | Port ไม่ตรงกัน | ตรวจสอบ port declaration |
| `Syntax error` | โค้ดมี syntax ผิด | ตรวจสอบ syntax VHDL |
| `Timeout` | Simulation ยาวเกินไป | Reduce wait time |

---

## 💾 Save & Share

### Save Project

```
1. Click "File" → "Save"
2. Login ด้วย GitHub/Google
3. Project ได้ save
```

### Share Project

```
1. Click "Share"
2. Copy URL
3. Send ให้คนอื่น
4. คนอื่นสามารถ view + fork ได้
```

### Export Results

```
1. Click "Export as VCD"
2. File จะ download ลง computer
3. ใช้ gtkwave เปิดได้
   gtkwave simulation.vcd
```

---

## 📚 Quick Reference

### Select Values

| Select (Binary) | Decimal | Select D/Y | Binary: S3S2S1S0 |
|-----------------|---------|-----------|------------------|
| 0000 | 0 | D0/Y0 | 0000 |
| 0001 | 1 | D1/Y1 | 0001 |
| 0010 | 2 | D2/Y2 | 0010 |
| 0011 | 3 | D3/Y3 | 0011 |
| ... | ... | ... | ... |
| 1111 | 15 | D15/Y15 | 1111 |

### Test Input Values

| Value | Hex | Binary | D0-D7 | D8-D15 | Usage |
|-------|-----|--------|-------|--------|-------|
| 0x5555 | 5555 | 01010101... | Alternating | Alternating | General |
| 0xF0F0 | F0F0 | 11110000... | All 0 | All 1 | Test change |
| 0xAAAA | AAAA | 10101010... | Alternating | Alternating | Sweep test |
| 0xFFFF | FFFF | 11111111... | All 1 | All 1 | Edge case |

---

## 🎓 Learning Objectives

หลังจากใช้ EDA Playground เสร็จแล้ว ควรเข้าใจ:

1. ✓ วิธีใช้ EDA Playground online
2. ✓ การเชื่อมต่อ MUX + DEMUX
3. ✓ Independent select lines
4. ✓ วิธีอ่าน Simulation output
5. ✓ วิธีดู Waveforms
6. ✓ วิธี Export & Share

---

**Created:** 10 July 2026  
**For:** CE-200 Digital Systems Lab-1  
**EDA Playground Version:** GHDL  
**Status:** Ready to use ✓
