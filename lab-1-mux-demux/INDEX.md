# 📚 Lab-1 Project - Complete Index

**Project:** CE-200 Digital Systems  
**Lab:** Lab-1 - Multiplexer (16:1) and Demultiplexer (1:16)  
**Date Created:** 10 July 2026  
**Status:** ✅ Complete

---

## 📖 Documentation Files (2,353 บรรทัด)

### 1. **README.md** (543 บรรทัด) - START HERE! ⭐
   - Quick start guide
   - Installation (macOS, Linux, Windows)
   - How to run simulation locally
   - How to open GTKWave
   - Makefile commands
   - Troubleshooting (7 common issues)
   - **When to use:** First time setup

### 2. **Lab_Report.md** (398 บรรทัด) - FULL LAB REPORT
   - Objective (5 points)
   - Theory (MUX/DEMUX explanation)
   - Circuit design details
   - Simulation results (7 tests)
   - VCD analysis
   - Answers to 3 questions
   - Conclusions
   - **When to use:** Submission/Reference

### 3. **STRUCTURAL_DESIGN.md** (282 บรรทัด) - ADVANCED LEARNING
   - What is Structural Design
   - Using AND/OR/NOT gates only
   - 16 AND gates + 1 OR gate design
   - VHDL structural code examples
   - Truth table for all 16 inputs
   - Comparison: Behavioral vs Structural
   - Learning objectives
   - **When to use:** Understanding gate-level design

### 4. **EDA_PLAYGROUND_GUIDE.md** (730 บรรทัด) - ONLINE TOOL TUTORIAL
   - What is EDA Playground
   - Pros/Cons vs local setup
   - Installation (if needed)
   - Main screen layout
   - Step-by-step project creation
   - How to write VHDL code
   - How to run simulation
   - Waveform viewer tutorial
   - MUX example code
   - DEMUX example code
   - Advanced features (multiple files, version history, export)
   - Tips & tricks
   - **When to use:** Learning online VHDL simulation

### 5. **EDA_PLAYGROUND_SETUP.md** (370 บรรทัด) - QUICK SETUP FOR EDA PLAYGROUND ✨ NEW
   - Two options: All-in-One vs Multiple Files
   - Step-by-step for each option
   - Code structure explanation
   - 7 test cases detailed breakdown
   - Expected output console
   - Waveform signals to watch
   - Simulator settings
   - Error troubleshooting
   - Save & Share instructions
   - Quick reference tables
   - **When to use:** Setting up project on EDA Playground

---

## 💻 VHDL Code Files (1,038 บรรทัด)

### A. BEHAVIORAL DESIGN (Local - GHDL)

#### 1. **mux_16to1.vhdl** (38 บรรทัด)
   - 16:1 Multiplexer
   - Using CASE statement
   - 16 inputs, 4 select, 1 output
   - Entity + Architecture
   - **Run with:** `make simulate`

#### 2. **demux_1to16.vhdl** (42 บรรทัด)
   - 1:16 Demultiplexer
   - Using CASE statement
   - 1 input, 4 select, 16 outputs
   - Entity + Architecture
   - **Run with:** `make simulate`

#### 3. **testbench.vhdl** (132 บรรทัด)
   - Instantiates MUX + DEMUX
   - Connects MUX output → DEMUX input
   - 7 test cases
   - Reports for console output
   - **Run with:** `make simulate`

**Total Behavioral:** 212 บรรทัด  
**Status:** ✅ Tested - 7/7 tests pass  
**Output:** lab1_simulation.vcd

---

### B. STRUCTURAL DESIGN (Gate-Level)

#### 1. **mux_16to1_structural.vhdl** (81 บรรทัด)
   - 16:1 MUX using gates
   - 16 AND gates (5-input each)
   - 1 OR gate (16-input)
   - 4 NOT gates
   - Shows actual hardware structure
   - **Run with:** `make -f Makefile.structural simulate`

#### 2. **demux_1to16_structural.vhdl** (74 บรรทัด)
   - 1:16 DEMUX using gates
   - 16 AND gates (5-input each)
   - 4 NOT gates
   - Direct gate connections
   - **Run with:** `make -f Makefile.structural simulate`

#### 3. **testbench_structural.vhdl** (155 บรรทัด)
   - Testbench for structural design
   - 9 test cases (more than behavioral)
   - Added sweep test for all 16 combinations
   - Waveform compatible
   - **Run with:** `make -f Makefile.structural simulate`

**Total Structural:** 310 บรรทัด  
**Status:** ✅ Tested - 9/9 tests pass  
**Output:** lab1_structural_simulation.vcd

---

### C. EDA PLAYGROUND (Online)

#### 1. **eda_playground_lab1_all_in_one.vhdl** (226 บรรทัด) ⭐ RECOMMENDED
   - Single file containing MUX + DEMUX + Testbench
   - Copy & paste into EDA Playground
   - No setup needed
   - Instant simulation
   - 7 test cases
   - **Usage:** Copy → Paste → Run
   - **Status:** ✅ Ready to use

