
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name dfflip -dir "C:/Users/AADHITHAN/Documents/xilinx/dfflip/planAhead_run_1" -part xc6slx4tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/AADHITHAN/Documents/xilinx/dfflip/dfflip.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/AADHITHAN/Documents/xilinx/dfflip} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "dfflip.ucf"
add_files "dfflip.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
