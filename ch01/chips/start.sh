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
  echo -e "  -w,     Show unit WAVES"
  echo -e "  -z,     Process unit ENTIRELY (from syntax check to waves visualization)"
  echo -e "  -c,     CLEAN project"
  echo -e "  -h,     Prints this HELP\n"
  example
}

if [ $# -eq 0 ]
  then
    help
    exit 1
fi

while getopts ":n:saerwzch" FLAG;
do
    case "${FLAG}" in
        n) name=$OPTARG
           echo -e "Unit to process: $name"
           ;;
        s) echo -e "Checking syntax of ${name}"
           ghdl -s ${name}.vhdl
           ;;
        a) echo -e "Analyzing ${name}"
           ghdl -a ${name}.vhdl
           ;;
        e) echo -e "Elaborating ${name}"
           ghdl -e ${name}
           ;;
        r) echo -e "Running ${name}"
           ghdl -r ${name} --vcd=${name}.vcd
           ;;
        w) echo -e "Opening waves of ${name}"
           gtkwave.exe ${name}.vcd  # Assumes access to Windows executable
           ;;
        z) echo -e "Complete execution of [${name}]"
           ghdl -s ${name}.vhdl
           ghdl -a ${name}.vhdl
           ghdl -s ${name}_tb.vhdl
           ghdl -a ${name}_tb.vhdl
           ghdl -e ${name}_tb
           ghdl -r ${name}_tb --vcd=${name}.vcd
           gtkwave.exe ${name}.vcd  # Assumes access to Windows executable
           ;;
         c) echo -e "Cleaning project"
            rm *.vcd
            rm *.cf
         ;;
        h) help
           ;;
        \?) echo "$0: Error: Invalid option: -${OPTARG}" >&2; exit 1;;
        :) echo "$0: Error: option -${OPTARG} requires an argument" >&2; exit 1;;
    esac
done