# ระบบดิจิทัล Logic Gates และ Truth Tables

## 1. ระบบดิจิทัล (Digital Systems)

### 1.1 ความหมาย
ระบบดิจิทัลคือระบบที่ใช้สัญญาณในลักษณะดิจิทัล (เลขฐานสอง) ซึ่งมีเพียง 2 สถานะ:
- **0** = LOW (ไม่มีแรงดัน/False)
- **1** = HIGH (มีแรงดัน/True)

### 1.2 ข้อดี
- ความแม่นยำสูง
- ป้องกันสัญญาณรบกวน
- สามารถเก็บและประมวลผลข้อมูลได้ง่าย
- ราคาถูก

### 1.3 Bit และ Byte
- **Bit** = หน่วยพื้นฐาน (0 หรือ 1)
- **Byte** = 8 bits

---

## 2. Boolean Algebra (พีชคณิตบูลีน)

### 2.1 ตัวดำเนินการพื้นฐาน

| ตัวดำเนินการ | สัญลักษณ์ | ความหมาย |
|--|--|--|
| AND | · หรือ ∧ | A AND B (ต้องเป็น 1 ทั้งสองตัว) |
| OR | + หรือ ∨ | A OR B (อย่างน้อยตัวใดตัวหนึ่งเป็น 1) |
| NOT | ¯ หรือ ¬ | NOT A (สลับค่า) |

### 2.2 กฎพื้นฐาน
```
A + 0 = A              (OR กับ 0 = ตัวเอง)
A + 1 = 1              (OR กับ 1 = 1)
A · 0 = 0              (AND กับ 0 = 0)
A · 1 = A              (AND กับ 1 = ตัวเอง)
A + A = A              (OR ตัวเอง = ตัวเอง)
A · A = A              (AND ตัวเอง = ตัวเอง)
A + ¯A = 1             (OR ตรงข้าม = 1)
A · ¯A = 0             (AND ตรงข้าม = 0)
¯¯A = A                (NOT NOT = ตัวเอง)
```

---

## 3. Logic Gates (ลอจิเกท)

ลอจิเกทเป็นวงจรดิจิทัลพื้นฐานที่รับอินพุต และส่งออก (output) ตามกฎที่กำหนด

### 3.1 AND Gate (ลอจิเกท และ)

**สัญลักษณ์:**
```
    ┌─────┐
A ──┤     │
    │ AND ├── Y
B ──┤     │
    └─────┘
```

**คุณสมบัติ:** ให้ output 1 ก็ต่อเมื่อ **ทั้ง A และ B เป็น 1**

**Truth Table:**
```
A | B | Y
--|---|--
0 | 0 | 0
0 | 1 | 0
1 | 0 | 0
1 | 1 | 1
```

---

### 3.2 OR Gate (ลอจิเกท หรือ)

**สัญลักษณ์:**
```
    ┌──────┐
A ──┤      │
    │  OR  ├── Y
B ──┤      │
    └──────┘
```

**คุณสมบัติ:** ให้ output 1 ถ้า **A หรือ B หรือทั้งสองเป็น 1**

**Truth Table:**
```
A | B | Y
--|---|--
0 | 0 | 0
0 | 1 | 1
1 | 0 | 1
1 | 1 | 1
```

---

### 3.3 NOT Gate (ลอจิเกท นเงชั่น)

**สัญลักษณ์:**
```
    ┌─────┐
A ──┤ NOT ├── Y
    └─────┘
```

**คุณสมบัติ:** **กลับค่า** (0 → 1, 1 → 0)

**Truth Table:**
```
A | Y
--|--
0 | 1
1 | 0
```

---

### 3.4 NAND Gate (NOT AND)

**สัญลักษณ์:**
```
    ┌──────┐
A ──┤      │
    │ NAND ├── Y
B ──┤      │
    └──────┘
```

**คุณสมบัติ:** **ตรงข้ามของ AND** (ให้ 0 ก็ต่อเมื่อทั้ง A และ B เป็น 1)

**Truth Table:**
```
A | B | Y
--|---|--
0 | 0 | 1
0 | 1 | 1
1 | 0 | 1
1 | 1 | 0
```

