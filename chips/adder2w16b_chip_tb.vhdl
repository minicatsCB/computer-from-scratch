library IEEE;
  use ieee.std_logic_1164.all;

entity ADDER2W16B_CHIP_TB is
end entity ADDER2W16B_CHIP_TB;

architecture BEHAVIOR of ADDER2W16B_CHIP_TB is

  component ADDER2W16B_CHIP is
    port (
      A   : in    std_logic_vector(15 downto 0);
      B   : in    std_logic_vector(15 downto 0);
      O   : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a   : std_logic_vector(15 downto 0);
  signal b   : std_logic_vector(15 downto 0);
  signal o   : std_logic_vector(15 downto 0);

begin

  DUT : ADDER2W16B_CHIP
    port map (
      A => a,
      B => b,
      O => o
    );

  STIMULUS : process is
  begin

    a <= "0000000000000000";
    b <= "0000000000000000";
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;

    a <= "0000000000000000";
    b <= "1111111111111111";
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;

    a <= "1111111111111111";
    b <= "1111111111111111";
    wait for 50 ns;
    assert o = "1111111111111110"
      report "Expected: o = 1111111111111110 | Received: o = other result"
      severity failure;

    a <= "1010101010101010";
    b <= "0101010101010101";
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;

    a <= "0011110011000011";
    b <= "0000111111110000";
    wait for 50 ns;
    assert o = "0100110010110011"
      report "Expected: o = 0100110010110011 | Received: o = other result"
      severity failure;

    a <= "0001001000110100";
    b <= "1001100001110110";
    wait for 50 ns;
    assert o = "1010101010101010"
      report "Expected: o = 1010101010101010 | Received: o = other result"
      severity failure;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
