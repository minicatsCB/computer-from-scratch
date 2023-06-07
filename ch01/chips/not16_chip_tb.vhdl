library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

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
        variable count : std_logic_vector(15 downto 0);
    begin
        for idx in 0 to 15 loop
			-- Convert decimal integer idx to its binary representation
			count := std_logic_vector(to_unsigned(idx, 16));

            a <= count;
			wait for 50 ns;
		end loop;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;