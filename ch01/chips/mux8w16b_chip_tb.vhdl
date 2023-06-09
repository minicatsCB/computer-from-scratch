library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux8w16b_chip_tb is
end entity mux8w16b_chip_tb;

architecture behavior of mux8w16b_chip_tb is
    component mux8w16b_chip
        port (
            a: in std_logic_vector(15 downto 0);
            b: in std_logic_vector(15 downto 0);
            c: in std_logic_vector(15 downto 0);
            d: in std_logic_vector(15 downto 0);
            e: in std_logic_vector(15 downto 0);
            f: in std_logic_vector(15 downto 0);
            g: in std_logic_vector(15 downto 0);
            h: in std_logic_vector(15 downto 0);
            sel: in std_logic_vector(2 downto 0);
            o: out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal a, b, c, d, e, f, g, h, o : std_logic_vector(15 downto 0) := (others => '0');
    signal sel: std_logic_vector(2 downto 0) := (others => '0');

begin

    dut: mux8w16b_chip port map(a, b, c, d, e, f, g, h, sel, o);

    stimulus: process
        variable count : std_logic_vector(2 downto 0);
    begin
        for idx in 0 to 7 loop
			-- Convert decimal integer idx to its binary representation
			count := std_logic_vector(to_unsigned(idx, 3));

            a <= "0000000000000000";
            b <= "1111111111111111";
            c <= "1111111100000000";
            d <= "0000000011111111";
            e <= "1010101010101010";
            f <= "1111000011110000";
            g <= "0101010101010101";
            h <= "0000111100001111";
            sel <= count;
			wait for 50 ns;
		end loop;

        assert true report "Tests finished";
        wait;

    end process stimulus;
end architecture behavior;