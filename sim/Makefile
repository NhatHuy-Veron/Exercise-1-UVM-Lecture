##########################################################
##        Makefile for UVM Simulation and Coverage      ##
##        Author: Nhat Huy Nguyen                       ##
##########################################################

# ---------------------
# Configurable Variables
# ---------------------
TESTNAME    ?= fifo_base_test
TOP         ?= tb_top
RADIX       = hex
EXCLUDE_TCL = exclude_coverage.tcl

# ---------------------
# Directories
# ---------------------
LOG_DIR     = log
WAVE_DIR    = waveform
DB_DIR      = db
COV_DIR     = coverage

# ---------------------
# Default Target
# ---------------------
all: clean build

# ---------------------
# Compile Design and Testbench
# ---------------------
build:
	@echo "[BUILD] Compiling design and testbench..."
	vlib work
	vmap work work
	vlog -sv +cover=bcesft +acc -f filelists.f | tee compile.log

# ---------------------
# Run UVM Simulation without coverage
# ---------------------
run:
	@echo "[SIM] Running UVM test: $(TESTNAME)"
	mkdir -p $(LOG_DIR) $(WAVE_DIR)
	vsim -c -voptargs="+acc" -assertdebug -l $(LOG_DIR)/$(TESTNAME).log $(TOP) \
	     -wlf $(WAVE_DIR)/$(TESTNAME).wlf \
	     -do "log -r /*; run -all; quit" \
	     +UVM_TESTNAME=$(TESTNAME)

# ---------------------
# Run UVM Simulation with Coverage
# ---------------------
run_cov:
	@echo "[SIM+COV] Running UVM test with coverage: $(TESTNAME)"
	mkdir -p $(LOG_DIR) $(WAVE_DIR) $(DB_DIR)
	vsim -coverage -c -voptargs="+cover=bcesft" -assertdebug -l $(LOG_DIR)/$(TESTNAME).log $(TOP) \
	     -wlf $(WAVE_DIR)/$(TESTNAME).wlf \
	     -do "if {[file exists $(EXCLUDE_TCL)]} {do $(EXCLUDE_TCL)}; coverage save -onexit ./$(DB_DIR)/$(TESTNAME).ucdb; log -r /*; run -all; quit" \
	     +UVM_TESTNAME=$(TESTNAME)

# ---------------------
# Generate Merged Coverage Reports
# ---------------------
gen_cov:
	@echo "[COV] Generating merged coverage reports..."
	mkdir -p $(COV_DIR)
	vcover merge $(DB_DIR)/merged.ucdb $(DB_DIR)/*.ucdb
	vcover report $(DB_DIR)/merged.ucdb -output $(COV_DIR)/summary_report.txt
	vcover report -details -code bcesft -annotate -all -codeAll \
	              $(DB_DIR)/merged.ucdb -output $(COV_DIR)/detail_report.txt

# ---------------------
# Open Waveform Viewer
# ---------------------
wave:
	@if [ ! -f $(WAVE_DIR)/$(TESTNAME).wlf ]; then \
		echo "[WAVE] Waveform not found. Run 'make run TESTNAME=$(TESTNAME)' first."; \
	else \
		echo "[WAVE] Opening waveform viewer for test: $(TESTNAME)"; \
		vsim -i -view $(WAVE_DIR)/$(TESTNAME).wlf \
		     -do "if {[string match /* $(TOP)]} {add wave -r /$(TOP)/dut/*;} else {add wave -r /$(TOP);}; radix -$(RADIX)" & \
	fi

# ---------------------
# Clean all generated files
# ---------------------
clean:
	@echo "[CLEAN] Cleaning all generated files..."
	rm -rf *.ini work transcript *.dbg *.wlf \
	       $(LOG_DIR) $(WAVE_DIR) $(DB_DIR) $(COV_DIR)

# ---------------------
# Show Help
# ---------------------
help:
	@echo "Makefile for UVM Simulation and Coverage"
	@echo ""
	@echo "Available targets:"
	@echo "  all       : Clean and build (default)"
	@echo "  build     : Compile design and testbench"
	@echo "  run       : Run simulation without coverage"
	@echo "  run_cov   : Run simulation with coverage"
	@echo "  gen_cov   : Generate coverage reports"
	@echo "  wave      : Open waveform viewer"
	@echo "  clean     : Clean generated files"
	@echo "  help      : Show this help message"
	@echo ""
	@echo "Configurable variables:"
	@echo "  TESTNAME  : Test name (default: fifo_base_test)"
	@echo "  TOP       : Top module (default: tb_top)"
	@echo ""
	@echo "Examples:"
	@echo "  make run TESTNAME=fifo_base_test"
	@echo "  make run_cov TESTNAME=my_test"
	@echo "  make wave TESTNAME=fifo_base_test"

.PHONY: all build run run_cov gen_cov wave clean help