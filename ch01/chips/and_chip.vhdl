library IEEE;
use IEEE.std_logic_1164.all;

entity and_chip is
    port (
        a: in std_logic;
        b: in std_logic;
        o: out std_logic
    );
end and_chip;

architecture parts_1 of and_chip is
begin
    o <= (a nand b) nand (a nand b);
end parts_1;

architecture parts_2 of and_chip is
    signal a_i : std_logic := '0';
begin
    a_i <= (a nand b);
    u0: not_chip port map(a_i, o);
end parts_2;