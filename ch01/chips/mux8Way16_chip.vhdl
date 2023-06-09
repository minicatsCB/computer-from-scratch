library IEEE;
use IEEE.std_logic_1164.all;

-- If sel = 000 then o = a else if sel = 001 then o = b ... else if sel = 111 then o = h
entity mux8Way16_chip is
    port (
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        c: in std_logic_vector(15 downto 0);
        d: in std_logic_vector(15 downto 0);
        e: in std_logic_vector(15 downto 0);
        f: in std_logic_vector(15 downto 0);
        g: in std_logic_vector(15 downto 0);
        h: in std_logic_vector(15 downto 0);
        sel: in std_logic_vector(2 downto 0);
        o: out std_logic_vector(15 downto 0)
    );
end mux8Way16_chip;

architecture parts of mux8Way16_chip is
    signal a_o, b_o : std_logic_vector(15 downto 0) := (others => '0');
begin
    u0: entity work.mux4w16b_chip(parts) port map(a, b, c, d, sel(1 downto 0), a_o);
    u1: entity work.mux4w16b_chip(parts) port map(e, f, g, h, sel(1 downto 0), b_o);

    u3: entity work.mux2w16b_chip(parts) port map(a_o, b_o, sel(2), o);
end parts;