create_project cache_controller_bitstream3 ./vivado_proj_bitstream3 -force
# Attempt to set the correct part for Basys 3
set part_name "xc7a35tcpg236-1"
if {[catch {set_property part $part_name [current_project]}]} {
    puts "WARNING: Could not set part to $part_name. Using default."
}

add_files -norecurse {
    "source code/CACHE_CONTROLLER.sv"
    "source code/CACHE_CONTROLLER_FPGA.sv"
    "source code/L1_CACHE_MEMORY.sv"
    "source code/L2_CACHE_MEMORY.sv"
    "source code/MAIN_MEMORY.sv"
}
add_files -fileset constrs_1 -norecurse "Basys3_Master.xdc"
set_property top CACHE_CONTROLLER_FPGA [current_fileset]
update_compile_order -fileset sources_1

# To allow bitstream generation even if pins are unassigned/invalid due to missing part
set pre_hook_path [file normalize "pre_bitstream.tcl"]
set_property STEPS.WRITE_BITSTREAM.TCL.PRE $pre_hook_path [get_runs impl_1]

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
exit
