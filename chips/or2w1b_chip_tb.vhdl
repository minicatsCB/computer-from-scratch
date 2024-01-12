library IEEE;
  use ieee.std_logic_1164.all;

entity OR2W1B_CHIP_TB is
end entity OR2W1B_CHIP_TB;

architecture BEHAVIOR of OR2W1B_CHIP_TB is

  component OR2W1B_CHIP is
    port (
      A : in    std_logic;
      B : in    std_logic;
      O : out   std_logic
    );
  end component;

  signal a : std_logic;
  signal b : std_logic;
  signal o : std_logic;

begin

  DUT : entity work.or2w1b_chip(rtl)
    port map (
      A => a,
      B => b,
      O => o
    );

  STIMULUS : process is
    type pattern_type is record
      a : std_logic;
      b : std_logic;
      o : std_logic;
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ('0', '0', '0'),
      2 => ('0', '1', '1'),
      3 => ('1', '0', '1'),
      4 => ('1', '1', '1')
    );
  begin

    for i in patterns'range loop
      a  <= patterns(i).a;
      b  <= patterns(i).b;
      wait for 50 ns;
      assert o = patterns(i).o
        report "[Error] o[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o) & " / Received: " & std_logic'image(o)
        severity failure;

    end loop;

    assert false
      report "Tests finished"
      severity note;
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
