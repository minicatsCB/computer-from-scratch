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

architecture rtl_1 of XOR2W1B_CHIP is

begin

  O <= (A nand (not B)) nand ((not A) nand B);

end architecture rtl_1;

-- Alternative implementation using premade NOT chip

architecture rtl_2 of XOR2W1B_CHIP is

  signal i_1 : std_logic;
  signal i_2 : std_logic;
  signal o_1 : std_logic;
  signal o_2 : std_logic;

begin

  U0 : entity work.not1w1b_chip(rtl)
    port map (
      A => B,
      O => o_1
    );

  U1 : entity work.not1w1b_chip(rtl)
    port map (
      A => A,
      O => o_2
    );

  O <= (A nand o_1) nand (o_2 nand B);

end architecture rtl_2;
