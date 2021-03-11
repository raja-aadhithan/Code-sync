
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name mux -dir "C:/Users/AADHITHAN/Documents/xilinx/mux/planAhead_run_2" -part xc6slx4tqg144-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top mux $srcset
set_param project.paUcfFile  "mux.ucf"
set hdlfile [add_files [list {mux.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "mux.ucf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx4tqg144-3
