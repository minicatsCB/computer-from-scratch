library IEEE;
use IEEE.std_logic_1164.all;

-- For i = 0..15 o = mux2w1b_chip(a[i], b[i], sel)
entity mux2w16b_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        sel: in std_logic;
        o: out std_logic_vector(15 downto 0)
    );
end mux2w16b_chip;

architecture parts of mux2w16b_chip is
begin
    gen: for idx in 0 to 15 generate
        u0: entity work.mux2w1b_chip(parts) port map(a(idx), b(idx), sel, o(idx));
    end generate;
end parts;