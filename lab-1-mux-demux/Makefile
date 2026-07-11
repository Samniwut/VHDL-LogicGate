.PHONY: all clean simulate wave

WORKDIR = work
VHDL_FILES = mux_16to1.vhdl demux_1to16.vhdl testbench.vhdl
TOP_MODULE = Lab1_TB
VCD_FILE = lab1_simulation.vcd

all: simulate

simulate:
	@echo "======================================"
	@echo "VHDL Compilation and Simulation"
	@echo "======================================"
	mkdir -p $(WORKDIR)
	ghdl -i -fsynopsys --workdir=$(WORKDIR) $(VHDL_FILES)
	ghdl -m -fsynopsys --workdir=$(WORKDIR) $(TOP_MODULE)
	ghdl -r --workdir=$(WORKDIR) $(TOP_MODULE) --vcd=$(VCD_FILE)
	@echo ""
	@echo "Simulation completed. VCD file: $(VCD_FILE)"

wave: simulate
	@echo "======================================"
	@echo "Opening GTKWave"
	@echo "======================================"
	gtkwave $(VCD_FILE) &

clean:
	rm -rf $(WORKDIR)
	rm -f *.vcd
	rm -f $(TOP_MODULE)
	@echo "Cleanup completed"

help:
	@echo "Available targets:"
	@echo "  make all       - Compile and simulate"
	@echo "  make simulate  - Run simulation only"
	@echo "  make wave      - Run simulation and open GTKWave"
	@echo "  make clean     - Remove generated files"
	@echo "  make help      - Show this message"
