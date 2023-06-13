library IEEE;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity NOT1W16B_CHIP_TB is
end entity NOT1W16B_CHIP_TB;

architecture BEHAVIOR of NOT1W16B_CHIP_TB is

  component NOT1W16B_CHIP is
    port (
      A : in    std_logic_vector(15 downto 0);
      O : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a, o : std_logic_vector(15 downto 0);

begin

  DUT : NOT1W16B_CHIP
    port map (
      A => a,
      O => o
    );

  STIMULUS : process is

    variable sample : std_logic_vector(15 downto 0);

  begin

    for idx in 0 to 15 loop

      -- Convert decimal integer idx to its binary representation
      sample := std_logic_vector(to_unsigned(idx, 16));

      a <= sample;
      wait for 50 ns;
      assert o = (not a) report "Expected: o = not a | Received: o = a" severity failure;

    end loop;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