**สมการ:** Y = (A · B)' = ¯(A · B)

---

### 3.5 NOR Gate (NOT OR)

**สัญลักษณ์:**
```
    ┌─────┐
A ──┤     │
    │ NOR ├── Y
B ──┤     │
    └─────┘
```

**คุณสมบัติ:** **ตรงข้ามของ OR** (ให้ 1 ก็ต่อเมื่อทั้ง A และ B เป็น 0)

**Truth Table:**
```
A | B | Y
--|---|--
0 | 0 | 1
0 | 1 | 0
1 | 0 | 0
1 | 1 | 0
```

**สมการ:** Y = (A + B)' = ¯(A + B)

---

### 3.6 XOR Gate (Exclusive OR)

**สัญลักษณ์:**
```
    ┌─────┐
A ──┤     │
    │ XOR ├── Y
B ──┤     │
    └─────┘
```

**คุณสมบัติ:** ให้ output 1 ถ้า **A และ B ต่างกัน**

**Truth Table:**
```
A | B | Y
--|---|--
0 | 0 | 0
0 | 1 | 1
1 | 0 | 1
1 | 1 | 0
```

**สมการ:** Y = A ⊕ B = A·¯B + ¯A·B

---

### 3.7 XNOR Gate (Exclusive NOR)

**สัญลักษณ์:**
```
    ┌──────┐
A ──┤      │
    │ XNOR ├── Y
B ──┤      │
    └──────┘
```

**คุณสมบัติ:** **ตรงข้ามของ XOR** (ให้ 1 ถ้า A และ B **เหมือนกัน**)

**Truth Table:**
```
A | B | Y
--|---|--
0 | 0 | 1
0 | 1 | 0
1 | 0 | 0
1 | 1 | 1
```

**สมการ:** Y = (A ⊕ B)' = A·B + ¯A·¯B

---

## 4. ตารางความจริง (Truth Tables)

### 4.1 ความหมาย
ตารางความจริงคือตารางที่แสดงผลลัพธ์ของวงจรลอจิเกทสำหรับชุดอินพุตทั้งหมด

### 4.2 วิธีสร้าง Truth Table

**ขั้นตอน:**
1. นับจำนวนอินพุต = n
2. จำนวนแถว = 2^n
3. เขียน 0 และ 1 ทั้งหมดในตารางอินพุต
4. คำนวณเอาต์พุตสำหรับแต่ละชุดอินพุต

**ตัวอย่าง:** 2 อินพุต → 2^2 = 4 แถว

### 4.3 ตัวอย่าง: Truth Table สำหรับวงจร Y = A·B + C

| A | B | C | A·B | A·B+C |
|---|---|---|-----|-------|
| 0 | 0 | 0 |  0  |   0   |
| 0 | 0 | 1 |  0  |   1   |
| 0 | 1 | 0 |  0  |   0   |
| 0 | 1 | 1 |  0  |   1   |
| 1 | 0 | 0 |  0  |   0   |
| 1 | 0 | 1 |  0  |   1   |
| 1 | 1 | 0 |  1  |   1   |
| 1 | 1 | 1 |  1  |   1   |

---

## 5. ตัวอย่างการประยุกต์ใช้

### 5.1 Half Adder (เครื่องบวกครึ่งหนึ่ง)
ใช้ XOR สำหรับ Sum และ AND สำหรับ Carry

| A | B | Sum | Carry |
|---|---|-----|-------|
| 0 | 0 |  0  |   0   |
| 0 | 1 |  1  |   0   |
| 1 | 0 |  1  |   0   |
| 1 | 1 |  0  |   1   |

### 5.2 Full Adder (เครื่องบวกเต็ม)
ใช้ 2 Half Adder และ OR gate

| Cin | A | B | Sum | Cout |
|-----|---|---|-----|------|
|  0  | 0 | 0 |  0  |  0   |
|  0  | 0 | 1 |  1  |  0   |
|  0  | 1 | 0 |  1  |  0   |
|  0  | 1 | 1 |  0  |  1   |
|  1  | 0 | 0 |  1  |  0   |
|  1  | 0 | 1 |  0  |  1   |
|  1  | 1 | 0 |  0  |  1   |
|  1  | 1 | 1 |  1  |  1   |

