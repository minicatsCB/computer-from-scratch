library IEEE;
  use ieee.std_logic_1164.all;

-- If a = b = 1 then o = 1 else o = 0

entity AND2W1B_CHIP is
  port (
    A : in    std_logic;
    B : in    std_logic;
    O : out   std_logic
  );
end entity AND2W1B_CHIP;

architecture RTL of AND2W1B_CHIP is

begin

  O <= (A nand B) nand (A nand B);

end architecture RTL;
