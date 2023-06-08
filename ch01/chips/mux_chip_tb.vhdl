library IEEE;
use IEEE.std_logic_1164.all;

entity mux_chip_tb is
end entity mux_chip_tb;

architecture behavior of mux_chip_tb is
    component mux_chip
        port (
            a: in std_logic;
            b: in std_logic;
            sel: in std_logic;
            o: out std_logic
        );
    end component;

    signal a, b, sel, o : std_logic := '0';

begin

    dut: mux_chip port map(a, b, sel, o);
    
    stimulus: process
    begin
        a <= '0';
        b <= '0';
        sel <= '0';
        wait for 50 ns;

        a <= '0';
        b <= '0';
        sel <= '1';
        wait for 50 ns;

        a <= '0';
        b <= '1';
        sel <= '0';
        wait for 50 ns;

        a <= '0';
        b <= '1';
        sel <= '1';
        wait for 50 ns;

        a <= '1';
        b <= '0';
        sel <= '0';
        wait for 50 ns;

        a <= '1';
        b <= '0';
        sel <= '1';
        wait for 50 ns;

        a <= '1';
        b <= '1';
        sel <= '0';
        wait for 50 ns;

        a <= '1';
        b <= '1';
        sel <= '1';
        wait for 50 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;