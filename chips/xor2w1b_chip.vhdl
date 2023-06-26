library IEEE;
  use ieee.std_logic_1164.all;

-- If a != b then o = 1 else o = 0

entity XOR2W1B_CHIP is
  port (
    A : in    std_logic;
    B : in    std_logic;
    O : out   std_logic
  );
end entity XOR2W1B_CHIP;

architecture RTL of XOR2W1B_CHIP is

begin

  O <= (A nand (not B)) nand ((not A) nand B);

end architecture RTL;
