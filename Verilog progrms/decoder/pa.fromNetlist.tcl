
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name decoder -dir "C:/Users/AADHITHAN/Documents/xilinx/decoder/planAhead_run_1" -part xc6slx4tqg144-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/AADHITHAN/Documents/xilinx/decoder/decoder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/AADHITHAN/Documents/xilinx/decoder} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "decoder.ucf"
add_files "decoder.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
