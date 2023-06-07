library IEEE;
use IEEE.std_logic_1164.all;

-- For i = 0..15 o = not16_chip(a[i])
entity not16_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        o: out std_logic_vector(15 downto 0)
    );
end not16_chip;

architecture parts of not16_chip is
begin
    o <= a nand a;
end parts;