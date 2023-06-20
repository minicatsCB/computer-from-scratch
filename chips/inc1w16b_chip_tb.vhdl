library IEEE;
  use ieee.std_logic_1164.all;

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
  begin

    a <= "0000000000000000";
    wait for 50 ns;
    assert o = "0000000000000001"
      report "Expected: o = 0000000000000001 | Received: o = other result"
      severity failure;

    a <= "1111111111111111";
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;

    a <= "0000000000000101";
    wait for 50 ns;
    assert o = "0000000000000110"
      report "Expected: o = 0000000000000110 | Received: o = other result"
      severity failure;

    a <= "1111111111111011";
    wait for 50 ns;
    assert o = "1111111111111100"
      report "Expected: o = 1111111111111100 | Received: o = other result"
      severity failure;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
