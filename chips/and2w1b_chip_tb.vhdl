library IEEE;
  use ieee.std_logic_1164.all;

entity AND2W1B_CHIP_TB is
end entity AND2W1B_CHIP_TB;

architecture BEHAVIOR of AND2W1B_CHIP_TB is

  component HALFADDER2W1B_CHIP is
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

  DUT_1 : and2w1b_chip(rtl)
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
    assert o = '0' report "Expected: o = 0 | Received: o = other result" severity failure;

    a <= '0';
    b <= '1';
    wait for 50 ns;
    assert o = '0' report "Expected: o = 0 | Received: o = other result" severity failure;

    a <= '1';
    b <= '0';
    wait for 50 ns;
    assert o = '0' report "Expected: o = 0 | Received: o = other result" severity failure;

    a <= '1';
    b <= '1';
    wait for 50 ns;
    assert o = '1' report "Expected: o = 1 | Received: o = other result" severity failure;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
