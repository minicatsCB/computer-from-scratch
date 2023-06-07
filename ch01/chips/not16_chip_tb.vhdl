library IEEE;
use IEEE.std_logic_1164.all;

entity not16_chip_tb is
end entity not16_chip_tb;

architecture behavior of not16_chip_tb is
    component not16_chip
        port (
            a: in std_logic_vector(15 downto 0);
            o: out std_logic_vector(15 downto 0)
        );
    end component;

    signal a, o : std_logic_vector(15 downto 0) := (others => '0');

begin

    dut: not16_chip port map(
        a => a,
        o => o
    );
    

    stimulus: process
    begin
        a <= "0000000000000000";
        wait for 50 ns;

        a <= "1111110111110110";
        wait for 50 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;