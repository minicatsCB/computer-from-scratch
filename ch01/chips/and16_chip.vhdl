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
    gen: for idx in 0 to 15 generate
        u0: entity work.and_chip(parts_1) port map(a(idx), b(idx), o(idx));
    end generate;
end parts;