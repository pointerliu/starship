# Make Target
##################################
STARSHIP_TARHET ?= SIM


# Verilog Generation Configuration
##################################
STARSHIP_CORE	?= Rocket
STARSHIP_FREQ	?= 100

ifeq ($(STARSHIP_TARHET), SIM) 
	STARSHIP_TH 	?= starship.asic.TestHarness
	STARSHIP_TOP	?= starship.asic.StarshipSimTop
	STARSHIP_CONFIG	?= starship.asic.StarshipSimConfig
else
	STARSHIP_TH 	?= starship.fpga.TestHarness
	STARSHIP_TOP	?= starship.fpga.StarshipFPGATop
	STARSHIP_CONFIG	?= starship.fpga.StarshipFPGAConfig
endif


# FPGA Configuration
####################

STARSHIP_BOARD	?= vc707


# Simulation Configuration
##########################

STARSHIP_TESTCASE	?= $(BUILD)/starship-dummy-testcase

$(BUILD)/starship-dummy-testcase:
	mkdir -p $(BUILD)
	wget https://github.com/sycuricon/riscv-tests/releases/download/dummy/rv64ui-p-simple -O $@
