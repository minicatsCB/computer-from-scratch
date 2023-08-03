library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity DFF_CHIP is
  port (
    CLK    : in    std_logic;
    DATA   : in    std_logic;
    Q      : out   std_logic;
    NQ     : out   std_logic
  );
end entity DFF_CHIP;

architecture RTL of DFF_CHIP is

begin

  -- Flip-flop with synchronized reset
  CLOCKED : process (CLK) is
  begin

    if rising_edge(CLK) then
      if (DATA = '0') then
        Q  <= '0';
        NQ <= '1';
      else
        Q  <= '1';
        NQ <= '0';
      end if;
    end if;

  end process CLOCKED;

end architecture RTL;
