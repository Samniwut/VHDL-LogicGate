# Lab-1: 16:1 Multiplexer และ 1:16 Demultiplexer - วิธีใช้งาน

---

## 📋 สารบัญ

1. [ข้อกำหนด (Requirements)](#ข้อกำหนด)
2. [การติดตั้ง (Installation)](#การติดตั้ง)
3. [วิธีรัน Simulation](#วิธีรัน-simulation)
4. [วิธีเปิด GTKWave](#วิธีเปิด-gtkwave)
5. [การแก้ไขและทดสอบ](#การแก้ไขและทดสอบ)
6. [คำสั่ง Makefile ทั้งหมด](#คำสั่ง-makefile-ทั้งหมด)
7. [แก้ไขปัญหาบ่อยๆ (Troubleshooting)](#แก้ไขปัญหาบ่อยๆ)
8. [ไฟล์และไดเรกทรอรี่](#ไฟล์และไดเรกทรอรี่)

---

## ข้อกำหนด

### Software ที่ต้องติดตั้ง

**จำเป็น (Required):**
- `ghdl` - VHDL Simulator (GNU VHDL)
- `make` - Build tool (อาจติดตั้งมาแล้วกับ macOS/Linux)

**ตัวเลือก (Optional):**
- `gtkwave` - Waveform Viewer (สำหรับดูกราฟสัญญาณ)

### ตรวจสอบการติดตั้ง

```bash
# ตรวจสอบ ghdl
ghdl --version

# ตรวจสอบ make
make --version

# ตรวจสอบ gtkwave (ถ้าติดตั้ง)
gtkwave --version
```

---

## การติดตั้ง

### macOS

**ใช้ Homebrew:**
```bash
# ติดตั้ง ghdl
brew install ghdl

# ติดตั้ง gtkwave (ตัวเลือก)
brew install gtkwave
```

### Linux (Ubuntu/Debian)

```bash
# ติดตั้ง ghdl
sudo apt-get install ghdl

# ติดตั้ง gtkwave (ตัวเลือก)
sudo apt-get install gtkwave

# ติดตั้ง make (ถ้ายังไม่มี)
sudo apt-get install make build-essential
```

### Windows

**ใช้ MSYS2 หรือ WSL:**
```bash
# ด้วย MSYS2
pacman -S mingw-w64-x86_64-ghdl
pacman -S mingw-w64-x86_64-gtkwave
```

**หรือ ดาวน์โหลดตรงจาก:**
- GHDL: https://github.com/ghdl/ghdl/releases
- GTKWave: http://gtkwave.sourceforge.net/

---

## วิธีรัน Simulation

### ขั้นตอนที่ 1: เข้าไปในไดเรกทรอรี่

```bash
cd /Users/mac_sam/Desktop/Learning-69/CE-200-Digital/VHDL-OS/lab-1-mux-demux
```

หรือ ในเทอร์มินัล:
```bash
cd ~/Desktop/Learning-69/CE-200-Digital/VHDL-OS/lab-1-mux-demux
```

### ขั้นตอนที่ 2: รัน Simulation

**วิธีที่ 1: ใช้ Makefile (ง่ายที่สุด)**
```bash
make simulate
```

**วิธีที่ 2: รันคำสั่งแยก**
```bash
# Compile VHDL files
mkdir -p work
ghdl -i -fsynopsys --workdir=work mux_16to1.vhdl demux_1to16.vhdl testbench.vhdl

# Elaborate
ghdl -m -fsynopsys --workdir=work Lab1_TB

# Run simulation
ghdl -r --workdir=work Lab1_TB --vcd=lab1_simulation.vcd
```

### ผลลัพธ์ที่ควรได้

```
======================================
VHDL Compilation and Simulation
======================================
mkdir -p work
ghdl -i -fsynopsys --workdir=work mux_16to1.vhdl demux_1to16.vhdl testbench.vhdl
ghdl -m -fsynopsys --workdir=work Lab1_TB
analyze testbench.vhdl
analyze mux_16to1.vhdl
analyze demux_1to16.vhdl
elaborate lab1_tb
ghdl -r --workdir=work Lab1_TB --vcd=lab1_simulation.vcd

[ตามด้วย Test Results ...]

============================================
Lab-1: Multiplexer and Demultiplexer Test
============================================
Input Data: 0101010101010101 (0x5555)

--- Test 1: Select = 0000 (D0) ---
MUX Output: '1'
DEMUX Output at Y0: '1'

[... รวม 7 tests ...]

============================================
Test Completed
============================================

Simulation completed. VCD file: lab1_simulation.vcd
```

---

## วิธีเปิด GTKWave

### ขั้นตอนที่ 1: รัน Simulation (ถ้ายังไม่ได้รัน)

```bash
make simulate
```

### ขั้นตอนที่ 2: เปิด GTKWave

**วิธีที่ 1: ใช้ Makefile**
```bash
make wave
```

**วิธีที่ 2: รันตรง**
```bash
gtkwave lab1_simulation.vcd &
```

### ขั้นตอนที่ 3: ใช้ GTKWave

#### A) เพิ่มสัญญาณไปที่ Waveform

1. **ที่ด้านซ้าย** จะเห็น "SST (Scope and Signal Tree)"
2. **คลิก** ที่ `Top` → `Lab1_TB` เพื่อขยาย
3. **คลิกค้าง** ที่ชื่อสัญญาณแล้วลากไปยัง Waveform area
   - `input_data` - ข้อมูลอินพุต 16 bit
   - `select_mux` - Select lines ของ MUX
   - `mux_output` - Output ของ MUX
   - `select_demux` - Select lines ของ DEMUX
   - `demux_output` - Output ของ DEMUX 16 bit

#### B) ดูรายละเอียด

| ฟังก์ชัน | คีย์บอร์ด | วิธี |
|---------|----------|------|
| Zoom In | `+` | กด `+` หรือ scroll wheel |
| Zoom Out | `-` | กด `-` หรือ scroll wheel |
| Zoom Full | `Ctrl+F` | มองเห็นทั้งหมด |
| Go to Start | `Home` | ไปที่จุดเริ่มต้น |
| Go to End | `End` | ไปที่จุดสิ้นสุด |
| Search | `Ctrl+F` | ค้นหาสัญญาณ |
| Measure | Middle-click | วัดระยะเวลา |

#### C) ตัวอย่างการวิเคราะห์

```
Timeline (Waveform):
┌─────────────────────────────────────────────┐
│ input_data     [0x5555............... ]      │
│ select_mux     [0000][0001][0101]...[1100] │
│ mux_output     [  1 ][  0 ][  0 ]...[  1 ] │
│ select_demux   [0000][0001][0101]...[0011] │
│ demux_output   [Y0:1][Y1:0][Y5:0]...[Y3:1] │
└─────────────────────────────────────────────┘
  0ns   10ns  20ns  30ns ... 70ns
```

---

## การแก้ไขและทดสอบ

### แก้ไขค่า Input Data

**ไฟล์:** `testbench.vhdl`

```vhdl
-- บรรทัด 53
input_data <= x"5555";  -- เปลี่ยนค่านี้
```

**ตัวอย่าง:**
```vhdl
input_data <= x"AAAA";  -- 1010101010101010
input_data <= x"F0F0";  -- 1111000011110000
input_data <= x"FF00";  -- 1111111100000000
input_data <= x"0001";  -- 0000000000000001
```

### แก้ไขค่า Select

**ไฟล์:** `testbench.vhdl`

**ตัวอย่าง การเพิ่ม Test Case:**
```vhdl
-- เพิ่มหลังบรรทัด 120
-- Test 8: Custom test
report "--- Test 8: Custom Select ---";
select_mux <= "1000";  -- เลือก D8
select_demux <= "1000"; -- ส่งไป Y8
wait for 10 ns;
report "MUX Output: " & std_logic'image(mux_output);
report "DEMUX Output at Y8: " & std_logic'image(demux_output(8));
report "";
```

### รันใหม่หลังแก้ไข

```bash
make clean      # ลบไฟล์เก่า
make simulate   # รันใหม่
make wave       # เปิด GTKWave
```

---

## คำสั่ง Makefile ทั้งหมด

| คำสั่ง | คำอธิบาย |
|--------|---------|
| `make all` | Compile และ Simulate (เหมือน `make simulate`) |
| `make simulate` | รัน Simulation สร้าง VCD file |
| `make wave` | รัน Simulation และเปิด GTKWave |
| `make clean` | ลบไฟล์ compiled ทั้งหมด |
| `make help` | แสดงความช่วยเหลือ |

### ตัวอย่างการใช้

```bash
# รันครั้งแรก
make simulate

# ดูผลลัพธ์ด้วย GTKWave
make wave

# แก้ไขโค้ด แล้วรันใหม่
nano testbench.vhdl
make clean
make simulate

# ทำความสะอาด
make clean
```

---

## แก้ไขปัญหาบ่อยๆ

### ❌ Error: "ghdl: command not found"

**สาเหตุ:** ghdl ยังไม่ติดตั้ง

**วิธีแก้:**
```bash
# macOS
brew install ghdl

# Ubuntu/Debian
sudo apt-get install ghdl

# ตรวจสอบ
ghdl --version
```

### ❌ Error: "directory 'work' set by --workdir= does not exist"

**สาเหตุ:** โฟลเดอร์ work ยังไม่สร้าง

**วิธีแก้:**
```bash
mkdir -p work
make simulate
```

### ❌ Error: "gtkwave: command not found"

**สาเหตุ:** gtkwave ยังไม่ติดตั้ง

**วิธีแก้:**
```bash
# macOS
brew install gtkwave

# Ubuntu/Debian
sudo apt-get install gtkwave
```

**ทางเลือก:** ดูไฟล์ VCD ด้วยโปรแกรมอื่น เช่น
```bash
# ดูเป็น text
cat lab1_simulation.vcd

# ใช้ Vivado, Quartus, หรือ ModelSim
```

### ❌ Error: "use of synopsys package needs the -fsynopsys option"

**สาเหตุ:** ใช้ STD_LOGIC_ARITH หรือ STD_LOGIC_UNSIGNED โดยไม่มี flag

**วิธีแก้:** Makefile ควรมี `-fsynopsys` (ตรวจสอบไฟล์ Makefile)

### ❌ VCD file ว่างเปล่า

**สาเหตุ:** Simulation ไม่จบการทำงาน

**วิธีแก้:**
```bash
make clean
make simulate
```

### ⚠️ GTKWave เปิดแต่ไม่แสดงสัญญาณ

**สาเหตุ:** ต้องเพิ่มสัญญาณด้วยตนเอง

**วิธีแก้:**
1. ทางด้านซ้าย คลิกขยาย `Top` → `Lab1_TB`
2. คลิกค้างที่ `input_data` ลากไปยัง Waveform
3. ทำซ้ำสำหรับสัญญาณอื่นๆ

---

## ไฟล์และไดเรกทรอรี่

### ไฟล์ต้นฉบับ (Source Files)

```
lab-1-mux-demux/
│
├── mux_16to1.vhdl
│   └── คำอธิบาย: 16:1 Multiplexer Entity
│       - Input: D[15:0], S[3:0]
│       - Output: Y
│       - ใช้ CASE statement เพื่อเลือก input
│
├── demux_1to16.vhdl
│   └── คำอธิบาย: 1:16 Demultiplexer Entity
│       - Input: D, S[3:0]
│       - Output: Y[15:0]
│       - ส่งข้อมูลไปยัง output ที่เลือก
│
├── testbench.vhdl
│   └── คำอธิบาย: Test Bench
│       - Instantiate MUX และ DEMUX
│       - 7 Test Cases พร้อม Report
│       - สร้าง VCD file
│
├── Makefile
│   └── Build script
│       - compile: `ghdl -i -fsynopsys`
│       - elaborate: `ghdl -m -fsynopsys`
│       - run: `ghdl -r --vcd=...`
│
├── README.md (ไฟล์นี้)
│   └── วิธีใช้งานและ Tutorial
│
└── Lab_Report.md
    └── Lab Report ที่มีรายละเอียด
```

### ไฟล์ที่สร้างขึ้นขณะรัน

```
lab-1-mux-demux/
│
├── work/ (directory)
│   ├── e~demux_1to16.o
│   ├── e~lab1_tb.o
│   ├── e~mux_16to1.o
│   └── (ไฟล์ compiled อื่นๆ)
│
├── lab1_tb (executable)
│   └── Binary file สำหรับรัน simulation
│
└── lab1_simulation.vcd
    └── VCD file (Value Change Dump)
        - บันทึกการเปลี่ยนแปลงสัญญาณ
        - ใช้ได้กับ gtkwave
```

### ขนาดไฟล์

```
mux_16to1.vhdl      ~1.1 KB   (38 lines)
demux_1to16.vhdl    ~1.3 KB   (42 lines)
testbench.vhdl      ~4.2 KB   (132 lines)
Makefile            ~1.1 KB   (39 lines)
Lab_Report.md       ~15  KB   (398 lines)
README.md           (ไฟล์นี้)
lab1_simulation.vcd ~1.4 KB   (VCD output)
```

---

## Quick Start Guide

### สำหรับผู้เริ่มต้น (5 นาที)

```bash
# 1. เข้าไปในไดเรกทรอรี่
cd lab-1-mux-demux

# 2. รัน Simulation
make simulate

# 3. ดูผลลัพธ์ (ดูเอาต์พุท)
# จะเห็น Test Results 7 ชุด

# เสร็จ!
```

### สำหรับผู้ที่ต้องการดูกราฟ (10 นาที)

```bash
# 1. เข้าไปในไดเรกทรอรี่
cd lab-1-mux-demux

# 2. รัน Simulation + เปิด GTKWave
make wave

# 3. ในหน้า GTKWave:
#    - ด้านซ้าย: คลิกขยาย Top → Lab1_TB
#    - คลิกค้าง input_data, select_mux, mux_output ลากไปยังกราฟ
#    - Zoom in/out เพื่อดูรายละเอียด

# 4. ปิด GTKWave
# Command+Q (macOS) หรือ Alt+F4 (Windows/Linux)
```

### สำหรับผู้ที่ต้องการแก้ไขและทดสอบ (15 นาที)

```bash
# 1. เข้าไปในไดเรกทรอรี่
cd lab-1-mux-demux

# 2. แก้ไขโค้ด
nano testbench.vhdl
# แก้ไขค่า input_data หรือ select lines

# 3. ลบไฟล์เก่า
make clean

# 4. รันใหม่
make simulate

# 5. เปิด GTKWave เพื่อดูผลการเปลี่ยนแปลง
make wave
```

---

## การศึกษาเพิ่มเติม

### สิ่งที่ควรศึกษา

1. **Truth Table ของ MUX/DEMUX**
   - เปิด `Lab_Report.md` ดูหัวข้อ 2.1 และ 2.2

2. **วิธีการทำงาน**
   - ดูคำตอบคำถาม หัวข้อ 7.1, 7.2, 7.3

3. **VHDL Syntax**
   - ศึกษาไฟล์ `*.vhdl` พร้อมกับ `Digital_Systems_Learning.md`

4. **Waveform Analysis**
   - เปิด `lab1_simulation.vcd` ด้วย gtkwave
   - ดูการเปลี่ยนแปลงของ select lines

### Resources

- **VHDL Guide:** `Digital_Systems_Learning.md`
- **Lab Report:** `Lab_Report.md`
- **GHDL Manual:** https://ghdl.readthedocs.io/
- **GTKWave Wiki:** http://gtkwave.sourceforge.net/

---

## สรุป

| ขั้นตอน | คำสั่ง | เวลา |
|--------|--------|------|
| 1. ตรวจสอบการติดตั้ง | `ghdl --version` | 1 นาที |
| 2. เข้าไปในไดเรกทรอรี่ | `cd lab-1-mux-demux` | 1 นาที |
| 3. รัน Simulation | `make simulate` | 2 นาที |
| 4. เปิด GTKWave | `make wave` | 2 นาที |
| 5. ดูและวิเคราะห์ | กลิ้งเมาส์และคลิก | 5+ นาที |

**รวมทั้งสิ้น:** 10-15 นาทีสำหรับการทดลองครั้งแรก

---

**หากมีคำถาม:** ดูไฟล์ `Lab_Report.md` สำหรับรายละเอียดเพิ่มเติม

---

**เขียนเมื่อ:** 10 July 2026  
**สำหรับ:** CE-200 Digital Systems Lab-1  
**สถานะ:** เสร็จสิ้น ✓
