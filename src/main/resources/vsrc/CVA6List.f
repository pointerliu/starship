+define+WT_DCACHE

+incdir+${CVA6_REPO_DIR}/common/submodules/common_cells/include/
+incdir+${CVA6_REPO_DIR}/common/submodules/common_cells/src/
+incdir+${CVA6_REPO_DIR}/common/local/util/


${CVA6_REPO_DIR}/core/include/cv64a6_imafdc_sv39_config_pkg.sv
// Broken (?) dependencies in packages:
//    - include/ariane_pkg.sv is dependent on src/riscv-dbg/src/dm_pkg.sv
//      (ariane should not depend on debug-module)
${CVA6_REPO_DIR}/core/include/riscv_pkg.sv
// TODO: should not be needed.
${CVA6_REPO_DIR}/corev_apu/riscv-dbg/src/dm_pkg.sv
${CVA6_REPO_DIR}/core/include/ariane_pkg.sv
// TODO: ariane_axi_pkg is dependent on this.
${CVA6_REPO_DIR}/corev_apu/axi/src/axi_pkg.sv
${CVA6_REPO_DIR}/core/include/ariane_rvfi_pkg.sv

// Packages
${CVA6_REPO_DIR}/core/include/ariane_axi_pkg.sv
${CVA6_REPO_DIR}/core/include/wt_cache_pkg.sv
${CVA6_REPO_DIR}/core/include/std_cache_pkg.sv
${CVA6_REPO_DIR}/core/include/axi_intf.sv
${CVA6_REPO_DIR}/core/include/instr_tracer_pkg.sv

//CVXIF
${CVA6_REPO_DIR}/core/include/cvxif_pkg.sv
${CVA6_REPO_DIR}/core/cvxif_example/include/cvxif_instr_pkg.sv
${CVA6_REPO_DIR}/core/cvxif_fu.sv
${CVA6_REPO_DIR}/core/cvxif_example/cvxif_example_coprocessor.sv
${CVA6_REPO_DIR}/core/cvxif_example/instr_decoder.sv

// Common Cells
${CVA6_REPO_DIR}/common/submodules/common_cells/src/cf_math_pkg.sv
${CVA6_REPO_DIR}/common/submodules/common_cells/src/fifo_v3.sv
${CVA6_REPO_DIR}/common/submodules/common_cells/src/lfsr.sv
${CVA6_REPO_DIR}/common/submodules/common_cells/src/lzc.sv
${CVA6_REPO_DIR}/common/submodules/common_cells/src/rr_arb_tree.sv
${CVA6_REPO_DIR}/common/submodules/common_cells/src/shift_reg.sv
${CVA6_REPO_DIR}/common/submodules/common_cells/src/unread.sv
${CVA6_REPO_DIR}/common/submodules/common_cells/src/popcount.sv
${CVA6_REPO_DIR}/common/submodules/common_cells/src/exp_backoff.sv

// Common Cells for example coprocessor
${CVA6_REPO_DIR}/common/submodules/common_cells/src/counter.sv
${CVA6_REPO_DIR}/common/submodules/common_cells/src/delta_counter.sv

// Floating point unit
${CVA6_REPO_DIR}/core/fpu/src/fpnew_pkg.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_cast_multi.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_classifier.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_divsqrt_multi.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_fma_multi.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_fma.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_noncomp.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_opgroup_block.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_opgroup_fmt_slice.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_opgroup_multifmt_slice.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_rounding.sv
${CVA6_REPO_DIR}/core/fpu/src/fpnew_top.sv
${CVA6_REPO_DIR}/core/fpu/src/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv
${CVA6_REPO_DIR}/core/fpu/src/fpu_div_sqrt_mvp/hdl/control_mvp.sv
${CVA6_REPO_DIR}/core/fpu/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv
${CVA6_REPO_DIR}/core/fpu/src/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv
${CVA6_REPO_DIR}/core/fpu/src/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv
${CVA6_REPO_DIR}/core/fpu/src/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv
${CVA6_REPO_DIR}/core/fpu/src/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv

