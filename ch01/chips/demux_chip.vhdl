library IEEE;
use IEEE.std_logic_1164.all;

-- If sel = 0 then { o1 = data, o2 = 0 } else { o1 = 0, o2 = data }
entity demux_chip is
    port (
        data: in std_logic;
        sel: in std_logic;
        o1: out std_logic;
        o2: out std_logic
    );
end demux_chip;

architecture parts of demux_chip is
    signal a_i, a_o : std_logic := '0';
begin
    u0: entity work.not_chip(parts) port map(sel, a_o);
    u1: entity work.and_chip(parts_1) port map(data, a_o, o1);
    u2: entity work.and_chip(parts_1) port map(data, sel, o2);
end parts;