library IEEE;
use IEEE.std_logic_1164.all;

-- If sel = 00 then { o1 = data, o2 = o3 = o4 = 0 } else if sel = 01 { o2 = data, o1 = o3 = o4 = 0 } else if sel = 10 { o3 = data, o1 = o2 = o4 = 0 } else if sel = 11 { o4 = data, o1 = o2 = o3 = 0 }
entity demux4Way_chip is
    port (
        data: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        o1: out std_logic;
        o2: out std_logic;
        o3: out std_logic;
        o4: out std_logic
    );
end demux4Way_chip;

architecture parts of demux4Way_chip is
    signal a_o, b_o : std_logic := '0';
begin
    u0: entity work.demux_chip(parts) port map(data, sel(1), a_o, b_o);
    u1: entity work.demux_chip(parts) port map(a_o, sel(0), o1, o2);
    u2: entity work.demux_chip(parts) port map(b_o, sel(0), o3, o4);
end parts;