library IEEE;
use IEEE.std_logic_1164.all;

entity or_chip is
    port (
        a: in std_logic;
        b: in std_logic;
        o: out std_logic
    );
end or_chip;

architecture parts of or_chip is
begin
    o <= (a nand a) nand (b nand b);
end parts;