library IEEE;
  use ieee.std_logic_1164.all;

entity AND2W16B_CHIP_TB is
end entity AND2W16B_CHIP_TB;

architecture BEHAVIOR of AND2W16B_CHIP_TB is

  component AND2W16B_CHIP is
    port (
      A : in    std_logic_vector(15 downto 0);
      B : in    std_logic_vector(15 downto 0);
      O : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a : std_logic_vector(15 downto 0);
  signal b : std_logic_vector(15 downto 0);
  signal o : std_logic_vector(15 downto 0);

begin

  DUT : AND2W16B_CHIP
    port map (
      A => a,
      B => b,
      O => o
    );

  STIMULUS : process is
  begin

    a <= "0000000000000000";
    b <= "1111111111111111";
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = (a nand b) | Received: o = other result"
      severity failure;

    a <= "0001110001010100";
    b <= "0001110101011001";
    wait for 50 ns;
    assert o = "0001110001010000"
      report "Expected: o = (a nand b) | Received: o = other result"
      severity failure;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
