library IEEE;
  use ieee.std_logic_1164.all;

-- For i = 0..15 o = mux2w1b_chip(a[i], b[i], sel)

entity MUX2W16B_CHIP is
  port (
    A   : in    std_logic_vector(15 downto 0);
    B   : in    std_logic_vector(15 downto 0);
    SEL : in    std_logic;
    O   : out   std_logic_vector(15 downto 0)
  );
end entity MUX2W16B_CHIP;

architecture rtl of MUX2W16B_CHIP is

begin

  GEN : for idx in 0 to 15 generate

    U0 : entity work.mux2w1b_chip(rtl)
      port map (
        A   => A(idx),
        B   => B(idx),
        SEL => SEL,
        O   => O(idx)
      );

  end generate GEN;

end architecture rtl;
