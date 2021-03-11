
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name dff -dir "C:/Users/AADHITHAN/Documents/xilinx/dff/planAhead_run_2" -part xc6slx4tqg144-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top dff $srcset
set_param project.paUcfFile  "dff.ucf"
set hdlfile [add_files [list {dff.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "dff.ucf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx4tqg144-3
