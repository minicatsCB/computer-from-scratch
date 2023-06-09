library IEEE;
use IEEE.std_logic_1164.all;

-- For i = 0..15 o = and2w16b_chip(a[i], b[i])
entity and2w16b_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        o: out std_logic_vector(15 downto 0)
    );
end and2w16b_chip;

architecture parts of and2w16b_chip is
begin
    gen: for idx in 0 to 15 generate
        u0: entity work.and2w1b_chip(parts_1) port map(a(idx), b(idx), o(idx));
    end generate;
end parts;