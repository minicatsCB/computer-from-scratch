library IEEE;
use IEEE.std_logic_1164.all;

entity demux2w1b_chip_tb is
end entity demux2w1b_chip_tb;

architecture behavior of demux2w1b_chip_tb is
    component demux2w1b_chip
        port (
            data: in std_logic;
            sel: in std_logic;
            o1: out std_logic;
            o2: out std_logic
        );
    end component;

    signal data, sel, o1, o2 : std_logic := '0';

begin

    dut: demux2w1b_chip port map(data, sel, o1, o2);

    stimulus: process
    begin
        data <= '0';
        sel <= '0';
        wait for 50 ns;

        data <= '0';
        sel <= '1';
        wait for 50 ns;

        data <= '1';
        sel <= '0';
        wait for 50 ns;

        data <= '1';
        sel <= '1';
        wait for 50 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;