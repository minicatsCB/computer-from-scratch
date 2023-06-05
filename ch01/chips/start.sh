#!/bin/bash

SCRIPT="start.sh"

function usage {
    echo -e "usage: $SCRIPT MANDATORY [OPTION]\n"
}

function example {
    echo -e "example: $SCRIPT --name and_chip -saerw\n"
}

function help {
  usage
  echo -e "MANDATORY:"
  echo -e "  -n,  VAL  The NAME of the unit to process in the format <name>_chip"
  echo -e "OPTION:"
  echo -e "  -s,     Check SYNTAX of file"
  echo -e "  -a,     ANALYZE file"
  echo -e "  -e,     ELABORATE unit"
  echo -e "  -r,     RUN unit"
  echo -e "  -h,     Prints this HELP\n"
  example
}

if [ $# -eq 0 ]
  then
    help
    exit 1
fi

while getopts ":n:saerwh" FLAG;
do
    case "${FLAG}" in
        n) name=$OPTARG
           echo -e "Unit to process: $name"
           ;;
        s) echo -e "Checking syntax of [${name}.vhdl, ${name}_tb.vhdl]"
           ghdl -s ${name}.vhdl
           ghdl -s ${name}_tb.vhdl
           ;;
        a) echo -e "Analyzing [${name}.vhdl, ${name}_tb.vhdl]"
           ghdl -a ${name}.vhdl
           ghdl -a ${name}_tb.vhdl
           ;;
        e) echo -e "Elaborating [${name}_tb]"
           ghdl -e ${name}_tb
           ;;
        r) echo -e "Running [${name}_tb]"
           ghdl -r ${name}_tb --vcd=${name}.vcd
           ;;
        w) echo -e "Opening waves of [${name}_tb]"
           gtkwave.exe ${name}.vcd  # Assumes access to Windows executable
           ;;
        h) help
           ;;
        \?) echo "$0: Error: Invalid option: -${OPTARG}" >&2; exit 1;;
        :) echo "$0: Error: option -${OPTARG} requires an argument" >&2; exit 1;;
    esac
done