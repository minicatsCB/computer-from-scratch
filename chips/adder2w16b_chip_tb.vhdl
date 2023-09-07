library IEEE;
  use ieee.std_logic_1164.all;

entity ADDER2W16B_CHIP_TB is
end entity ADDER2W16B_CHIP_TB;

architecture BEHAVIOR of ADDER2W16B_CHIP_TB is

  component ADDER2W16B_CHIP is
    port (
      A   : in    std_logic_vector(15 downto 0);
      B   : in    std_logic_vector(15 downto 0);
      O   : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a   : std_logic_vector(15 downto 0);
  signal b   : std_logic_vector(15 downto 0);
  signal o   : std_logic_vector(15 downto 0);

  function to_string (vec: std_logic_vector) return string is

    variable result : string (1 to vec'length) := (others => NUL);
    variable j      : integer                  := 1;

  begin

    for i in vec'range loop

      result(j) := std_logic'image(vec(i))(2);
      j         := j + 1;

    end loop;

    return result;

  end function;

begin

  DUT : ADDER2W16B_CHIP
    port map (
      A => a,
      B => b,
      O => o
    );

  STIMULUS : process is
    type pattern_type is record
      a   : std_logic_vector(15 downto 0);
      b   : std_logic_vector(15 downto 0);
      o   : std_logic_vector(15 downto 0);
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ("0000000000000000", "0000000000000000", "0000000000000000"),
      2 => ("0000000000000000", "1111111111111111", "1111111111111111"),
      3 => ("1111111111111111", "1111111111111111", "1111111111111110"),
      4 => ("1010101010101010", "0101010101010101", "1111111111111111"),
      5 => ("0011110011000011", "0000111111110000", "0100110010110011"),
      6 => ("0001001000110100", "1001100001110110", "1010101010101010")
    );

  begin

    --  Check each pattern.
    for i in patterns'range loop

      a  <= patterns(i).a;
      b  <= patterns(i).b;
      wait for 50 ns;

      assert o = patterns(i).o
        report "[Error] o[" & integer'image(i) & "] >>> Expected: " & to_string(patterns(i).o) & " / Received: " & to_string(o)
        severity failure;

    end loop;

    assert false
      report "end of test"
      severity note;
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
