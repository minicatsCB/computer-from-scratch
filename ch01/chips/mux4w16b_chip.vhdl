library IEEE;
  use ieee.std_logic_1164.all;

-- If sel = 00 then o = a else if sel = 01 then o = b else if sel = 10 then o = c else if sel = 11 then o = d

entity MUX4W16B_CHIP is
  port (
    A   : in    std_logic_vector(15 downto 0);
    B   : in    std_logic_vector(15 downto 0);
    C   : in    std_logic_vector(15 downto 0);
    D   : in    std_logic_vector(15 downto 0);
    SEL : in    std_logic_vector(1 downto 0);
    O   : out   std_logic_vector(15 downto 0)
  );
end entity MUX4W16B_CHIP;

architecture PARTS of MUX4W16B_CHIP is

  signal a_o, b_o : std_logic_vector(15 downto 0);

begin

  U0 : entity work.mux2w16b_chip(parts)
    port map (
      A   => A,
      B   => B,
      SEL => SEL(0),
      O   => a_o
    );

  U1 : entity work.mux2w16b_chip(parts)
    port map (
      A   => C,
      B   => D,
      SEL => SEL(0),
      O   => b_o
    );

  U2 : entity work.mux2w16b_chip(parts)
    port map (
      A   => a_o,
      B   => b_o,
      SEL => SEL(1),
      O   => O
    );

end architecture PARTS;
