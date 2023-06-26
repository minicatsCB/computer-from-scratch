library IEEE;
  use ieee.std_logic_1164.all;

-- o = a + b where a, b and o follow 2's complement scheme
-- Overflow is neither detected nor handled

entity ADDER2W16B_CHIP is
  port (
    A   : in    std_logic_vector(15 downto 0);
    B   : in    std_logic_vector(15 downto 0);
    O   : out   std_logic_vector(15 downto 0)
  );
end entity ADDER2W16B_CHIP;

architecture RTL of ADDER2W16B_CHIP is

  signal carry : std_logic_vector(15 downto 0);

begin

  U0 : entity work.halfadder2w1b_chip(rtl)
    port map (
      A     => A(0),
      B     => B(0),
      SUM   => O(0),
      CARRY => carry(0)
    );

  GEN : for idx in 1 to 15 generate

    U1 : entity work.fulladder2w1b_chip(rtl)
      port map (
        A     => A(idx),
        B     => B(idx),
        C     => carry(idx - 1),
        SUM   => O(idx),
        CARRY => carry(idx)
      );

  end generate GEN;

end architecture RTL;
