library IEEE;
  use ieee.std_logic_1164.all;

-- If sel = 0 then { o1 = data, o2 = 0 } else { o1 = 0, o2 = data }

entity DEMUX2W1B_CHIP is
  port (
    DATA : in    std_logic;
    SEL  : in    std_logic;
    O1   : out   std_logic;
    O2   : out   std_logic
  );
end entity DEMUX2W1B_CHIP;

architecture rtl of DEMUX2W1B_CHIP is

  signal a_i, a_o : std_logic;

begin

  U0 : entity work.not1w1b_chip(rtl)
    port map (
      A => SEL,
      O => a_o
    );

  U1 : entity work.and2w1b_chip(rtl)
    port map (
      A  => DATA,
      B  => a_o,
      O => O1
    );

  U2 : entity work.and2w1b_chip(rtl)
    port map (
      A => DATA,
      B => SEL,
      O => O2
    );

end architecture rtl;
