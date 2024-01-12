library IEEE;
  use ieee.std_logic_1164.all;

library work;
  use work.utils_package.to_string;

entity NOT1W16B_CHIP_TB is
end entity NOT1W16B_CHIP_TB;

architecture BEHAVIOR of NOT1W16B_CHIP_TB is

  component NOT1W16B_CHIP is
    port (
      A : in    std_logic_vector(15 downto 0);
      O : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a, o : std_logic_vector(15 downto 0);

begin

  DUT : entity work.not1w16b_chip(rtl)
    port map (
      A => a,
      O => o
    );

  STIMULUS : process is
    type pattern_type is record
      a : std_logic_vector(15 downto 0);
      o : std_logic_vector(15 downto 0);
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ("0000000000000000", "1111111111111111"),
      2 => ("1111111111111111", "0000000000000000"),
      3 => ("1010101010101010", "0101010101010101"),
      4 => ("0011110011000011", "1100001100111100"),
      5 => ("0001001000110100", "1110110111001011")
    );

  begin

    for i in patterns'range loop
      a  <= patterns(i).a;
      wait for 50 ns;
      assert o = patterns(i).o
        report "[Error] o[" & integer'image(i) & "] >>> Expected: " & to_string(patterns(i).o) & " / Received: " & to_string(o)
        severity failure;

    end loop;

    assert false
      report "Tests finished"
      severity note;
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
