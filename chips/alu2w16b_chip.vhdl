library IEEE;
  use ieee.std_logic_1164.all;

-- PRESET: zx, nx, zy and ny (zero or negate x and y, respectively) (logic operations)
-- FUNCTION: If f = 0 then o = x & b (logic operation) else o = x + b (arithmetic operation in 2's complement scheme)
-- POSTSET: If no = 0 then o = o else o = !o (logic operation)
-- FLAG: If o = 0 then zr = 1 else zr = 0
-- FLAG: If o < 0 then ng = 1 else ng = 0
-- Overflow is neither detected nor handled

entity ALU2W16B_CHIP is
  port (
    X   : in    std_logic_vector(15 downto 0);
    Y   : in    std_logic_vector(15 downto 0);
    ZX  : in    std_logic;
    NX  : in    std_logic;
    ZY  : in    std_logic;
    NY  : in    std_logic;
    F   : in    std_logic;
    NO  : in    std_logic;
    O   : out   std_logic_vector(15 downto 0);
    ZR  : out   std_logic;
    NG  : out   std_logic
  );
end entity ALU2W16B_CHIP;

architecture RTL of ALU2W16B_CHIP is

  signal   zx_o              : std_logic_vector(15 downto 0);
  signal   zy_o              : std_logic_vector(15 downto 0);
  signal   nx_o              : std_logic_vector(15 downto 0);
  signal   ny_o              : std_logic_vector(15 downto 0);
  signal   notzx_o           : std_logic_vector(15 downto 0);
  signal   notzy_o           : std_logic_vector(15 downto 0);
  signal   and_o             : std_logic_vector(15 downto 0);
  signal   add_o             : std_logic_vector(15 downto 0);
  signal   f_o               : std_logic_vector(15 downto 0);
  signal   notf_o            : std_logic_vector(15 downto 0);
  signal   no_o              : std_logic_vector(15 downto 0);
  signal   or_o              : std_logic;
  constant zero              : std_logic_vector := "0000000000000000";

begin

  U0 : entity work.mux2w16b_chip(rtl)
    port map (
      A   => X,
      B   => zero,
      SEL => ZX,
      O   => zx_o
    );

  U1 : entity work.mux2w16b_chip(rtl)
    port map (
      A   => Y,
      B   => zero,
      SEL => ZY,
      O   => zy_o
    );

  U2 : entity work.not1w16b_chip(rtl)
    port map (
      A => zx_o,
      O => notzx_o
    );

  U3 : entity work.mux2w16b_chip(rtl)
    port map (
      A   => zx_o,
      B   => notzx_o,
      SEL => NX,
      O   => nx_o
    );

  U4 : entity work.not1w16b_chip(rtl)
    port map (
      A => zy_o,
      O => notzy_o
    );

  U5 : entity work.mux2w16b_chip(rtl)
    port map (
      A   => zy_o,
      B   => notzy_o,
      SEL => NY,
      O   => ny_o
    );

  U6 : entity work.and2w16b_chip(rtl)
    port map (
      A => nx_o,
      B => ny_o,
      O => and_o
    );

  U7 : entity work.adder2w16b_chip(rtl)
    port map (
      A => nx_o,
      B => ny_o,
      O => add_o
    );

  U8 : entity work.mux2w16b_chip(rtl)
    port map (
      A   => and_o,
      B   => add_o,
      SEL => F,
      O   => f_o
    );

  U9 : entity work.not1w16b_chip(rtl)
    port map (
      A => f_o,
      O => notf_o
    );

  U10 : entity work.mux2w16b_chip(rtl)
    port map (
      A   => f_o,
      B   => notf_o,
      SEL => NO,
      O   => no_o
    );

  O <= no_o;

  U11 : entity work.or16w1b_chip(rtl)
    port map (
      A => no_o(0),
      B => no_o(1),
      C => no_o(2),
      D => no_o(3),
      E => no_o(4),
      F => no_o(5),
      G => no_o(6),
      H => no_o(7),
      I => no_o(8),
      J => no_o(9),
      K => no_o(10),
      L => no_o(11),
      M => no_o(12),
      N => no_o(13),
      P => no_o(14),
      Q => no_o(15),
      O => or_o
    );

  U12 : entity work.not1w1b_chip(rtl)
    port map (
      A => or_o,
      O => ZR
    );

  NG <= no_o(15);

end architecture RTL;
