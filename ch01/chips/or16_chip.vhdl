library IEEE;
use IEEE.std_logic_1164.all;

-- For i = 0..15 o = or16_chip(a[i])
entity or16_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        o: out std_logic_vector(15 downto 0)
    );
end or16_chip;

architecture parts of or16_chip is
begin
    o <= (a nand a) nand (b nand b);
end parts;