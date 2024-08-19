#!/bin/bash
echo "Testbench start"
echo "*********************************************************"
echo ""

# testbench directory
cd .

# if any error happens, exit
set -e

# clean
./clean.sh

# compiling
ncverilog +access+rwc \
                 +nclicq \
                 -f sim_list.f

# GUI debugging
#Verdi -f sim_list.f

verdi -2001 -f  sim_list.f \
			-ssf ./TB.fsdb &

#
echo ""
echo "*********************************************************"
echo "Testbench stop"
