#/bin/bash

# Do not change the order
FILES=("not1w1b_chip" "and2w1b_chip" "or2w1b_chip" "xor2w1b_chip"
       "not1w16b_chip" "and2w16b_chip" "or2w16b_chip"
       "or16w1b_chip"
       "mux2w1b_chip" "mux2w16b_chip" "mux4w16b_chip" "mux8w16b_chip"
       "demux2w1b_chip" "demux4w1b_chip" "demux8w1b_chip"
       "halfadder2w1b_chip" "fulladder2w1b_chip" "adder2w16b_chip" "inc1w16b_chip"
       "alu2w16b_chip")

for t in ${FILES[@]}; do
    bash ./start.sh -n $t -sae
done

bash ./start.sh -n utils_package -sa