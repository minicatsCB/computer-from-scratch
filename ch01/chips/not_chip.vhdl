library IEEE;
use IEEE.std_logic_1164.all;

-- If a = 0 then o = 1 else o = 0
entity not_chip is
    port (
        a: in std_logic;
        o: out std_logic
    );
end not_chip;

architecture parts of not_chip is
begin
    o <= a nand a;
end parts;