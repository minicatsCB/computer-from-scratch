library IEEE;
  use ieee.std_logic_1164.all;

-- If a = 0 then o = 1 else o = 0

entity NOT1W1B_CHIP is
  port (
    A : in    std_logic;
    O : out   std_logic
  );
end entity NOT1W1B_CHIP;

architecture RTL of NOT1W1B_CHIP is

begin

  O <= A nand A;

end architecture RTL;