// Top-level source files (not necessarily instantiated at the top of the cva6).
${CVA6_REPO_DIR}/core/ariane.sv
${CVA6_REPO_DIR}/core/cva6.sv
${CVA6_REPO_DIR}/core/alu.sv
// Note: depends on fpnew_pkg, above
${CVA6_REPO_DIR}/core/fpu_wrap.sv
${CVA6_REPO_DIR}/core/branch_unit.sv
${CVA6_REPO_DIR}/core/compressed_decoder.sv
${CVA6_REPO_DIR}/core/controller.sv
${CVA6_REPO_DIR}/core/csr_buffer.sv
${CVA6_REPO_DIR}/core/csr_regfile.sv
${CVA6_REPO_DIR}/core/decoder.sv
${CVA6_REPO_DIR}/core/ex_stage.sv
${CVA6_REPO_DIR}/core/instr_realign.sv
${CVA6_REPO_DIR}/core/id_stage.sv
${CVA6_REPO_DIR}/core/issue_read_operands.sv
${CVA6_REPO_DIR}/core/issue_stage.sv
${CVA6_REPO_DIR}/core/load_unit.sv
${CVA6_REPO_DIR}/core/load_store_unit.sv
${CVA6_REPO_DIR}/core/mult.sv
${CVA6_REPO_DIR}/core/multiplier.sv
${CVA6_REPO_DIR}/core/serdiv.sv
${CVA6_REPO_DIR}/core/perf_counters.sv
${CVA6_REPO_DIR}/core/ariane_regfile_ff.sv
${CVA6_REPO_DIR}/core/re_name.sv
// NOTE: scoreboard.sv modified for DSIM (unchanged for other simulators)
${CVA6_REPO_DIR}/core/scoreboard.sv
${CVA6_REPO_DIR}/core/store_buffer.sv
${CVA6_REPO_DIR}/core/amo_buffer.sv
${CVA6_REPO_DIR}/core/store_unit.sv
${CVA6_REPO_DIR}/core/commit_stage.sv
${CVA6_REPO_DIR}/core/axi_shim.sv

// What is "frontend"?
${CVA6_REPO_DIR}/core/frontend/btb.sv
${CVA6_REPO_DIR}/core/frontend/bht.sv
${CVA6_REPO_DIR}/core/frontend/ras.sv
${CVA6_REPO_DIR}/core/frontend/instr_scan.sv
${CVA6_REPO_DIR}/core/frontend/instr_queue.sv
${CVA6_REPO_DIR}/core/frontend/frontend.sv

// Cache subsystem
${CVA6_REPO_DIR}/core/cache_subsystem/wt_dcache_ctrl.sv
${CVA6_REPO_DIR}/core/cache_subsystem/wt_dcache_mem.sv
${CVA6_REPO_DIR}/core/cache_subsystem/wt_dcache_missunit.sv
${CVA6_REPO_DIR}/core/cache_subsystem/wt_dcache_wbuffer.sv
${CVA6_REPO_DIR}/core/cache_subsystem/wt_dcache.sv
${CVA6_REPO_DIR}/core/cache_subsystem/cva6_icache.sv
${CVA6_REPO_DIR}/core/cache_subsystem/wt_cache_subsystem.sv
${CVA6_REPO_DIR}/core/cache_subsystem/wt_axi_adapter.sv

// Physical Memory Protection
// NOTE: pmp.sv modified for DSIM (unchanged for other simulators)
${CVA6_REPO_DIR}/core/pmp/src/pmp.sv
${CVA6_REPO_DIR}/core/pmp/src/pmp_entry.sv

// Tracer (behavioral code, not RTL)
${CVA6_REPO_DIR}/common/local/util/instr_tracer_if.sv
${CVA6_REPO_DIR}/common/local/util/instr_tracer.sv
${CVA6_REPO_DIR}/common/local/util/tc_sram_wrapper.sv
${CVA6_REPO_DIR}/corev_apu/src/tech_cells_generic/src/rtl/tc_sram.sv
${CVA6_REPO_DIR}/common/local/util/sram.sv

// MMU Sv39
${CVA6_REPO_DIR}/core/mmu_sv39/mmu.sv
${CVA6_REPO_DIR}/core/mmu_sv39/ptw.sv
${CVA6_REPO_DIR}/core/mmu_sv39/tlb.sv

// axi auto matic
${CVA6_REPO_DIR}/core/fpu/src/common_cells/src/stream_arbiter.sv
${CVA6_REPO_DIR}/core/fpu/src/common_cells/src/stream_arbiter_flushable.sv
${CVA6_REPO_DIR}/corev_apu/src/axi_riscv_atomics/src/axi_riscv_atomics_wrap.sv
${CVA6_REPO_DIR}/corev_apu/src/axi_riscv_atomics/src/axi_riscv_atomics.sv
${CVA6_REPO_DIR}/corev_apu/src/axi_riscv_atomics/src/axi_res_tbl.sv
${CVA6_REPO_DIR}/corev_apu/src/axi_riscv_atomics/src/axi_riscv_amos.sv
${CVA6_REPO_DIR}/corev_apu/src/axi_riscv_atomics/src/axi_riscv_amos_alu.sv
${CVA6_REPO_DIR}/corev_apu/src/axi_riscv_atomics/src/axi_riscv_lrsc.sv