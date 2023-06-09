library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity not1w16b_chip_tb is
end entity not1w16b_chip_tb;

architecture behavior of not1w16b_chip_tb is
    component not1w16b_chip
        port (
            a: in std_logic_vector(15 downto 0);
            o: out std_logic_vector(15 downto 0)
        );
    end component;

    signal a, o : std_logic_vector(15 downto 0) := (others => '0');

begin

    dut: not1w16b_chip port map(a, o);
    

    stimulus: process
        variable sample : std_logic_vector(15 downto 0);
    begin
        for idx in 0 to 15 loop
			-- Convert decimal integer idx to its binary representation
			sample := std_logic_vector(to_unsigned(idx, 16));

            a <= sample;
			wait for 50 ns;
		end loop;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;