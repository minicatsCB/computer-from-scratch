library IEEE;
use IEEE.std_logic_1164.all;

entity or16Way_chip_tb is
end entity or16Way_chip_tb;

architecture behavior of or16Way_chip_tb is
    component or16Way_chip
        port (
            a: in std_logic;
            b: in std_logic;
            c: in std_logic;
            d: in std_logic;
            e: in std_logic;
            f: in std_logic;
            g: in std_logic;
            h: in std_logic;
            i: in std_logic;
            j: in std_logic;
            k: in std_logic;
            l: in std_logic;
            m: in std_logic;
            n: in std_logic;
            p: in std_logic;
            q: in std_logic;
            o: out std_logic
        );
    end component;

    signal a, b, c, d, e, f, g, h, i, j, k, l, m, n, p, q, o : std_logic := '0';

begin

    dut: or16Way_chip port map(a, b, c, d, e, f, g, h, i, j, k, l, m, n, p, q, o);
    

    stimulus: process
    begin
            a <= '0';
            b <= '0';
            c <= '0';
            d <= '0';
            e <= '0';
            f <= '0';
            g <= '0';
            h <= '0';
            i <= '0';
            j <= '0';
            k <= '0';
            l <= '0';
            m <= '0';
            n <= '0';
            p <= '0';
            q <= '0';
			wait for 50 ns;

            a <= '1';
            b <= '1';
            c <= '1';
            d <= '1';
            e <= '1';
            f <= '1';
            g <= '1';
            h <= '1';
            i <= '1';
            j <= '1';
            k <= '1';
            l <= '1';
            m <= '1';
            n <= '1';
            p <= '1';
            q <= '1';
			wait for 50 ns;

            a <= '0';
            b <= '1';
            c <= '0';
            d <= '0';
            e <= '0';
            f <= '0';
            g <= '0';
            h <= '0';
            i <= '0';
            j <= '0';
            k <= '0';
            l <= '0';
            m <= '0';
            n <= '0';
            p <= '0';
            q <= '0';
			wait for 50 ns;

            a <= '0';
            b <= '1';
            c <= '0';
            d <= '0';
            e <= '0';
            f <= '0';
            g <= '0';
            h <= '0';
            i <= '0';
            j <= '0';
            k <= '0';
            l <= '1';
            m <= '0';
            n <= '0';
            p <= '0';
            q <= '0';
			wait for 50 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;