# Structural Design: 16:1 Multiplexer และ 1:16 Demultiplexer

---

## 📚 บทนำ

**Structural Design** คือการออกแบบวงจรโดยใช้การต่อวงจรพื้นฐาน (AND, OR, NOT gates) แทนการใช้ Behavioral Design (CASE statement)

ไฟล์ที่สร้างขึ้น:
- `mux_16to1_structural.vhdl` - ใช้ 16 AND gates + 1 OR gate + NOT gates
- `demux_1to16_structural.vhdl` - ใช้ 16 AND gates + NOT gates
- `testbench_structural.vhdl` - Testbench ที่มี 9 test cases

---

## 🔧 หลักการออกแบบ

### 16:1 Multiplexer (Structural)

**บล็อกไดอะแกรม:**

```
                ┌─────────────┐
D0 ──────────┤ AND (5-input) ├──┐
S3'──S2'──S1'──S0' │             │
                └─────────────┘  │
                                 │
                ┌─────────────┐  │
D1 ──────────┤ AND (5-input) ├──┤
S3'──S2'──S1'──S0  │             │
                └─────────────┘  │
                                 │
      ...                         ├─→ [OR 16-input] ──→ Y
                                 │
                ┌─────────────┐  │
D15 ─────────┤ AND (5-input) ├──┘
S3──S2──S1──S0 │
                └─────────────┘
```

**วิธีการทำงาน:**

1. **Decoder Logic:** สร้างจาก select lines (S3:S0) และ NOT ของมัน
2. **AND Gates:** แต่ละ AND gate จะสร้าง "enable" สำหรับหนึ่ง input
   - AND gate i รับ: D(i) AND (ระบุ S3:S0 ตามสมการ)
3. **OR Gate:** รวมทั้งหมด AND outputs
   - ผลลัพธ์: Y = (D0 AND condition0) OR (D1 AND condition1) OR ... OR (D15 AND condition15)

**ตัวอย่างสำหรับ D0:**
```
Y0 = D0 AND S3' AND S2' AND S1' AND S0'
```
กล่าวคือ D0 จะออกมาทาง Y ก็ต่อเมื่อ Select = 0000

**ตัวอย่างสำหรับ D5:**
```
Y5 = D5 AND S3' AND S2 AND S1' AND S0
```
กล่าวคือ D5 จะออกมาทาง Y ก็ต่อเมื่อ Select = 0101

---

### 1:16 Demultiplexer (Structural)

**บล็อกไดอะแกรม:**

```
D ────┬──────────────────────────────────────────────
      │
      ├─→ [AND 5-input] ──→ Y0
      │    S3'──S2'──S1'──S0'
      │
      ├─→ [AND 5-input] ──→ Y1
      │    S3'──S2'──S1'──S0
      │
      ├─→ [AND 5-input] ──→ Y2
      │    S3'──S2'──S1──S0'
      │
      ...
      │
      └─→ [AND 5-input] ──→ Y15
           S3──S2──S1──S0
```

**วิธีการทำงาน:**

1. Input D ถูกส่งไปยังทุก AND gates
2. แต่ละ AND gate i จะมี decoder logic (S3:S0 ตามสมการ)
3. เมื่อ select = i จะเปิด AND gate i ให้ D ผ่านออกมาทาง Y(i)
4. Output ที่ไม่เลือก = 0 (เพราะ AND condition ไม่สำเร็จ)

**ตัวอย่างสำหรับ Y0:**
```
Y0 = D AND S3' AND S2' AND S1' AND S0'
```
Y0 จะได้ค่า D ก็ต่อเมื่อ Select = 0000, ถ้าไม่ Y0 = 0

---

## 📝 โค้ด VHDL - Structural Design

### mux_16to1_structural.vhdl

```vhdl
-- NOT gates สำหรับ select lines
S_not(0) <= not S(0);
S_not(1) <= not S(1);
S_not(2) <= not S(2);
S_not(3) <= not S(3);

-- AND gate สำหรับ D0: D0 AND S3' AND S2' AND S1' AND S0'
and_out(0) <= D(0) and S_not(3) and S_not(2) and S_not(1) and S_not(0);

-- AND gate สำหรับ D1: D1 AND S3' AND S2' AND S1' AND S0
and_out(1) <= D(1) and S_not(3) and S_not(2) and S_not(1) and S(0);

-- ... (รวม 16 AND gates)

-- OR gate: Y = and_out(0) OR and_out(1) OR ... OR and_out(15)
Y <= and_out(0) or and_out(1) or ... or and_out(15);
```

**สัญลักษณ์:**
- `and` = AND gate
- `or` = OR gate
- `not` = NOT gate
- `S_not(i)` = S(i) หลังผ่าน NOT gate
- `S(i)` = select line i

### demux_1to16_structural.vhdl

```vhdl
-- NOT gates สำหรับ select lines
S_not(0) <= not S(0);
S_not(1) <= not S(1);
S_not(2) <= not S(2);
S_not(3) <= not S(3);

-- AND gate สำหรับ Y0: D AND S3' AND S2' AND S1' AND S0'
Y(0) <= D and S_not(3) and S_not(2) and S_not(1) and S_not(0);

-- AND gate สำหรับ Y1: D AND S3' AND S2' AND S1' AND S0
Y(1) <= D and S_not(3) and S_not(2) and S_not(1) and S(0);

-- ... (รวม 16 AND gates)
```

---

## 🧮 ตารางจับคู่ Select กับ AND Condition

