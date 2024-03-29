## Generated SDC file "A4SV.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

## DATE    "Wed Feb 24 18:02:53 2021"

##
## DEVICE  "EP4CE10F17C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {pll8k|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {pll8k|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 6250 -master_clock {clk} [get_pins {pll8k|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {pll8k|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {pll8k|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 15 -divide_by 183106 -master_clock {clk} [get_pins {pll8k|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {pll8k|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {pll8k|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50/1 -multiply_by 15 -divide_by 824 -master_clock {clk} [get_pins {pll8k|altpll_component|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {clkDiv1k} -source [get_nets {pll8k|altpll_component|auto_generated|wire_pll1_clk[0]}] -divide_by 8 -master_clock {pll8k|altpll_component|auto_generated|pll1|clk[0]} [get_keepers {CLK_DIV2N:clkDiv1k|clkout[2]}] 
create_generated_clock -name {clkIR} -source [get_nets {pll8k|altpll_component|auto_generated|wire_pll1_clk[2]}] -divide_by 64 -master_clock {pll8k|altpll_component|auto_generated|pll1|clk[2]} [get_keepers {CLK_DIV2N:clkIR8x|clkout[5]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clkDiv1k}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clkDiv1k}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clkDiv1k}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clkDiv1k}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkDiv1k}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkDiv1k}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkDiv1k}] -rise_to [get_clocks {clkDiv1k}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clkDiv1k}] -fall_to [get_clocks {clkDiv1k}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clkDiv1k}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clkDiv1k}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clkDiv1k}] -rise_to [get_clocks {clkDiv1k}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clkDiv1k}] -fall_to [get_clocks {clkDiv1k}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clkIR}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clkIR}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clkIR}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clkIR}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkIR}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkIR}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clkIR}] -rise_to [get_clocks {clkIR}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clkIR}] -fall_to [get_clocks {clkIR}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clkIR}] -rise_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clkIR}] -fall_to [get_clocks {pll8k|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clkIR}] -rise_to [get_clocks {clkIR}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clkIR}] -fall_to [get_clocks {clkIR}]  0.030  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

