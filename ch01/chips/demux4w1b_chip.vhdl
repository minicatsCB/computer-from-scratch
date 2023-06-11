library IEEE;
  use ieee.std_logic_1164.all;

-- If sel = 00 then { o1 = data, o2 = o3 = o4 = 0 } else if sel = 01 { o2 = data, o1 = o3 = o4 = 0 } else if .. else if sel = 11 { o4 = data, o1 = o2 = o3 = 0 }

entity DEMUX4W1B_CHIP is
  port (
    DATA : in    std_logic;
    SEL  : in    std_logic_vector(1 downto 0);
    O1   : out   std_logic;
    O2   : out   std_logic;
    O3   : out   std_logic;
    O4   : out   std_logic
  );
end entity DEMUX4W1B_CHIP;

architecture PARTS of DEMUX4W1B_CHIP is

  signal a_o, b_o : std_logic;

begin

  U0 : entity work.demux2w1b_chip(parts)
    port map (
      DATA => DATA,
      SEL  => SEL(1),
      O1   => a_o,
      O2   => b_o
    );

  U1 : entity work.demux2w1b_chip(parts)
    port map (
      DATA => a_o,
      SEL  => SEL(0),
      O1   => O1,
      O2   => O2
    );

  U2 : entity work.demux2w1b_chip(parts)
    port map (
      DATA => b_o,
      SEL  => SEL(0),
      O1   => O3,
      O2   => O4
    );

end architecture PARTS;
