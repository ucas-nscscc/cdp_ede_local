startgroup
set_property -dict [list CONFIG.Coe_File {/home/seoyoung/Desktop/ucas-nscscc/bare-metal/build/inst_ram.coe}] [get_bd_cells blk_mem_gen_0]
endgroup
save_bd_design
reset_run synth_1
reset_run design_1_blk_mem_gen_0_0_synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12