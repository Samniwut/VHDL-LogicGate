# EDA Playground - คู่มือการใช้งาน

---

## 📚 สารบัญ

1. [EDA Playground คืออะไร](#eda-playground-คืออะไร)
2. [ข้อดี/ข้อเสีย](#ข้อดีข้อเสีย)
3. [เข้าใช้งาน](#เข้าใช้งาน)
4. [หน้าจอหลัก](#หน้าจอหลัก)
5. [ขั้นตอนสร้าง Project](#ขั้นตอนสร้าง-project)
6. [เขียนโค้ด VHDL](#เขียนโค้ด-vhdl)
7. [รัน Simulation](#รัน-simulation)
8. [ดูผลลัพธ์](#ดูผลลัพธ์)
9. [ตัวอย่าง - Multiplexer](#ตัวอย่าง---multiplexer)
10. [ตัวอย่าง - Demultiplexer](#ตัวอย่าง---demultiplexer)
11. [Advanced Features](#advanced-features)
12. [Tips & Tricks](#tips--tricks)

---

## EDA Playground คืออะไร

### 📖 คำนิยาม

**EDA Playground** เป็นเว็บแอปพลิเคชันฟรีที่ให้ผู้ใช้:
- เขียนโค้ด HDL (VHDL, Verilog, SystemVerilog)
- รัน Simulation ผ่าน Web Browser
- ดู Waveforms แบบ Interactive
- Save/Share Projects

**URL:** https://www.edaplayground.com/

### 🎯 ประสงค์การใช้

- ✓ การเรียนรู้ VHDL/Verilog
- ✓ Testing โครงการเล็กๆ
- ✓ Debugging โค้ด
- ✓ Sharing code กับคนอื่น
- ✓ Prototyping รวดเร็ว
- ✓ ไม่ต้องติดตั้ง Tools ท้องถิ่น

---

## ข้อดี/ข้อเสีย

### ✅ ข้อดี

| ข้อดี | คำอธิบาย |
|------|---------|
| **ฟรี** | ไม่ต้องเสียเงิน |
| **Online** | ไม่ต้องติดตั้ง ghdl, ModelSim |
| **ง่ายใช้** | UI intuitive, click-and-run |
| **Multi-language** | รองรับ VHDL, Verilog, SystemVerilog |
| **Waveform Viewer** | ดูกราฟสัญญาณในเบราว์เซอร์ |
| **Share** | สามารถ share link ให้คนอื่น |
| **History** | เก็บ version history ของ code |
| **No Installation** | ใช้เลยไม่ต้องติดตั้ง |

### ❌ ข้อเสีย

| ข้อเสีย | คำอธิบาย |
|--------|---------|
| **Internet Required** | ต้องใช้ internet ตลอดเวลา |
| **Speed** | Simulation อาจช้าสำหรับโปรเจ็กต์ใหญ่ |
| **Simulator Limitation** | ไม่ทันเทพลาดขั้นสูง (synthesis) |
| **Limited Storage** | ไม่มีพื้นที่เก็บไฟล์มาก |
| **No Offline Mode** | ต้องมี Connection |
| **Complex Design** | ยุ่งสำหรับวงจรที่ซับซ้อนมากๆ |

---

## เข้าใช้งาน

### ขั้นตอนที่ 1: เปิด Website

```
1. เปิด web browser (Chrome, Firefox, Safari, Edge)
2. ไปที่ https://www.edaplayground.com/
3. กดปุ่ม "Launch EDA Playground"
```

### ขั้นตอนที่ 2: สร้าง Account (ตัวเลือก)

```
- สามารถใช้โดยไม่ต้อง login
- แต่ถ้า login ได้จะ save projects ทั้งหมด
- Click "Sign in" → "Sign up with GitHub/Google/Email"
```

### ขั้นตอนที่ 3: Select Tools

EDA Playground รองรับ Simulators หลายตัว:
- **GHDL** (VHDL) - ฟรี, เร็ว
- **ModelSim** (VHDL/Verilog) - พรึ่นะพอ
- **Vivado** (VHDL/Verilog) - เต็มเวอร์ชั่น
- **Quartus** (VHDL/Verilog)
- **Icarus Verilog** (Verilog)

**ขอแนะนำสำหรับเบื่อน:**
- VHDL → ใช้ **GHDL**
- Verilog → ใช้ **Icarus Verilog** หรือ **ModelSim**

---

## หน้าจอหลัก

### 🖥️ Layout ของ EDA Playground

```
┌─────────────────────────────────────────────────────────────┐
│ File  Tools  Toolbar  Help  Account                         │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌─────────────────────────┐  ┌──────────────────────────┐  │
│  │   CODE EDITOR          │  │   SIMULATION OUTPUT      │  │
│  │                        │  │                          │  │
│  │  testbench.vhd:        │  │  Result:                 │  │
│  │  library IEEE;         │  │  ✓ Simulation passed     │  │
│  │  use IEEE.STD_...      │  │  ...                     │  │
│  │  entity test is        │  │                          │  │
│  │  ...                   │  │                          │  │
│  │                        │  │                          │  │
│  │                        │  │                          │  │
│  └─────────────────────────┘  └──────────────────────────┘  │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐   │
│  │         WAVEFORM VIEWER                            │   │
│  │  [Show Waveform] [Export VCD]                      │   │
│  │  Time    Signal       │││                          │   │
│  │  0ns     in_data [0101010101010101]                │   │
│  │  10ns    out          [1]                          │   │
│  │  ...     ...          ...                          │   │
│  │                                                     │   │
│  └──────────────────────────────────────────────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### 🎨 องค์ประกอบหลัก

1. **Code Editor** (ด้านซ้าย)
   - เขียนโค้ด VHDL/Verilog
   - Syntax highlighting
   - Line numbers

2. **Simulation Output** (ด้านบนขวา)
   - ข้อความจาก simulation
   - Error messages
   - Report outputs

3. **Waveform Viewer** (ด้านล่าง)
   - กราฟสัญญาณ
   - Timeline
   - Zoom/Pan controls

4. **Top Toolbar**
   - File operations
   - Tools selection
   - Run button

---

## ขั้นตอนสร้าง Project

### วิธีที่ 1: สร้างใหม่จาก Blank

```
1. Click "Create New"
2. เลือก Simulator เช่น "GHDL" (สำหรับ VHDL)
3. เลือก Language: "VHDL"
4. Click "Create"
```

### วิธีที่ 2: ใช้ Template

```
1. Click "Show all templates"
2. ค้นหา "Multiplexer" หรือ "Tutorial"
3. Click template ที่ต้องการ
4. โค้ดจะโหลดขึ้นมา
```

### วิธีที่ 3: Import จากไฟล์

```
1. Click "File" → "Open"
2. เลือกไฟล์ .vhd จากคอมพิวเตอร์
3. โค้ดจะโหลดขึ้นมา
```

---

## เขียนโค้ด VHDL

### ตัวอย่าง: 4:1 Multiplexer

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_4to1 is
    Port (
        D : in STD_LOGIC_VECTOR(3 downto 0);
        S : in STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC
    );
end MUX_4to1;

architecture Behavioral of MUX_4to1 is
begin
    process(D, S)
    begin
        case S is
            when "00" => Y <= D(0);
            when "01" => Y <= D(1);
            when "10" => Y <= D(2);
            when "11" => Y <= D(3);
            when others => Y <= '0';
        end case;
    end process;
end Behavioral;
```

### Tips สำหรับเขียนโค้ด

| Tips | คำอธิบาย |
|------|---------|
| **Auto-indent** | กด Tab แล้วจะ indent อัตโนมัติ |
| **Syntax Highlight** | คำ keyword เป็นสีต่างๆ |
| **Bracket Matching** | วางเคอร์เซอร์บน `(` จะ highlight `)` |
| **Find & Replace** | Ctrl+H สำหรับแทนที่ |
| **Go to Line** | Ctrl+G ไปยังบรรทัดที่ต้องการ |
| **Comment/Uncomment** | Ctrl+/ |
| **Copy Line** | Ctrl+C (ไม่ต้องเลือก) |

---

## รัน Simulation

### ขั้นตอนที่ 1: เตรียม Testbench

**ตัวอย่าง Testbench สำหรับ 4:1 Mux:**

```vhdl
entity Test_MUX is
end Test_MUX;

architecture test of Test_MUX is
    component MUX_4to1
        Port (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            S : in STD_LOGIC_VECTOR(1 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    signal input_d : STD_LOGIC_VECTOR(3 downto 0);
    signal select_s : STD_LOGIC_VECTOR(1 downto 0);
    signal output_y : STD_LOGIC;

begin
    UUT: MUX_4to1 port map (
        D => input_d,
        S => select_s,
        Y => output_y
    );

    process
    begin
        input_d <= "1010";

        select_s <= "00"; wait for 10 ns;
        select_s <= "01"; wait for 10 ns;
        select_s <= "10"; wait for 10 ns;
        select_s <= "11"; wait for 10 ns;

        report "Test complete";
        wait;
    end process;
end test;
```

### ขั้นตอนที่ 2: Click "Run" Button

```
1. ที่ด้านบนของ code editor มี ปุ่ม "Run" (▶ icon)
2. กด "Run"
3. Simulation จะรัน
```

### ขั้นตอนที่ 3: ตรวจสอบผลลัพธ์

ด้านขวา จะแสดง:
- ✓ Simulation passed
- ✗ Compilation error
- Error message (ถ้ามี)

---

## ดูผลลัพธ์

### 📊 Simulation Output

**ตำแหน่ง:** ด้านขวาบน (Output pane)

```
Simulation completed
Report from testbench:
Starting MUX test...

--- Test 1: Select = 00 ---
Output: 0

--- Test 2: Select = 01 ---
Output: 1

--- Test 3: Select = 10 ---
Output: 0

--- Test 4: Select = 11 ---
Output: 1

Test complete
```

### 🌊 Waveform View

**ตำแหน่ง:** ด้านล่าง (Waveform pane)

```
1. Click "Show Waveform"
2. จะแสดงกราฟสัญญาณ
3. Zoom in/out ด้วย scroll wheel
4. Click on signal ใน timeline
```

### 🔍 การอ่าน Waveform

```
Timeline:
0ns   10ns   20ns   30ns   40ns
│      │      │      │      │
input_d:  [1010..............................]
select_s: [00   ][01   ][10   ][11   ]
output_y: [0    ][1    ][0    ][1    ]
```

### 💾 Export VCD

```
1. Click "Export as VCD"
2. File จะ download ลง computer
3. เปิด gtkwave ได้
   gtkwave simulation.vcd
```

---

## ตัวอย่าง - Multiplexer

### 16:1 Multiplexer บน EDA Playground

**Step 1: สร้างไฟล์ MUX**

```vhdl
-- File: mux_16to1.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_16to1 is
    Port (
        D : in STD_LOGIC_VECTOR(15 downto 0);
        S : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC
    );
end MUX_16to1;

architecture Behavioral of MUX_16to1 is
begin
    Y <= D(conv_integer(S));
end Behavioral;
```

**Step 2: สร้าง Testbench**

```vhdl
-- File: tb_mux.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_mux is
end tb_mux;

architecture test of tb_mux is
    component MUX_16to1
        Port (
            D : in STD_LOGIC_VECTOR(15 downto 0);
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    signal D : STD_LOGIC_VECTOR(15 downto 0);
    signal S : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC;
begin
    UUT: MUX_16to1 port map (D => D, S => S, Y => Y);

    process
    begin
        D <= x"5555";
        
        for i in 0 to 15 loop
            S <= CONV_STD_LOGIC_VECTOR(i, 4);
            wait for 10 ns;
            report "Select: " & integer'image(i) & 
                    " Output: " & std_logic'image(Y);
        end loop;
        
        wait;
    end process;
end test;
```

**Step 3: Run Simulation**
- ปุ่ม Run
- ดู Output ด้านขวา
- ตรวจสอบ waveform

---

## ตัวอย่าง - Demultiplexer

### 1:16 Demultiplexer

```vhdl
-- File: demux_1to16.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEMUX_1to16 is
    Port (
        D : in STD_LOGIC;
        S : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(15 downto 0)
    );
end DEMUX_1to16;

architecture Behavioral of DEMUX_1to16 is
begin
    process(D, S)
    begin
        Y <= (others => '0');
        Y(conv_integer(S)) <= D;
    end process;
end Behavioral;
```

**Testbench:**

```vhdl
entity tb_demux is
end tb_demux;

architecture test of tb_demux is
    component DEMUX_1to16
        Port (
            D : in STD_LOGIC;
            S : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal D : STD_LOGIC;
    signal S : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC_VECTOR(15 downto 0);
begin
    UUT: DEMUX_1to16 port map (D => D, S => S, Y => Y);

    process
    begin
        D <= '1';
        
        for i in 0 to 15 loop
            S <= CONV_STD_LOGIC_VECTOR(i, 4);
            wait for 10 ns;
        end loop;
        
        wait;
    end process;
end test;
```

---

## Advanced Features

### 1️⃣ Multiple Files

```
สามารถสร้างหลายไฟล์ใน 1 project:
- File 1: mux.vhd (Entity)
- File 2: demux.vhd (Entity)
- File 3: testbench.vhd (Component instances)
```

**วิธี:**
```
1. Click "+" (เพิ่มไฟล์ใหม่)
2. ตั้งชื่อไฟล์ เช่น "mux.vhd"
3. เขียนโค้ด
4. Repeat สำหรับไฟล์อื่น
5. ในไฟล์สุดท้าย (testbench) reference ไฟล์อื่น
```

### 2️⃣ Save & Share

**Save Project:**
```
1. Click "File" → "Save"
2. ต้อง login ด้วย GitHub/Google
3. Project จะถูก save
4. สามารถเข้า "My Projects" ได้
```

**Share Project:**
```
1. กด "Share"
2. Copy URL
3. Send ให้คนอื่น
4. คนอื่นสามารถดู + fork ได้
```

### 3️⃣ Version History

```
1. Click "Revision"
2. เห็นรายการ revision ทั้งหมด
3. Click revision ก่อนหน้า เพื่อกลับไป
```

### 4️⃣ VCD Export & gtkwave

```bash
# หลังจาก Export VCD จาก EDA Playground
gtkwave simulation.vcd

# สามารถดู waveforms แบบละเอียด
# Zoom, measure, search signals
```

### 5️⃣ Different Simulators

**GHDL (แนะนำสำหรับ VHDL):**
```
- เร็ว
- ฟรี
- syntax error ชัดเจน
```

**ModelSim:**
```
- Feature มากมาย
- ใช้ใน industry
- slow เล็กน้อย
```

**Vivado/Quartus:**
```
- Vendor-specific
- Full features
- Slow บ้าง
```

---

## Tips & Tricks

### 💡 Tips ที่ควรรู้

| Tips | วิธี |
|------|------|
| **Quick Test** | ใช้ loop ใน process |
| **Print Values** | ใช้ report statement |
| **Avoid Errors** | Check syntax ก่อน run |
| **Fast Simulation** | ใช้ wait for ns แทน us |
| **Debug** | เพิ่ม report ทั่วโค้ด |
| **Watch Waveforms** | Export VCD ไป gtkwave |
| **Share Results** | Copy URL ของ project |

### 🐛 Debugging Techniques

```vhdl
-- Technique 1: Report dalam process
process
begin
    D <= x"5555";
    report "Input set to 0x5555" severity note;
    
    S <= "0000";
    wait for 10 ns;
    report "Select: 0000, Output: " & 
            std_logic'image(Y) severity note;
end process;

-- Technique 2: Assert statements
process
begin
    wait until (Y = '1');
    assert (Y = '1') report "Expected Y='1'" 
        severity error;
end process;
```

### ⚡ Performance Tips

```vhdl
-- Good: Short wait times
wait for 1 ns;

-- Bad: Too many events
wait for 0.001 ns;  -- 아니면 느려짐

-- Good: Use finite loop
for i in 0 to 15 loop
    S <= CONV_STD_LOGIC_VECTOR(i, 4);
    wait for 10 ns;
end loop;

-- Bad: Infinite loop
while true loop
    wait for 1 ns;
end loop;  -- Simulation never ends!
```

### 🎨 Code Organization

```vhdl
-- Structure ที่ดี:
-- 1. Library declarations
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2. Entity
entity MyDesign is
    Port (...);
end MyDesign;

-- 3. Architecture
architecture Behavioral of MyDesign is
    -- signals
    -- components
begin
    -- instantiations
    -- processes
end Behavioral;
```

---

## ความแตกต่าง: Local vs EDA Playground

| ลักษณะ | Local (ghdl) | EDA Playground |
|--------|-------------|---|
| **ติดตั้ง** | ต้องติดตั้ง | ไม่ต้อง |
| **Speed** | เร็วกว่า | ช้ากว่า |
| **Editor** | Text editor | Web UI |
| **Simulator** | ghdl | ghdl/ModelSim/others |
| **Storage** | Local disk | Cloud |
| **Share** | ต้อง zip | URL direct |
| **Offline** | ใช้ได้ | ต้อง internet |
| **Learning** | ดี | ดีกว่า (interactive) |

---

## Recommendations

### ✅ ใช้ EDA Playground เมื่อ:

1. เรียนรู้ VHDL/Verilog
2. ทดสอบโค้ดเล็กๆ
3. ต้องการแชร์โค้ด
4. ไม่อยาก setup local tools
5. ใช้ได้จาก Chromebook

### ✅ ใช้ Local Setup (ghdl) เมื่อ:

1. โปรเจ็กต์ใหญ่ซับซ้อน
2. ต้องการ speed
3. ทำงาน offline
4. ต้องอัดท้อง version control (git)
5. ใช้ advanced debugging

---

## References

- **Official Website:** https://www.edaplayground.com/
- **Documentation:** https://www.edaplayground.com/doc/
- **GHDL Manual:** https://ghdl.readthedocs.io/
- **VHDL Syntax:** IEEE 1076

---

## สรุป

**EDA Playground** เป็นเครื่องมือที่ยอดเยี่ยมสำหรับการเรียนรู้และทดสอบ VHDL/Verilog อย่างรวดเร็ว

### ข้อที่ต้องจำ:

1. ✓ เข้าที่ edaplayground.com
2. ✓ Create new project
3. ✓ เลือก GHDL (สำหรับ VHDL)
4. ✓ เขียนโค้ด + Testbench
5. ✓ Run simulation
6. ✓ ดู Output + Waveform
7. ✓ Export VCD หรือ Share URL

---

**สร้างเมื่อ:** 10 July 2026  
**ประเภท:** EDA Playground Tutorial  
**ระดับ:** Beginner to Intermediate  
**สำหรับ:** CE-200 Digital Systems  
**สถานะ:** เสร็จสิ้น ✓
