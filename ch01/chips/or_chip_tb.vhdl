library IEEE;
use IEEE.std_logic_1164.all;

entity or_chip_tb is
end entity or_chip_tb;

architecture behavior of or_chip_tb is
    component or_chip
        port (
            a: in std_logic;
            b: in std_logic;
            o: out std_logic
        );
    end component;

    signal a, b, o : std_logic := '0';

begin

    dut: or_chip port map(
        a => a,
        b => b,
        o => o
    );
    

    stimulus: process
    begin
        a <= '0';
        b <= '0';
        wait for 50 ns;

        a <= '0';
        b <= '1';
        wait for 50 ns;

        a <= '1';
        b <= '0';
        wait for 50 ns;

        a <= '1';
        b <= '1';
        wait for 50 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;