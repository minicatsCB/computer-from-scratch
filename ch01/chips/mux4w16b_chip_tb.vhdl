library IEEE;
use IEEE.std_logic_1164.all;

entity mux4w16b_chip_tb is
end entity mux4w16b_chip_tb;

architecture behavior of mux4w16b_chip_tb is
    component mux4w16b_chip
        port (
            a: in std_logic_vector(15 downto 0);
            b: in std_logic_vector(15 downto 0);
            c: in std_logic_vector(15 downto 0);
            d: in std_logic_vector(15 downto 0);
            sel: in std_logic_vector(1 downto 0);
            o: out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal a, b, c, d, o : std_logic_vector(15 downto 0) := (others => '0');
    signal sel: std_logic_vector(1 downto 0) := (others => '0');

begin

    dut: mux4w16b_chip port map(a, b, c, d, sel, o);

    stimulus: process
    begin
        a <= "0000000000000000";
        b <= "1111111111111111";
        c <= "1111111100000000";
        d <= "0000000011111111";
        sel <= "00";
        wait for 50 ns;

        a <= "0000000000000000";
        b <= "1111111111111111";
        c <= "1111111100000000";
        d <= "0000000011111111";
        sel <= "01";
        wait for 50 ns;

        a <= "0000000000000000";
        b <= "1111111111111111";
        c <= "1111111100000000";
        d <= "0000000011111111";
        sel <= "10";
        wait for 50 ns;

        a <= "0000000000000000";
        b <= "1111111111111111";
        c <= "1111111100000000";
        d <= "0000000011111111";
        sel <= "11";
        wait for 50 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;