---

## 6. De Morgan's Law (กฎของเดอมอร์แกน)

สำคัญมากในการลดรูปสมการบูลีน:

```
(A · B)' = A' + B'
(A + B)' = A' · B'
```

**ตัวอย่าง:**
- (A AND B) NOT = (NOT A) OR (NOT B)
- (A OR B) NOT = (NOT A) AND (NOT B)

---

## 7. สรุปลอจิเกททั้งหมด

| Gate | Output = 1 เมื่อ | สมการ |
|------|--|--|
| AND | ทั้ง A และ B = 1 | Y = A·B |
| OR | A หรือ B = 1 | Y = A+B |
| NOT | A = 0 | Y = ¯A |
| NAND | ไม่ใช่ (A AND B) | Y = (A·B)' |
| NOR | ไม่ใช่ (A OR B) | Y = (A+B)' |
| XOR | A ≠ B | Y = A⊕B |
| XNOR | A = B | Y = (A⊕B)' |

---

## 8. ข้อเสนอแนะในการเรียน

1. **ท่องจำ Truth Table** - เรียนรู้แต่ละเกตให้หมดใจ
2. **วาดวงจร** - ลองวาดสัญลักษณ์ของแต่ละเกต
3. **ลดรูปสมการ** - ใช้ Boolean Algebra ลดรูปวงจร
4. **ฝึกปัญหา** - ทำแบบฝึกหัด Truth Table ต่างๆ
5. **VHDL Implementation** - นำความรู้ไปเขียนโค้ด VHDL

---

## 9. คำศัพท์สำคัญ

| คำศัพท์ | ความหมาย |
|--|--|
| Input | ข้อมูลเข้า (A, B, C...) |
| Output | ผลลัพธ์ (Y) |
| Truth Table | ตารางแสดงค่าทั้งหมด |
| Logic Level | ระดับสัญญาณ (0 หรือ 1) |
| Combinational | วงจรที่เอาต์พุตขึ้นอยู่เฉพาะอินพุต |
| Sequential | วงจรที่เอาต์พุตขึ้นอยู่กับประวัติ |

---

## 10. VHDL Implementation (การเขียนลอจิเกทใน VHDL)

### 10.1 AND Gate ใน VHDL

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end AND_Gate;

architecture Behavioral of AND_Gate is
begin
    Y <= A and B;
end Behavioral;
```

### 10.2 OR Gate ใน VHDL

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end OR_Gate;

architecture Behavioral of OR_Gate is
begin
    Y <= A or B;
end Behavioral;
```