| Select | Binary | Y0 | Y1 | Y2 | Y3 | Y4 | Y5 | Y6 | Y7 | Y8 | Y9 | Y10 | Y11 | Y12 | Y13 | Y14 | Y15 |
|--------|--------|----|----|----|----|----|----|----|----|----|----|-----|-----|-----|-----|-----|-----|
| 0 | 0000 | ✓ | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
| 1 | 0001 | - | ✓ | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
| 2 | 0010 | - | - | ✓ | - | - | - | - | - | - | - | - | - | - | - | - | - |
| 3 | 0011 | - | - | - | ✓ | - | - | - | - | - | - | - | - | - | - | - | - |
| 4 | 0100 | - | - | - | - | ✓ | - | - | - | - | - | - | - | - | - | - | - |
| 5 | 0101 | - | - | - | - | - | ✓ | - | - | - | - | - | - | - | - | - | - |
| ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... |
| 15 | 1111 | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | ✓ |

---

## 🧪 ผลการทดลอง

```
Test Results from Structural Design Simulation:

✓ Test 1: Select = 0000 (D0='1')     → MUX Output='1', Y0='1'
✓ Test 2: Select = 0001 (D1='0')     → MUX Output='0', Y1='0'
✓ Test 3: Select = 0101 (D5='0')     → MUX Output='0', Y5='0'
✓ Test 4: Select = 1010 (D10='1')    → MUX Output='1', Y10='1'
✓ Test 5: Select = 1111 (D15='0')    → MUX Output='0', Y15='0'
✓ Test 6: Data Changed to 0xF0F0     → MUX Output='1', Y7='1'
✓ Test 7: Independent Select         → MUX Output='1', Y3='1'
✓ Test 8: All Ones Input (0xFFFF)    → MUX Output='1', Y2='1'
✓ Test 9: All 16 Select Combinations → All outputs verified
```

**สรุป:** ✓ ทั้งหมด 9 tests ผ่านสำเร็จ

---

## 🔍 การเปรียบเทียบ Behavioral vs Structural

| ลักษณะ | Behavioral (CASE) | Structural (AND/OR/NOT) |
|--------|-------------------|------------------------|
| **ความเข้าใจ** | ง่ายอ่าน เข้าใจการทำงาน | มองเห็นวงจรจริง |
| **ความเร็ว** | ขึ้นอยู่ตัว synthesizer | ชัดเจนอยู่แล้ว |
| **บรรทัดโค้ด** | 50+ บรรทัด | 70+ บรรทัด (ที่แสดงให้เห็น) |
| **Scalability** | ง่าย (modify CASE) | ยุ่ง (เพิ่ม AND gates) |
| **ใช้สำหรับ** | Logic ที่ซับซ้อน | Prototyping, หลักการเรียนรู้ |
| **HDL ใดใช้** | VHDL, Verilog | VHDL, Verilog |
| **Synthesis** | อาจ optimize | ต้องระบุชัดเจน |

---

## 💡 จะเลือกแบบไหนดี?

### ใช้ Behavioral (CASE statement)
- ✓ ต้องการโค้ดแบบ readable และ maintainable
- ✓ ตัวเลข input/output มากมาย (decoder 3:8, 4:16, ...)
- ✓ ต้องการความเร็วในการเขียนโค้ด

### ใช้ Structural (AND/OR/NOT)
- ✓ ต้องการเข้าใจวงจรจริง
- ✓ ต้องการ direct control ต่อ logic gates
- ✓ ใช้สำหรับการสอน (demonstrating gate-level design)
- ✓ ต้องการที่ synthesizer optimize จาก gate-level

---

## 🚀 วิธีรัน

### Compile & Simulate

```bash
# ใช้ Makefile structural
make -f Makefile.structural simulate

# หรือรันคำสั่งแยก
mkdir -p work_structural
ghdl -i -fsynopsys --workdir=work_structural \
    mux_16to1_structural.vhdl \
    demux_1to16_structural.vhdl \
    testbench_structural.vhdl

ghdl -m -fsynopsys --workdir=work_structural Lab1_TB_Structural

ghdl -r --workdir=work_structural Lab1_TB_Structural \
    --vcd=lab1_structural_simulation.vcd
```

### เปิด GTKWave

```bash
make -f Makefile.structural wave

# หรือรันตรง
gtkwave lab1_structural_simulation.vcd &
```

---

## 📊 รายละเอียด Simulation Output

**VCD File:** `lab1_structural_simulation.vcd`

สัญญาณที่บันทึก:
- `input_data[15:0]` - ข้อมูล input 16 bit
- `select_mux[3:0]` - select lines ของ MUX
- `mux_output` - output ของ MUX
- `select_demux[3:0]` - select lines ของ DEMUX
- `demux_output[15:0]` - output ของ DEMUX

---

## 🎓 สิ่งที่เรียนรู้ได้

1. **Gate-level Design** - ออกแบบจากพื้นฐานของ AND, OR, NOT gates
2. **Decoder Logic** - เข้าใจการทำงานของ decoder
3. **Multiplexing Principle** - ว่ามี input หลายเส้น output 1 เส้น
4. **De-multiplexing Principle** - ว่ามี input 1 เส้น output หลายเส้น
5. **Structural VHDL** - เขียน VHDL แบบ structural อย่างถูกต้อง
6. **AND/OR/NOT Combinations** - ทำความเข้าใจการนำ gates มารวมกัน

---

## 📚 ส่วนเพิ่มเติมที่ควรศึกษา

1. **Multiplexer 4:1, 8:1** - ลองทำเองแบบ structural
2. **Encoder** - inverse ของ decoder
3. **Comparator** - ใช้ gates สร้างวงจรเปรียบเทียบ
4. **Adder** - ใช้ gates สร้างวงจรบวก

---

**สร้างเมื่อ:** 10 July 2026  
**ประเภท:** Structural Design Tutorial  
**สำหรับ:** CE-200 Digital Systems  
**สถานะ:** เสร็จสิ้น ✓
