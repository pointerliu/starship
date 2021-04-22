# Starship Project
# Copyright (C) 2021 by phantom
# Email: phantom@zju.edu.cn
# This file is under MIT License, see https://www.phvntom.tech/LICENSE.txt

TOP			:= $(CURDIR)
SRC			:= $(TOP)/repo
BUILD		:= $(TOP)/build
CONFIG		:= $(TOP)/conf
SBT_BUILD 	:= $(TOP)/target $(TOP)/project/target $(TOP)/project/project

ifndef RISCV
$(error $$RISCV is undefined, please set $$RISCV to your riscv-toolchain)
endif

all: bitstream

#######################################
#                                      
#         Verilog Generator
#                                      
#######################################

ROCKET_SRC		:= $(SRC)/rocket-chip
ROCKET_BUILD	:= $(BUILD)/rocket-chip
ROCKET_JVM_MEM	?= 2G
ROCKET_JAVA		:= java -Xmx$(ROCKET_JVM_MEM) -Xss8M -jar $(ROCKET_SRC)/sbt-launch.jar
ROCKET_TOP_PROJ	?= starship.fpga
ROCKET_TOP		?= TestHarness
ROCKET_CON_PROJ	?= starship
ROCKET_CONFIG	?= StarshipFPGAConfig
ROCKET_OUTPUT	:= $(ROCKET_TOP_PROJ).$(ROCKET_TOP).$(ROCKET_CONFIG)
ROCKET_VERILOG	:= $(ROCKET_BUILD)/$(ROCKET_OUTPUT).v
ROCKET_FIRRTL	:= $(ROCKET_BUILD)/$(ROCKET_OUTPUT).fir

$(ROCKET_FIRRTL): 
	mkdir -p $(ROCKET_BUILD)
	$(ROCKET_JAVA) "runMain freechips.rocketchip.system.Generator	\
					-td $(ROCKET_BUILD) -T $(ROCKET_TOP_PROJ).$(ROCKET_TOP)	\
					-C $(ROCKET_CON_PROJ).$(ROCKET_CONFIG) -n $(ROCKET_OUTPUT)"

$(ROCKET_VERILOG): $(ROCKET_FIRRTL)
	mkdir -p $(ROCKET_BUILD)
	$(ROCKET_JAVA) "runMain firrtl.stage.FirrtlMain	\
					-td $(ROCKET_BUILD) --infer-rw $(ROCKET_TOP) \
					--repl-seq-mem -c:$(ROCKET_TOP):-o:$(ROCKET_BUILD)/$(ROCKET_OUTPUT).rom.conf \
					-faf $(ROCKET_BUILD)/$(ROCKET_OUTPUT).anno.json \
					-fct firrtl.passes.InlineInstances \
					-i $< -o $@ -X verilog"

verilog: $(ROCKET_VERILOG)

#######################################
#
#         Bitstream Generator
#
#######################################

BOARD				:= vc707
VIVADO_SRC			:= $(SRC)/fpga-shells/xilinx
VIVADO_BUILD		:= $(BUILD)/vivado
VIVADO_BITSTREAM 	:= $(VIVADO_BUILD)/$(ROCKET_OUTPUT).bit
VERILOG_SRAM		:= $(ROCKET_BUILD)/$(ROCKET_OUTPUT).behav_srams.v
VERILOG_INCLUDE 	:= $(VIVADO_BUILD)/$(ROCKET_OUTPUT).vsrc.f
VERILOG_SRC			:= $(VERILOG_SRAM) \
					   $(ROCKET_BUILD)/$(ROCKET_OUTPUT).v \
					   $(ROCKET_BUILD)/plusarg_reader.v \
					   $(VIVADO_SRC)/$(BOARD)/vsrc/sdio.v \
					   $(VIVADO_SRC)/$(BOARD)/vsrc/vc707reset.v
$(VERILOG_INCLUDE):
	mkdir -p $(VIVADO_BUILD)
	echo $(VERILOG_SRC) > $@

$(VERILOG_SRAM):
	$(ROCKET_SRC)/scripts/vlsi_mem_gen $(ROCKET_BUILD)/$(ROCKET_OUTPUT).rom.conf >> $@

$(VIVADO_BITSTREAM): $(ROCKET_VERILOG) $(VERILOG_INCLUDE) $(VERILOG_SRAM)
	mkdir -p $(VIVADO_BUILD)
	cd $(VIVADO_BUILD); vivado -mode batch -nojournal \
		-source $(VIVADO_SRC)/common/tcl/vivado.tcl \
		-tclargs -F "$(VERILOG_INCLUDE)" \
		-top-module "$(ROCKET_TOP)" \
		-ip-vivado-tcls "$(shell find '$(ROCKET_BUILD)' -name '*.vivado.tcl')" \
		-board "$(BOARD)"

bitstream: $(VIVADO_BITSTREAM)

#######################################
#
#               Utils
#
#######################################

clean:
	rm -rf $(BUILD) $(SBT_BUILD)