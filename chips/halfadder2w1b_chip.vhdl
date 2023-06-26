library IEEE;
  use ieee.std_logic_1164.all;

-- sum = LSB of a + b, carry = MSB of a + b

entity HALFADDER2W1B_CHIP is
  port (
    A       : in    std_logic;
    B       : in    std_logic;
    SUM     : out   std_logic;
    CARRY   : out   std_logic
  );
end entity HALFADDER2W1B_CHIP;

architecture RTL of HALFADDER2W1B_CHIP is

begin

  U0 : entity work.xor2w1b_chip(rtl)
    port map (
      A => A,
      B => B,
      O => SUM
    );

  U1 : entity work.and2w1b_chip(rtl)
    port map (
      A => A,
      B => B,
      O => CARRY
    );

end architecture RTL;
