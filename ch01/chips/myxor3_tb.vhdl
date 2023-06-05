library IEEE;
use IEEE.std_logic_1164.all;

entity myxor3_tb is
end entity myxor3_tb;

architecture behavior of myxor3_tb is
    component myxor3
        port (
            a: in std_logic;
            b: in std_logic;
            c: in std_logic;
            x: out std_logic
        );
    end component;

    signal a, b, c, x : std_logic := '0';

begin

    dut: myxor3 port map(
        a => a,
        b => b,
        c => c,
        x => x
    );
    

    stimulus: process
    begin
        a <= '0';
        b <= '0';
        c <= '0';
        wait for 20 ns;

        a <= '0';
        b <= '0';
        c <= '1';
        wait for 20 ns;

        a <= '0';
        b <= '1';
        c <= '0';
        wait for 20 ns;

        a <= '0';
        b <= '1';
        c <= '1';
        wait for  20 ns;

        a <= '1';
        b <= '0';
        c <= '0';
        wait for  20 ns;

        a <= '1';
        b <= '0';
        c <= '1';
        wait for  20 ns;

        a <= '1';
        b <= '1';
        c <= '0';
        wait for  20 ns;

        a <= '1';
        b <= '1';
        c <= '1';
        wait for  20 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;