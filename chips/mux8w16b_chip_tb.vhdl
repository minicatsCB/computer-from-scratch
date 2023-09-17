library IEEE;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.utils_package.to_string;

entity MUX8W16B_CHIP_TB is
end entity MUX8W16B_CHIP_TB;

architecture BEHAVIOR of MUX8W16B_CHIP_TB is

  component MUX8W16B_CHIP is
    port (
      A   : in    std_logic_vector(15 downto 0);
      B   : in    std_logic_vector(15 downto 0);
      C   : in    std_logic_vector(15 downto 0);
      D   : in    std_logic_vector(15 downto 0);
      E   : in    std_logic_vector(15 downto 0);
      F   : in    std_logic_vector(15 downto 0);
      G   : in    std_logic_vector(15 downto 0);
      H   : in    std_logic_vector(15 downto 0);
      SEL : in    std_logic_vector(2 downto 0);
      O   : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a   : std_logic_vector(15 downto 0);
  signal b   : std_logic_vector(15 downto 0);
  signal c   : std_logic_vector(15 downto 0);
  signal d   : std_logic_vector(15 downto 0);
  signal e   : std_logic_vector(15 downto 0);
  signal f   : std_logic_vector(15 downto 0);
  signal g   : std_logic_vector(15 downto 0);
  signal h   : std_logic_vector(15 downto 0);
  signal o   : std_logic_vector(15 downto 0);
  signal sel : std_logic_vector(2 downto 0);

begin

  DUT : MUX8W16B_CHIP
    port map (
      A   => a,
      B   => b,
      C   => c,
      D   => d,
      E   => e,
      F   => f,
      G   => g,
      H   => h,
      SEL => sel,
      O   => o
    );

  STIMULUS : process is

    type pattern_type is record
      a   : std_logic_vector(15 downto 0);
      b   : std_logic_vector(15 downto 0);
      c   : std_logic_vector(15 downto 0);
      d   : std_logic_vector(15 downto 0);
      e   : std_logic_vector(15 downto 0);
      f   : std_logic_vector(15 downto 0);
      g   : std_logic_vector(15 downto 0);
      h   : std_logic_vector(15 downto 0);
      sel : std_logic_vector(2 downto 0);
      o   : std_logic_vector(15 downto 0);
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "1010101010101010", "1111000011110000", "0101010101010101", "0000111100001111", "000", "0000000000000000"),
      2 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "1010101010101010", "1111000011110000", "0101010101010101", "0000111100001111", "001", "1111111111111111"),
      3 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "1010101010101010", "1111000011110000", "0101010101010101", "0000111100001111", "010", "1111111100000000"),
      4 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "1010101010101010", "1111000011110000", "0101010101010101", "0000111100001111", "011", "0000000011111111"),
      5 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "1010101010101010", "1111000011110000", "0101010101010101", "0000111100001111", "100", "1010101010101010"),
      6 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "1010101010101010", "1111000011110000", "0101010101010101", "0000111100001111", "101", "1111000011110000"),
      7 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "1010101010101010", "1111000011110000", "0101010101010101", "0000111100001111", "110", "0101010101010101"),
      8 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "1010101010101010", "1111000011110000", "0101010101010101", "0000111100001111", "111", "0000111100001111")
    );

  begin

    for i in patterns'range loop
      a  <= patterns(i).a;
      b  <= patterns(i).b;
      c  <= patterns(i).c;
      d  <= patterns(i).d;
      e  <= patterns(i).e;
      f  <= patterns(i).f;
      g  <= patterns(i).g;
      h  <= patterns(i).h;
      sel  <= patterns(i).sel;
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
