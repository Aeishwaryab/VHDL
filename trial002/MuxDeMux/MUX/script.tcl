############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project MuxDeMux
add_files ../trial001/trial001.xpr
open_solution "MUX"

create_clock -period 10 -name default
#source "./MuxDeMux/MUX/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
