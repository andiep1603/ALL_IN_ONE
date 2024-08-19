#!/bin/bash

# testbench directory
cd .

# if any error, exit
set -e

# clean
./clean.sh

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "IP testbench start"
echo ""

# compiling by iverilog
# iverilog -o TB.vvp TB.v
iverilog -I./INS -I./STM -o TB.vvp TB.v

# Running simulation, needed for iverilog
vvp TB.vvp > run_log.txt 2>&1

#GUI debugging by gtwave
gtkwave TB.vcd

#
echo ""
echo "IP testbench stop"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
