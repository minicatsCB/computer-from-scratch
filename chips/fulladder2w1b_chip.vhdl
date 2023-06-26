library IEEE;
  use ieee.std_logic_1164.all;

-- sum = LSB of a + b + c, carry = MSB of a + b + c

entity FULLADDER2W1B_CHIP is
  port (
    A       : in    std_logic;
    B       : in    std_logic;
    C       : in    std_logic;
    SUM     : out   std_logic;
    CARRY   : out   std_logic
  );
end entity FULLADDER2W1B_CHIP;

architecture RTL of FULLADDER2W1B_CHIP is

  signal sum_1, carry_1, carry_2 : std_logic;

begin

  U0 : entity work.halfadder2w1b_chip(rtl)
    port map (
      A   => A,
      B   => B,
      SUM => sum_1,
      CARRY => carry_1
    );

  U1 : entity work.halfadder2w1b_chip(rtl)
    port map (
      A   => sum_1,
      B   => C,
      SUM => SUM,
      CARRY => carry_2
    );

  U2 : entity work.or2w1b_chip(rtl)
    port map (
      A => carry_1,
      B => carry_2,
      O => CARRY
    );

end architecture RTL;
