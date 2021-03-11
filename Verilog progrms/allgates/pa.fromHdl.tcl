
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name allgates -dir "C:/Users/AADHITHAN/Documents/xilinx/allgates/planAhead_run_1" -part xc6slx4tqg144-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top allgates $srcset
set_param project.paUcfFile  "allgates.ucf"
set hdlfile [add_files [list {allgates.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "allgates.ucf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx4tqg144-3
