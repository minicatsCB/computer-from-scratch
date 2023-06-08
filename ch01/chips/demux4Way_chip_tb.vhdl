library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity demux4Way_chip_tb is
end entity demux4Way_chip_tb;

architecture behavior of demux4Way_chip_tb is
    component demux4Way_chip
        port (
            data: in std_logic;
            sel: in std_logic_vector(1 downto 0);
            o1: out std_logic;
            o2: out std_logic;
            o3: out std_logic;
            o4: out std_logic
        );
    end component;

    signal data, o1, o2, o3, o4 : std_logic := '0';
    signal sel : std_logic_vector(1 downto 0) := (others => '0');

begin

    dut: demux4Way_chip port map(data, sel, o1, o2, o3, o4);

    stimulus: process
        variable count : std_logic_vector(1 downto 0);
    begin
        for idx in 0 to 3 loop
			-- Convert decimal integer idx to its binary representation
			count := std_logic_vector(to_unsigned(idx, 2));

            data <= '0';
            sel <= count;
			wait for 50 ns;

            data <= '1';
            sel <= count;
			wait for 50 ns;
		end loop;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;