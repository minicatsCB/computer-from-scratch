library IEEE;
use IEEE.std_logic_1164.all;

-- If sel = 000 then { o1 = data, o2 = o3 = .. = o8 = 0 } else if sel = 001 { o2 = data, o1 = o3 = .. = o8 = 0 } else if .. else if sel = 111 { o8 = data, o1 = o2 = .. = o7 = 0 }
entity demux8Way_chip is
    port (
        data: in std_logic;
        sel: in std_logic_vector(2 downto 0);
        o1: out std_logic;
        o2: out std_logic;
        o3: out std_logic;
        o4: out std_logic;
        o5: out std_logic;
        o6: out std_logic;
        o7: out std_logic;
        o8: out std_logic
    );
end demux8Way_chip;

architecture parts of demux8Way_chip is
    signal a_o, b_o : std_logic := '0';
begin
    u0: entity work.demux_chip(parts) port map(data, sel(2), a_o, b_o);
    u1: entity work.demux4Way_chip(parts) port map(a_o, sel(1 downto 0), o1, o2, o3, o4);
    u2: entity work.demux4Way_chip(parts) port map(b_o, sel(1 downto 0), o5, o6, o7, o8);
end parts;