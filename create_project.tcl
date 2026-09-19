create_project cache_controller_proj ./vivado_project -force
add_files -norecurse {
    "source code/CACHE_CONTROLLER.sv"
    "source code/CACHE_CONTROLLER_FPGA.sv"
    "source code/L1_CACHE_MEMORY.sv"
    "source code/L2_CACHE_MEMORY.sv"
    "source code/MAIN_MEMORY.sv"
}
set_property top CACHE_CONTROLLER [current_fileset]
add_files -fileset sim_1 -norecurse {
    "sim files/TB_READ.sv"
}
set_property top TB_READ [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
exit
