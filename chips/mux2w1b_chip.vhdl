library IEEE;
  use ieee.std_logic_1164.all;

-- If sel = 0 then o = a else out = b

entity MUX2W1B_CHIP is
  port (
    A   : in    std_logic;
    B   : in    std_logic;
    SEL : in    std_logic;
    O   : out   std_logic
  );
end entity MUX2W1B_CHIP;

-- Example of using "premade" entities

architecture RTL of MUX2W1B_CHIP is

  signal a_i : std_logic;
  signal b_i : std_logic;
  signal c_i : std_logic;
  signal a_o : std_logic;
  signal b_o : std_logic;
  signal c_o : std_logic;

begin

  U0 : entity work.not1w1b_chip(rtl)
    port map (
      A => SEL,
      O => a_o
    );

  U1 : entity work.and2w1b_chip(rtl)
    port map (
      A => A,
      B => a_o,
      O => b_o
    );

  U2 : entity work.and2w1b_chip(rtl)
    port map (
      A => B,
      B => SEL,
      O => c_o
    );

  U3 : entity work.or2w1b_chip(rtl)
    port map (
      A => b_o,
      B => c_o,
      O => O
    );

end architecture RTL;
