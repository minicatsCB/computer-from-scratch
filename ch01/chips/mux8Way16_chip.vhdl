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
    signal a_o, b_o, c_o, d_o, e_o, f_o : std_logic_vector(15 downto 0) := (others => '0');
begin
    u0: entity work.mux16_chip(parts) port map(a, b, sel(0), a_o);
    u1: entity work.mux16_chip(parts) port map(c, d, sel(0), b_o);
    u2: entity work.mux16_chip(parts) port map(e, f, sel(0), c_o);
    u3: entity work.mux16_chip(parts) port map(g, h, sel(0), d_o);

    u4: entity work.mux16_chip(parts) port map(a_o, b_o, sel(1), e_o);
    u5: entity work.mux16_chip(parts) port map(c_o, d_o, sel(1), f_o);

    u6: entity work.mux16_chip(parts) port map(e_o, f_o, sel(2), o);
end parts;