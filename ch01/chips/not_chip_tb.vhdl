library IEEE;
use IEEE.std_logic_1164.all;

entity not_chip_tb is
end entity not_chip_tb;

architecture behavior of not_chip_tb is
    component not_chip
        port (
            a: in std_logic;
            o: out std_logic
        );
    end component;

    signal a, o : std_logic := '0';

begin

    dut: not_chip port map(a, o);
    

    stimulus: process
    begin
        a <= '0';
        wait for 50 ns;

        a <= '1';
        wait for 50 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;