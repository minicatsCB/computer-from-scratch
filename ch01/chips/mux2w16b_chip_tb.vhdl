library IEEE;
use IEEE.std_logic_1164.all;

entity mux2w16b_chip_tb is
end entity mux2w16b_chip_tb;

architecture behavior of mux2w16b_chip_tb is
    component mux2w16b_chip
        port (
            a: in std_logic_vector(15 downto 0);
            b: in std_logic_vector(15 downto 0);
            sel: in std_logic;
            o: out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal a, b, o : std_logic_vector(15 downto 0) := (others => '0');
    signal sel: std_logic := '0';

begin

    dut: mux2w16b_chip port map(a, b, sel, o);

    stimulus: process
    begin
        a <= "0000000000000000";
        b <= "1111111111111111";
        sel <= '0';
        wait for 50 ns;

        a <= "0000000000000000";
        b <= "1111111111111111";
        sel <= '1';
        wait for 50 ns;

        a <= "0001110001010100";
        b <= "0001110101011001";
        sel <= '0';
        wait for 50 ns;

        a <= "0001110001010100";
        b <= "0001110101011001";
        sel <= '1';
        wait for 50 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;