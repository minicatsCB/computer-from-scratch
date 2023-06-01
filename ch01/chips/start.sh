#!/bin/bash

if [ $# -eq 0 ] || [ -z "$1" ]
  then
    echo "Please, supply a name in the format <name>_chip"
    exit 1
fi

name=$1;

date
ghdl -s ${name}_chip.vhdl
ghdl -s ${name}_chip_tb.vhdl
ghdl -a ${name}_chip.vhdl
ghdl -a ${name}_chip_tb.vhdl
ghdl -e ${name}_chip_tb
ghdl -r ${name}_chip_tb --vcd=${name}_chip.vcd
gtkwave.exe ${name}_chip.vcd