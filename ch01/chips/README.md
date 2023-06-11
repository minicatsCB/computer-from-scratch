# Instructions
Example: if you want to create a 1-way 1-bit NOT chip, create a file named `not1w1b_chip.vhdl`.

Next, create tests for that chip in a file named `not1w1b_chip_tb.vhdl`.

Finally, execute the simulation running the Bash script `start.sh` (check `bash start.sh --help`). If all is correct, GTKWave will open. Don't expect to see some console output like Jest. Just open the waves and check with your eyes if the outputs are correct.

# Linting
Use [`vsg`](https://vhdl-style-guide.readthedocs.io/en/latest/index.html) tool to follow VHDL Style Guide.

**Example**

To lint all `.vhdl` files applying the coding style preferred by Jeremiah Leary (a characteristic set of rules) and fix them automatically, run:

`vsg -f *.vhdl --style jcl --fix`

*Note:* there are some errors that must be fixed manually (i.e. explicit port mapping or "port_map_008" rule).