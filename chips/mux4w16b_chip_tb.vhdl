library IEEE;
  use ieee.std_logic_1164.all;

library work;
  use work.utils_package.to_string;

entity MUX4W16B_CHIP_TB is
end entity MUX4W16B_CHIP_TB;

architecture BEHAVIOR of MUX4W16B_CHIP_TB is

  component MUX4W16B_CHIP is
    port (
      A   : in    std_logic_vector(15 downto 0);
      B   : in    std_logic_vector(15 downto 0);
      C   : in    std_logic_vector(15 downto 0);
      D   : in    std_logic_vector(15 downto 0);
      SEL : in    std_logic_vector(1 downto 0);
      O   : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a   : std_logic_vector(15 downto 0);
  signal b   : std_logic_vector(15 downto 0);
  signal c   : std_logic_vector(15 downto 0);
  signal d   : std_logic_vector(15 downto 0);
  signal sel : std_logic_vector(1 downto 0);
  signal o   : std_logic_vector(15 downto 0);

begin

  DUT : MUX4W16B_CHIP
    port map (
      A   => a,
      B   => b,
      C   => c,
      D   => d,
      SEL => sel,
      O   => o
    );

  STIMULUS : process is

    type pattern_type is record
      a   : std_logic_vector(15 downto 0);
      b   : std_logic_vector(15 downto 0);
      c   : std_logic_vector(15 downto 0);
      d   : std_logic_vector(15 downto 0);
      sel : std_logic_vector(1 downto 0);
      o   : std_logic_vector(15 downto 0);
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "00", "0000000000000000"),
      2 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "01", "1111111111111111"),
      3 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "10", "1111111100000000"),
      4 => ("0000000000000000", "1111111111111111", "1111111100000000", "0000000011111111", "11", "0000000011111111")
    );

  begin

    for i in patterns'range loop
      a  <= patterns(i).a;
      b  <= patterns(i).b;
      c  <= patterns(i).c;
      d  <= patterns(i).d;
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