### 10.3 NOT Gate ใน VHDL

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_Gate is
    Port (
        A : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end NOT_Gate;

architecture Behavioral of NOT_Gate is
begin
    Y <= not A;
end Behavioral;
```

### 10.4 XOR Gate ใน VHDL

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_Gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end XOR_Gate;

architecture Behavioral of XOR_Gate is
begin
    Y <= A xor B;
end Behavioral;
```

### 10.5 Combinational Circuit ใน VHDL: Y = A·B + C

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Combo_Logic is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        C : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end Combo_Logic;

architecture Behavioral of Combo_Logic is
begin
    Y <= (A and B) or C;
end Behavioral;
```

### 10.6 Half Adder ใน VHDL

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Sum : out STD_LOGIC;
        Carry : out STD_LOGIC
    );
end Half_Adder;

architecture Behavioral of Half_Adder is
begin
    Sum <= A xor B;
    Carry <= A and B;
end Behavioral;
```

### 10.7 Full Adder ใน VHDL

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        Sum : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end Full_Adder;

architecture Behavioral of Full_Adder is
begin
    Sum <= A xor B xor Cin;
    Cout <= (A and B) or (Cin and (A xor B));
end Behavioral;
```

### 10.8 Multiple-bit AND ใน VHDL

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multi_Bit_AND is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Multi_Bit_AND;

architecture Behavioral of Multi_Bit_AND is
begin
    Y <= A and B;  -- ทำการ AND แบบ bit-wise
end Behavioral;
```

---

## 11. การสร้าง Truth Table จากวงจรจริง

### 11.1 ตัวอย่างที่ 1: Y = A·B + ¯A·C

**ขั้นตอนที่ 1:** สร้างตารางอินพุต
```
A | B | C
--|---|--
0 | 0 | 0
0 | 0 | 1
0 | 1 | 0
0 | 1 | 1
1 | 0 | 0
1 | 0 | 1
1 | 1 | 0
1 | 1 | 1
```

**ขั้นตอนที่ 2:** คำนวณ ¯A
```
A | ¯A
--|--
0 | 1
0 | 1
0 | 1
0 | 1
1 | 0
1 | 0
1 | 0
1 | 0
```

**ขั้นตอนที่ 3:** คำนวณ A·B
```
A | B | A·B
--|---|----
0 | 0 | 0
0 | 0 | 0
0 | 1 | 0
0 | 1 | 0
1 | 0 | 0
1 | 0 | 0
1 | 1 | 1
1 | 1 | 1
```

**ขั้นตอนที่ 4:** คำนวณ ¯A·C
```
¯A | C | ¯A·C
---|---|-----
1  | 0 | 0
1  | 1 | 1
1  | 0 | 0
1  | 1 | 1
0  | 0 | 0
0  | 1 | 0
0  | 0 | 0
0  | 1 | 0
```

**ขั้นตอนที่ 5:** คำนวณ Y = A·B + ¯A·C
```
A | B | C | A·B | ¯A·C | Y
--|---|---|-----|------|---
0 | 0 | 0 |  0  |  0   | 0
0 | 0 | 1 |  0  |  1   | 1
0 | 1 | 0 |  0  |  0   | 0
0 | 1 | 1 |  0  |  1   | 1
1 | 0 | 0 |  0  |  0   | 0
1 | 0 | 1 |  0  |  0   | 0
1 | 1 | 0 |  1  |  0   | 1
1 | 1 | 1 |  1  |  0   | 1
```

### 11.2 ตัวอย่างที่ 2: Y = (A + B)·¯C

```
A | B | C | A+B | ¯C | (A+B)·¯C
--|---|---|-----|----|---------
0 | 0 | 0 |  0  | 1  |    0
0 | 0 | 1 |  0  | 0  |    0
0 | 1 | 0 |  1  | 1  |    1
0 | 1 | 1 |  1  | 0  |    0
1 | 0 | 0 |  1  | 1  |    1
1 | 0 | 1 |  1  | 0  |    0
1 | 1 | 0 |  1  | 1  |    1
1 | 1 | 1 |  1  | 0  |    0
```

---

## 12. การแปลง Truth Table เป็นสมการ (Minterm และ Maxterm)

### 12.1 Minterm (Sum of Products - SOP)

คือผลรวมของพจน์ AND ที่ให้ output = 1

**ตัวอย่าง:** Truth Table
```
A | B | Y
--|---|--
0 | 0 | 0
0 | 1 | 1  ← Minterm: ¯A·B
1 | 0 | 1  ← Minterm: A·¯B
1 | 1 | 0
```

**สมการ Minterm:** Y = ¯A·B + A·¯B = Y(1,2)

### 12.2 Maxterm (Product of Sums - POS)

คือผลคูณของพจน์ OR ที่ให้ output = 0

**สมการ Maxterm:** Y = (A+B)·(¯A+¯B) = Y(0,3)

---

## 13. Karnaugh Map (K-map) - การลดรูปสมการ

### 13.1 K-map 2 ตัวแปร

```
    B
    0  1
A 0 [ ][ ]
  1 [ ][ ]
```

### 13.2 ตัวอย่าง K-map

**Truth Table:**
```
A | B | Y
--|---|--
0 | 0 | 1
0 | 1 | 1
1 | 0 | 0
1 | 1 | 0
```

**K-map:**
```
    B
    0  1
A 0 [1][1]
  1 [0][0]
```

**ผลลัพธ์:** Y = ¯A (ลดรูปจาก ¯A·¯B + ¯A·B = ¯A)

### 13.3 K-map 3 ตัวแปร

```
      BC
      00 01 11 10
A 0  [ ][ ][ ][ ]
  1  [ ][ ][ ][ ]
```

---

## 14. วงจรลายรวม (Integrated Circuits - ICs)

### 14.1 IC ทั่วไป

| IC Number | ชื่อ | ประกอบด้วย | Pins |
|-----------|------|---------|-------|
| 7408 | Quad 2-input AND | 4 AND gates | 14 |
| 7432 | Quad 2-input OR | 4 OR gates | 14 |
| 7404 | Hex Inverter | 6 NOT gates | 14 |
| 7486 | Quad 2-input XOR | 4 XOR gates | 14 |
| 7400 | Quad 2-input NAND | 4 NAND gates | 14 |

---

## 15. ปัญหาฝึกหัด

### 15.1 สร้าง Truth Table

**ปัญหา 1:** Y = A·B + B·C

| A | B | C | Y |
|---|---|---|---|
| 0 | 0 | 0 | ? |
| 0 | 0 | 1 | ? |
| 0 | 1 | 0 | ? |
| 0 | 1 | 1 | ? |
| 1 | 0 | 0 | ? |
| 1 | 0 | 1 | ? |
| 1 | 1 | 0 | ? |
| 1 | 1 | 1 | ? |

**คำตอบ:** 
```
A | B | C | Y
--|---|---|--
0 | 0 | 0 | 0
0 | 0 | 1 | 0
0 | 1 | 0 | 0
0 | 1 | 1 | 1
1 | 0 | 0 | 0
1 | 0 | 1 | 0
1 | 1 | 0 | 1
1 | 1 | 1 | 1
```

### 15.2 ลดรูปสมการ

**ปัญหา 2:** Y = A·B + A·¯B

**วิธีแก้:** 
- Y = A·B + A·¯B
- Y = A·(B + ¯B)  [Factoring]
- Y = A·1  [B + ¯B = 1]
- Y = A

### 15.3 ระบุประเภทเกต

**ปัญหา 3:** วงจรที่มี output = 1 เมื่อทั้ง input เป็น 0 เท่านั้น คือเกตประเภทไหน?

**คำตอบ:** NOR Gate

---

## 16. วัสดุอ้างอิง

### 16.1 สัญลักษณ์สำคัญ

| สัญลักษณ์ | ความหมาย |
|--|--|
| · หรือ ∧ | AND |
| + หรือ ∨ | OR |
| ¯ หรือ ' | NOT (complement) |
| ⊕ | XOR |
| ⊙ | XNOR |
| 0 | False / LOW |
| 1 | True / HIGH |

### 16.2 Links และทรัพยากร

- **Boolean Algebra Laws** - ศึกษากฎของบูลีน
- **Timing Diagrams** - เข้าใจการทำงานตรงเวลา
- **VHDL Simulation** - ทดสอบโค้ด VHDL
- **Digital Design Tools** - Quartus, Vivado, ModelSim

---

## 17. Testbench ตัวอย่าง (VHDL)

### 17.1 Testbench สำหรับ AND Gate

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_Gate_TB is
end AND_Gate_TB;

architecture Test of AND_Gate_TB is
    signal A, B, Y : STD_LOGIC;
    
    component AND_Gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
    
begin
    UUT: AND_Gate port map (A => A, B => B, Y => Y);
    
    process
    begin
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;
        wait;
    end process;
    
end Test;
```

---

## 18. เคล็ดลับการแก้ปัญหา

1. **เขียน Truth Table ก่อน** - มองเห็นรูปแบบของปัญหา
2. **ใช้ Boolean Algebra** - ลดรูปให้ง่ายสุด
3. **ทดสอบทุกกรณี** - ตรวจสอบคำตอบด้วย Truth Table
4. **วาดวงจร** - ช่วยให้เข้าใจง่ายขึ้น
5. **ใช้ Karnaugh Map** - สำหรับลดรูปอย่างมีประสิทธิภาพ
6. **ทำการ Simulation** - ตรวจสอบ VHDL code ด้วย ModelSim/Vivado

---

**สร้างเมื่อ:** 10 July 2026  
**ปรับปรุงครั้งล่าสุด:** 10 July 2026  
**สำหรับการเรียน:** CE-200 Digital Systems / VHDL
