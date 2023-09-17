library IEEE;
  use ieee.std_logic_1164.all;
  
library work;
  use work.utils_package.to_string;

entity MUX2W16B_CHIP_TB is
end entity MUX2W16B_CHIP_TB;

architecture BEHAVIOR of MUX2W16B_CHIP_TB is

  component MUX2W16B_CHIP is
    port (
      A   : in    std_logic_vector(15 downto 0);
      B   : in    std_logic_vector(15 downto 0);
      SEL : in    std_logic;
      O   : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a   : std_logic_vector(15 downto 0);
  signal b   : std_logic_vector(15 downto 0);
  signal sel : std_logic;
  signal o   : std_logic_vector(15 downto 0);

begin

  DUT : MUX2W16B_CHIP
    port map (
      A   => a,
      B   => b,
      SEL => sel,
      O   => o
    );

  STIMULUS : process is

    type pattern_type is record
      a   : std_logic_vector(15 downto 0);
      b   : std_logic_vector(15 downto 0);
      sel : std_logic;
      o   : std_logic_vector(15 downto 0);
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ("0000000000000000", "1111111111111111", '0', "0000000000000000"),
      2 => ("0000000000000000", "1111111111111111", '1', "1111111111111111"),
      3 => ("0001110001010100", "0001110101011001", '0', "0001110001010100"),
      4 => ("0001110001010100", "0001110101011001", '1', "0001110101011001")
    );

  begin

    for i in patterns'range loop
      a  <= patterns(i).a;
      b  <= patterns(i).b;
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
