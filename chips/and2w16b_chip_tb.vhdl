library IEEE;
  use ieee.std_logic_1164.all;

library work;
  use work.utils_package.to_string;

entity AND2W16B_CHIP_TB is
end entity AND2W16B_CHIP_TB;

architecture BEHAVIOR of AND2W16B_CHIP_TB is

  component AND2W16B_CHIP is
    port (
      A : in    std_logic_vector(15 downto 0);
      B : in    std_logic_vector(15 downto 0);
      O : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a : std_logic_vector(15 downto 0);
  signal b : std_logic_vector(15 downto 0);
  signal o : std_logic_vector(15 downto 0);

begin

  DUT : entity work.and2w16b_chip(rtl)
    port map (
      A => a,
      B => b,
      O => o
    );

  STIMULUS : process is
    type pattern_type is record
      a : std_logic_vector(15 downto 0);
      b : std_logic_vector(15 downto 0);
      o : std_logic_vector(15 downto 0);
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ("0000000000000000", "0000000000000000", "0000000000000000"),
      2 => ("0000000000000000", "1111111111111111", "0000000000000000"),
      3 => ("1111111111111111", "1111111111111111", "1111111111111111"),
      4 => ("1010101010101010", "0101010101010101", "0000000000000000"),
      5 => ("0011110011000011", "0000111111110000", "0000110011000000"),
      6 => ("0001001000110100", "1001100001110110", "0001000000110100")
    );

  begin

    for i in patterns'range loop
      a  <= patterns(i).a;
      b  <= patterns(i).b;
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
