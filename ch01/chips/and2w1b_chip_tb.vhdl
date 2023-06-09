library IEEE;
use IEEE.std_logic_1164.all;

entity and2w1b_chip_tb is
end entity and2w1b_chip_tb;

architecture behavior of and2w1b_chip_tb is
    signal a, b, o : std_logic := '0';

begin

    dut_1: entity work.and2w1b_chip(parts_1) PORT MAP (a, b, o);
    dut_2: entity work.and2w1b_chip(parts_2) PORT MAP (a, b, o);
    

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