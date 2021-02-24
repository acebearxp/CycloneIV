## Generated SDC file "A1Intel.sdc"

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

## DATE    "Wed Feb 24 17:06:27 2021"

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

create_clock -name {clk50M} -period 20.000 -waveform { 0.000 10.000 } [get_ports { clk50M }]
create_clock -name {CLK_DIV:clkDiv1S|clkout} -period 1000000.000 -waveform { 0.000 500000.000 } [get_registers { CLK_DIV:clkDiv1S|clkout }]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {CLK_DIV:clkDiv1S|clkout}] -rise_to [get_clocks {clk50M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {CLK_DIV:clkDiv1S|clkout}] -fall_to [get_clocks {clk50M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK_DIV:clkDiv1S|clkout}] -rise_to [get_clocks {clk50M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {CLK_DIV:clkDiv1S|clkout}] -fall_to [get_clocks {clk50M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk50M}] -rise_to [get_clocks {CLK_DIV:clkDiv1S|clkout}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk50M}] -fall_to [get_clocks {CLK_DIV:clkDiv1S|clkout}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk50M}] -rise_to [get_clocks {clk50M}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk50M}] -fall_to [get_clocks {clk50M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk50M}] -rise_to [get_clocks {CLK_DIV:clkDiv1S|clkout}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk50M}] -fall_to [get_clocks {CLK_DIV:clkDiv1S|clkout}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk50M}] -rise_to [get_clocks {clk50M}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk50M}] -fall_to [get_clocks {clk50M}]  0.020  


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

