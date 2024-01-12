library IEEE;
  use ieee.std_logic_1164.all;

entity NOT1W1B_CHIP_TB is
end entity NOT1W1B_CHIP_TB;

architecture BEHAVIOR of NOT1W1B_CHIP_TB is

  component NOT1W1B_CHIP is
    port (
      A : in    std_logic;
      O : out   std_logic
    );
  end component;

  signal a, o : std_logic;

begin

  DUT : entity work.not1w1b_chip(rtl)
    port map (
      A => a,
      O => o
    );

  STIMULUS : process is
    type pattern_type is record
      a : std_logic;
      o : std_logic;
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ('0', '1'),
      2 => ('1', '0')
    );
  begin

    for i in patterns'range loop
      a  <= patterns(i).a;
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
