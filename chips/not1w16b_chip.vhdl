library IEEE;
  use ieee.std_logic_1164.all;

-- For i = 0..15 o = not1w16b_chip(a[i])

entity NOT1W16B_CHIP is
  port (
    A : in    std_logic_vector(15 downto 0);
    O : out   std_logic_vector(15 downto 0)
  );
end entity NOT1W16B_CHIP;

architecture RTL of NOT1W16B_CHIP is

begin

  GEN : for idx in 0 to 15 generate

    U0 : entity work.not1w1b_chip(rtl)
      port map (
        A => A(idx),
        O => O(idx)
      );

  end generate GEN;

end architecture RTL;