#### 2. **eda_mux_16to1.vhdl** (42 บรรทัด)
   - 16:1 Multiplexer
   - Standalone for EDA Playground
   - Use with File 2 + File 3
   - **Usage:** Create file in EDA, paste this code

#### 3. **eda_demux_1to16.vhdl** (46 บรรทัด)
   - 1:16 Demultiplexer
   - Standalone for EDA Playground
   - Use with File 1 + File 3
   - **Usage:** Create file in EDA, paste this code

#### 4. **eda_testbench_lab1.vhdl** (202 บรรทัด)
   - Testbench for EDA Playground
   - Instantiates both MUX & DEMUX
   - 7 comprehensive tests
   - Use with File 1 + File 2
   - **Usage:** Create file in EDA, paste this code

**Total EDA Playground:** 516 บรรทัด  
**Status:** ✅ Ready for online use

---

## 🛠️ Build & Simulation Files

### Makefiles

#### **Makefile** (39 บรรทัด)
   ```bash
   make all       # Compile and simulate (behavioral)
   make simulate  # Run simulation only
   make wave      # Run simulation and open GTKWave
   make clean     # Remove generated files
   ```
   - **Default:** Uses Behavioral design
   - **Simulator:** GHDL

#### **Makefile.structural** (39 บรรทัด)
   ```bash
   make -f Makefile.structural simulate
   make -f Makefile.structural wave
   make -f Makefile.structural clean
   ```
   - **For:** Structural design
   - **Output:** work_structural/ directory

### Generated Files

- **lab1_simulation.vcd** (1.4 KB)
  - Waveform file from behavioral simulation
  - Open with: `gtkwave lab1_simulation.vcd`

- **lab1_structural_simulation.vcd** (3.8 KB)
  - Waveform file from structural simulation
  - Open with: `gtkwave lab1_structural_simulation.vcd`

