library IEEE;
use IEEE.std_logic_1164.all;

entity and_chip is
    port (
        a: in std_logic;
        b: in std_logic;
        o: out std_logic
    );
end and_chip;

architecture parts of and_chip is
begin
    o <= (a nand b) nand (a nand b);
end parts;