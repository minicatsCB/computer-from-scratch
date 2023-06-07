library IEEE;
use IEEE.std_logic_1164.all;

entity and16_chip_tb is
end entity and16_chip_tb;

architecture behavior of and16_chip_tb is
    component and16_chip
        port (
            a: in std_logic_vector(15 downto 0);
            b: in std_logic_vector(15 downto 0);
            o: out std_logic_vector(15 downto 0)
        );
    end component;

    signal a, b, o : std_logic_vector(15 downto 0) := (others => '0');

begin

    dut: and16_chip port map(
        a => a,
        b => b,
        o => o
    );
    

    stimulus: process
    begin
            a <= "0000000000000000";
            b <= "1111111111111111";
			wait for 50 ns;

            a <= "0001110001010100";
            b <= "0001110101011001";
			wait for 50 ns;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;