- **work/** & **work_structural/** directories
  - Compiled VHDL objects
  - Created by `make` command
  - Safe to delete with `make clean`

---

## 📊 Statistics Summary

| Category | Count | Lines |
|----------|-------|-------|
| Documentation | 5 files | 2,353 |
| VHDL Behavioral | 3 files | 212 |
| VHDL Structural | 3 files | 310 |
| VHDL EDA Playground | 4 files | 516 |
| **Total Code** | **10 files** | **1,038** |
| **TOTAL PROJECT** | **15 files** | **3,391** |

---

## 🎯 Test Coverage

### Behavioral Design
- ✅ Test 1: Basic MUX (Select = 0000)
- ✅ Test 2: Basic MUX (Select = 0001)
- ✅ Test 3: Basic MUX (Select = 0101)
- ✅ Test 4: Basic MUX (Select = 1010)
- ✅ Test 5: Basic MUX (Select = 1111)
- ✅ Test 6: Different input data (0xF0F0)
- ✅ Test 7: Independent select lines (KEY TEST)

**Result:** 7/7 tests ✅ PASS

### Structural Design
- ✅ Test 1-7: Same as behavioral
- ✅ Test 8: All ones input (0xFFFF)
- ✅ Test 9: Sweep all 16 combinations

**Result:** 9/9 tests ✅ PASS

---

## 🚀 Quick Start Guide

### Option 1: Local Setup (Recommended for Learning)
```bash
cd lab-1-mux-demux
make simulate    # Compile and run
make wave        # View waveforms
```

### Option 2: EDA Playground (No Installation)
```
1. Go to https://www.edaplayground.com/
2. Copy code from: eda_playground_lab1_all_in_one.vhdl
3. Paste into EDA Playground
4. Click "Run"
5. View output and waveforms
```

### Option 3: Structural Design (Gate-Level)
```bash
make -f Makefile.structural simulate
make -f Makefile.structural wave
```

---

## 📚 Learning Path

### Day 1: Basics
1. Read: **README.md** (Quick setup)
2. Run: `make simulate`
3. View: Waveforms with gtkwave

### Day 2: Deep Learning
1. Read: **Lab_Report.md** (Full explanation)
2. Study: Truth tables and test cases
3. Answer: Lab questions

### Day 3: Gate-Level Design
1. Read: **STRUCTURAL_DESIGN.md**
2. Run: `make -f Makefile.structural simulate`
3. Compare: Behavioral vs Structural outputs

### Day 4: Online Simulation
1. Read: **EDA_PLAYGROUND_SETUP.md**
2. Setup: Project on EDA Playground
3. Run: Online simulation
4. Share: URL with others

---

## ✅ Verification Checklist

- [x] 16:1 Multiplexer implemented
- [x] 1:16 Demultiplexer implemented
- [x] MUX + DEMUX connected
- [x] Independent select lines working
- [x] Behavioral design (7 tests pass)
- [x] Structural design (9 tests pass)
- [x] Local simulation with GHDL (✅ Pass)
- [x] EDA Playground code ready
- [x] VCD files generated
- [x] Documentation complete (5 guides)
- [x] Makefile working
- [x] All test cases documented

**Project Status:** ✅ COMPLETE & VERIFIED

---

## 📋 File Organization

```
lab-1-mux-demux/
│
├── 📚 Documentation (Start here!)
│   ├── INDEX.md ........................... (This file - Overview)
│   ├── README.md .......................... (Quick start)
│   ├── Lab_Report.md ...................... (Full report)
│   ├── STRUCTURAL_DESIGN.md ............... (Gate-level design)
│   ├── EDA_PLAYGROUND_GUIDE.md ............ (Online tool tutorial)
│   └── EDA_PLAYGROUND_SETUP.md ............ (EDA Playground setup)
│
├── 💻 Behavioral VHDL (Local)
│   ├── mux_16to1.vhdl ..................... (MUX entity)
│   ├── demux_1to16.vhdl ................... (DEMUX entity)
│   ├── testbench.vhdl ..................... (Testbench)
│   ├── Makefile ........................... (Build script)
│   └── lab1_simulation.vcd ................ (Waveform output)
│
├── 🔧 Structural VHDL (Gate-level)
│   ├── mux_16to1_structural.vhdl .......... (AND/OR gates)
│   ├── demux_1to16_structural.vhdl ........ (AND gates)
│   ├── testbench_structural.vhdl .......... (Testbench)
│   ├── Makefile.structural ............... (Build script)
│   └── lab1_structural_simulation.vcd .... (Waveform output)
│
├── 🌐 EDA Playground VHDL (Online)
│   ├── eda_playground_lab1_all_in_one.vhdl (All-in-one) ⭐
│   ├── eda_mux_16to1.vhdl ................ (MUX entity)
│   ├── eda_demux_1to16.vhdl .............. (DEMUX entity)
│   └── eda_testbench_lab1.vhdl ........... (Testbench)
│
└── 🛠️ Compiled Files (Auto-generated)
    ├── work/ ............................. (Behavioral artifacts)
    ├── work_structural/ .................. (Structural artifacts)
    ├── *.o files ......................... (Object files)
    └── lab1_tb, lab1_tb_structural ....... (Executables)
```

---

## 🎓 Learning Outcomes

After completing this project, you will understand:

1. ✅ **16:1 Multiplexer Design**
   - How to select 1 input from 16
   - Using CASE statements
   - Using gate-level logic (AND/OR/NOT)

2. ✅ **1:16 Demultiplexer Design**
   - How to route 1 input to 16 outputs
   - Decoder functionality
   - Both behavioral and structural approaches

3. ✅ **Component Instantiation**
   - Connecting MUX output to DEMUX input
   - Using independent select lines
   - Signal routing

4. ✅ **VHDL Coding**
   - Entity and Architecture
   - Process and CASE statements
   - Component instantiation
   - Port mapping

5. ✅ **Simulation & Testing**
   - Running GHDL simulations locally
   - Using online EDA Playground
   - Viewing waveforms with gtkwave
   - Interpreting simulation results

6. ✅ **Structural Design**
   - Gate-level implementation
   - Understanding decoder logic
   - AND/OR/NOT gate combinations

---

## 🔗 External Resources

| Resource | Link |
|----------|------|
| EDA Playground | https://www.edaplayground.com/ |
| GHDL Manual | https://ghdl.readthedocs.io/ |
| GTKWave | http://gtkwave.sourceforge.net/ |
| VHDL Tutorial | IEEE 1076 Standard |

---

## 📞 Support & Troubleshooting

### Common Issues

**GHDL not found:**
```bash
# macOS
brew install ghdl

# Ubuntu/Debian
sudo apt-get install ghdl
```

**Work directory error:**
```bash
mkdir work
make simulate
```

**GTKWave not available:**
```bash
# macOS
brew install gtkwave

# Or use EDA Playground online
```

**Port mismatch error:**
- Check signal names match between components
- Verify port types (in/out)
- Compare vector widths

### Where to Find Help

1. **README.md** - Common errors section
2. **EDA_PLAYGROUND_SETUP.md** - Troubleshooting table
3. **GHDL documentation** - https://ghdl.readthedocs.io/

---

## ✨ Highlights

- 🎯 **Complete Lab-1 Solution**
- 📚 **5 Comprehensive Documentation Files**
- 💻 **3 Implementation Approaches** (Behavioral, Structural, EDA)
- ✅ **16 Tests Total** (7 Behavioral + 9 Structural)
- 📊 **3,391 Lines of Code & Docs**
- 🚀 **Ready for EDA Playground**
- 🔧 **Works with GHDL, ModelSim, and more**

---

**Project Version:** 1.0  
**Last Updated:** 10 July 2026  
**Status:** ✅ Complete  
**Ready to Use:** Yes  

🎉 **Everything is set up and ready to go!**

---

## 📝 Next Steps

1. **Immediate:**
   - Read README.md
   - Run `make simulate`
   - View waveforms

2. **Learning:**
   - Study Lab_Report.md
   - Answer the 3 lab questions
   - Compare test results

3. **Exploration:**
   - Try Structural Design
   - Use EDA Playground online
   - Experiment with different inputs

4. **Advanced:**
   - Design 8:1 or 4:1 Multiplexer
   - Implement Priority Encoder
   - Study Synthesis and Timing

---

**Thank you for using this Lab-1 Project!**  
**Happy Learning! 🚀**
