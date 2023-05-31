# Instructions
1. Check file syntax

`ghdl -s not_chip.vhdl`

`ghdl -s not_chip_tb.vhdl`

2. Analyze file

`ghdl -a not_chip.vhdl`

`ghdl -a not_chip_tb.vhdl`

3. Elaborate unit

`ghdl -e not_chip_tb`

4. Run unit generating .vcd file

`ghdl -r not_chip_tb --vcd=not_chip.vcd`

5. Open .vcd file with GTKWave

`gtkwave not_chip.vcd`

6. Manually check the result of the tests

Don't expect in this project to see some console output like Jest. Just open the waves and check with your eyes if the outputs are correct.