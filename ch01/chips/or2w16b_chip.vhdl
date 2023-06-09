library IEEE;
use IEEE.std_logic_1164.all;

-- For i = 0..15 o = or2w16b_chip(a[i], b[i])
entity or2w16b_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        o: out std_logic_vector(15 downto 0)
    );
end or2w16b_chip;

architecture parts of or2w16b_chip is
begin
    gen: for idx in 0 to 15 generate
        u0: entity work.or2w1b_chip(parts) port map(a(idx), b(idx), o(idx));
    end generate;
end parts;