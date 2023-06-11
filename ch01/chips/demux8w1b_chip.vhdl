library IEEE;
  use ieee.std_logic_1164.all;

-- If sel = 000 then { o1 = data, o2 = o3 = .. = o8 = 0 }
-- else if sel = 001 { o2 = data, o1 = o3 = .. = o8 = 0 }
-- else if ..
-- else if sel = 111 { o8 = data, o1 = o2 = .. = o7 = 0 }

entity DEMUX8W1B_CHIP is
  port (
    DATA : in    std_logic;
    SEL  : in    std_logic_vector(2 downto 0);
    O1   : out   std_logic;
    O2   : out   std_logic;
    O3   : out   std_logic;
    O4   : out   std_logic;
    O5   : out   std_logic;
    O6   : out   std_logic;
    O7   : out   std_logic;
    O8   : out   std_logic
  );
end entity DEMUX8W1B_CHIP;

architecture rtl of DEMUX8W1B_CHIP is

  signal a_o, b_o : std_logic;

begin

  U0 : entity work.demux2w1b_chip(rtl)
    port map (
      DATA => DATA,
      SEL  => SEL(2),
      O1   => a_o,
      O2   => b_o
    );

  U1 : entity work.demux4w1b_chip(rtl)
    port map (
      DATA => a_o,
      SEL  => SEL(1 downto 0),
      O1   => O1,
      O2   => O2,
      O3   => O3,
      O4   => O4
    );

  U2 : entity work.demux4w1b_chip(rtl)
    port map (
      DATA => b_o,
      SEL  => SEL(1 downto 0),
      O5   => O5,
      O6   => O6,
      O7   => O7,
      O8   => O8
    );

end architecture rtl;
