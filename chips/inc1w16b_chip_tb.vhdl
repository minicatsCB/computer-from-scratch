library IEEE;
  use ieee.std_logic_1164.all;

library work;
  use work.utils_package.to_string;

entity INC1W16B_CHIP_TB is
end entity INC1W16B_CHIP_TB;

architecture BEHAVIOR of INC1W16B_CHIP_TB is

  component INC1W16B_CHIP is
    port (
      A   : in    std_logic_vector(15 downto 0);
      O   : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a   : std_logic_vector(15 downto 0);
  signal o   : std_logic_vector(15 downto 0);

begin

  DUT : INC1W16B_CHIP
    port map (
      A => a,
      O => o
    );

  STIMULUS : process is

    type pattern_type is record
      a       : std_logic_vector(15 downto 0);
      o       : std_logic_vector(15 downto 0);
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ("0000000000000000", "0000000000000001"),
      2 => ("1111111111111111", "0000000000000000"),
      3 => ("0000000000000101", "0000000000000110"),
      4 => ("1111111111111011", "1111111111111100")
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
