library IEEE;
use IEEE.std_logic_1164.all;

-- If sel = 00 then o = a else if sel = 01 then o = b else if sel = 10 then o = c else if sel = 11 then o = d
entity mux4w16b_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        c: in std_logic_vector(15 downto 0);
        d: in std_logic_vector(15 downto 0);
        sel: in std_logic_vector(1 downto 0);
        o: out std_logic_vector(15 downto 0)
    );
end mux4w16b_chip;

architecture parts of mux4w16b_chip is
    signal a_o, b_o : std_logic_vector(15 downto 0) := (others => '0');
begin
    u0: entity work.mux2w16b_chip(parts) port map(a, b, sel(0), a_o);
    u1: entity work.mux2w16b_chip(parts) port map(c, d, sel(0), b_o);
    u2: entity work.mux2w16b_chip(parts) port map(a_o, b_o, sel(1), o);
end parts;