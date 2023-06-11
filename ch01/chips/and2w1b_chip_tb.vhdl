library IEEE;
  use ieee.std_logic_1164.all;

entity AND2W1B_CHIP_TB is
end entity AND2W1B_CHIP_TB;

architecture BEHAVIOR of AND2W1B_CHIP_TB is

  signal a : std_logic;
  signal b : std_logic;
  signal o : std_logic;

begin

  DUT_1 : entity work.and2w1b_chip(parts_1)
    port map (
      A => a,
      B => b,
      O => o
    );

  DUT_2 : entity work.and2w1b_chip(parts_2)
    port map (
      A => a,
      B => b,
      O => o
    );

  STIMULUS : process is
  begin

    a <= '0';
    b <= '0';
    wait for 50 ns;

    a <= '0';
    b <= '1';
    wait for 50 ns;

    a <= '1';
    b <= '0';
    wait for 50 ns;

    a <= '1';
    b <= '1';
    wait for 50 ns;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
