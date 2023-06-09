library IEEE;
use IEEE.std_logic_1164.all;

-- If sel = 0 then o = a else out = b
entity mux2w1b_chip is
    port (
        a: in std_logic;
        b: in std_logic;
        sel: in std_logic;
        o: out std_logic
    );
end mux2w1b_chip;

-- Example of using "premade" entities
architecture parts of mux2w1b_chip is
    signal a_i, b_i, c_i, a_o, b_o, c_o : std_logic := '0';
begin
    u0: entity work.not1w1b_chip(parts) port map(sel, a_o);
    u1: entity work.and2w1b_chip(parts_1) port map(a, a_o, b_o);
    u2: entity work.and2w1b_chip(parts_1) port map(b, sel, c_o);
    u3: entity work.or2w1b_chip(parts) port map(b_o, c_o, o);
end parts;