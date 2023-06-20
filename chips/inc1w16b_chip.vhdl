library IEEE;
  use ieee.std_logic_1164.all;

-- o = a + 1 where a and o follow 2's complement scheme
-- Overflow is neither detected nor handled

entity INC1W16B_CHIP is
  port (
    A   : in    std_logic_vector(15 downto 0);
    O   : out   std_logic_vector(15 downto 0)
  );
end entity INC1W16B_CHIP;

architecture RTL of INC1W16B_CHIP is

  signal carry : std_logic_vector(15 downto 0);

begin

  U0 : entity work.adder2w16b_chip(rtl)
    port map (
      A => A,
      B => "0000000000000001",
      O => O
    );

end architecture RTL;
