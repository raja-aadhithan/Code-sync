
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name encoder -dir "C:/Users/AADHITHAN/Documents/xilinx/encoder/planAhead_run_1" -part xc6slx4tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/AADHITHAN/Documents/xilinx/encoder/encoder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/AADHITHAN/Documents/xilinx/encoder} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "encoder.ucf"
add_files "encoder.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
