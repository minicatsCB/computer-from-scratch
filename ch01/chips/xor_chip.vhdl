library IEEE;
use IEEE.std_logic_1164.all;

-- If a != b then o = 1 else o = 0
entity xor_chip is
    port (
        a: in std_logic;
        b: in std_logic;
        o: out std_logic
    );
end xor_chip;

architecture parts_1 of xor_chip is
begin
    o <= (a nand (not b)) nand ((not a) nand b);
end parts_1;

-- Alternative implementation using premade NOT chip
architecture parts_2 of xor_chip is
    signal i_1, i_2, o_1, o_2 : std_logic := '0';
begin
    u0: entity work.not2w1b_chip(parts) port map(b, o_1);
    u1: entity work.not2w1b_chip(parts) port map(a, o_2);
    o <= (a nand o_1) nand (o_2 nand b);
end parts_2;