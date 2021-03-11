
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name jkff -dir "C:/Users/AADHITHAN/Documents/xilinx/jkff/planAhead_run_2" -part xc6slx4tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/AADHITHAN/Documents/xilinx/jkff/jkff.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/AADHITHAN/Documents/xilinx/jkff} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "jkff.ucf"
add_files "jkff.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
