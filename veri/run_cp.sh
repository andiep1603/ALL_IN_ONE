#!/bin/bash
echo "Testbench start"
echo "*********************************************************"
echo ""

# testbench directory
cd .

# if any error happens, exit
set -e

# clean
#./clean.sh

# compiling
ncverilog +access+rwc \
                 +nclicq \
                 -f sim_list.f

# GUI debugging
#Verdi -f sim_list.f

#
echo ""
echo "*********************************************************"
echo "Testbench stop"
