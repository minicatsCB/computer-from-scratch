library IEEE;
use IEEE.std_logic_1164.all;

-- If a = b = 0 then o = 0 else o = 1
entity or2w1b_chip is
    port (
        a: in std_logic;
        b: in std_logic;
        o: out std_logic
    );
end or2w1b_chip;

architecture parts of or2w1b_chip is
begin
    o <= (a nand a) nand (b nand b);
end parts;