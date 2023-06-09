library IEEE;
use IEEE.std_logic_1164.all;

-- For i = 0..15 o = not1w16b_chip(a[i])
entity not1w16b_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        o: out std_logic_vector(15 downto 0)
    );
end not1w16b_chip;

architecture parts of not1w16b_chip is
begin
    gen: for idx in 0 to 15 generate
        u0: entity work.not1w1b_chip(parts) port map(a(idx), o(idx));
    end generate;
end parts;