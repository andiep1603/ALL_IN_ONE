#!/bin/bash
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "to clean proj"
echo ""

rm -rf run_log.txt
rm -rf *vvp *vcd
#rm -rf *.gtkw
#rm -rf *.rc

rm -rf *.log INCA_libs verdiLog novas* ncverilog* ./dump/*.fsdb
rm -rf simv* csrc* *.log novas.* VerdiLog
rm -rf *fsdb VeriLog INCA_Libs ncverilog*

#
echo ""
echo "clean stop"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"