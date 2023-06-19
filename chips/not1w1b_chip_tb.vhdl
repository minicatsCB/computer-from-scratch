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

  DUT : NOT1W1B_CHIP
    port map (
      A => a,
      O => o
    );

  STIMULUS : process is
  begin

    a <= '0';
    wait for 50 ns;
    assert o = '1'
      report "Expected: o = 1 | Received: o = other result"
      severity failure;

    a <= '1';
    wait for 50 ns;
    assert o = '0'
      report "Expected: o = 0 | Received: o = other result"
      severity failure;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
