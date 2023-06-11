library IEEE;
  use ieee.std_logic_1164.all;

-- If a = b = 0 then o = 0 else o = 1

entity OR2W1B_CHIP is
  port (
    A : in    std_logic;
    B : in    std_logic;
    O : out   std_logic
  );
end entity OR2W1B_CHIP;

architecture rtl of OR2W1B_CHIP is

begin

  O <= (A nand A) nand (B nand B);

end architecture rtl;
