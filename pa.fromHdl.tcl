
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name raizcuadrada -dir "/home/juancho/Dropbox/carrera/sistemasLogicos/pruebas/raizcuadrada/planAhead_run_1" -part xc3s1200efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "sqrt.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {sqrt.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top sqrt $srcset
add_files [list {sqrt.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s1200efg320-4
