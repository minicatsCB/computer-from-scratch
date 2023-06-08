library IEEE;
use IEEE.std_logic_1164.all;

-- For i = 0..15 o = mux_chip(a[i], b[i], sel)
entity mux16_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        sel: in std_logic;
        o: out std_logic_vector(15 downto 0)
    );
end mux16_chip;

architecture parts of mux16_chip is
begin
    gen: for idx in 0 to 15 generate
        u0: entity work.mux_chip(parts) port map(a(idx), b(idx), sel, o(idx));
    end generate;
end parts;