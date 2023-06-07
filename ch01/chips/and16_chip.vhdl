library IEEE;
use IEEE.std_logic_1164.all;

-- For i = 0..15 o = and16_chip(a[i])
entity and16_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        o: out std_logic_vector(15 downto 0)
    );
end and16_chip;

architecture parts of and16_chip is
begin
    o <= (a nand b) nand (a nand b);
end parts;