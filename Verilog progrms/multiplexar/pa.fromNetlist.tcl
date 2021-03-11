
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name multiplexar -dir "C:/Users/AADHITHAN/Documents/xilinx/multiplexar/planAhead_run_1" -part xc6slx4tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/AADHITHAN/Documents/xilinx/multiplexar/multiplexar.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/AADHITHAN/Documents/xilinx/multiplexar} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "multiplexar.ucf"
add_files "multiplexar.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
