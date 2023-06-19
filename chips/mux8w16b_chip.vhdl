library IEEE;
  use ieee.std_logic_1164.all;

-- If sel = 000 then o = a else if sel = 001 then o = b ... else if sel = 111 then o = h

entity MUX8W16B_CHIP is
  port (
    A   : in    std_logic_vector(15 downto 0);
    B   : in    std_logic_vector(15 downto 0);
    C   : in    std_logic_vector(15 downto 0);
    D   : in    std_logic_vector(15 downto 0);
    E   : in    std_logic_vector(15 downto 0);
    F   : in    std_logic_vector(15 downto 0);
    G   : in    std_logic_vector(15 downto 0);
    H   : in    std_logic_vector(15 downto 0);
    SEL : in    std_logic_vector(2 downto 0);
    O   : out   std_logic_vector(15 downto 0)
  );
end entity MUX8W16B_CHIP;

architecture rtl of MUX8W16B_CHIP is

  signal a_o, b_o : std_logic_vector(15 downto 0);

begin

  U0 : entity work.mux4w16b_chip(rtl)
    port map (
      A   => A,
      B   => B,
      C   => C,
      D   => D,
      SEL => SEL(1 downto 0),
      O   => a_o
    );

  U1 : entity work.mux4w16b_chip(rtl)
    port map (
      A   => E,
      B   => F,
      C   => G,
      D   => H,
      SEL => SEL(1 downto 0),
      O   => b_o
    );

  U3 : entity work.mux2w16b_chip(rtl)
    port map (
      A   => a_o,
      B   => b_o,
      SEL => SEL(2),
      O   => O
    );

end architecture rtl;
