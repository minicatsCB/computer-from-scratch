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

architecture PARTS_1 of AND2W1B_CHIP is

begin

  O <= (A nand B) nand (A nand B);

end architecture PARTS_1;

-- Example of multiple architectures

architecture PARTS_2 of AND2W1B_CHIP is

  signal a_i : std_logic;

begin

  a_i <= (A nand B);

  U0 : entity work.not1w1b_chip(parts)
    port map (
      A => a_i,
      O => O
    );

end architecture PARTS_2;
