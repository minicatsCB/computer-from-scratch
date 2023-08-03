library ieee;
  use ieee.std_logic_1164.all;

entity HEARTBEAT is
  port (
    ORIG_CLK : out   std_logic
  );
end entity HEARTBEAT;

architecture RTL of HEARTBEAT is

  constant clk_period : time := 10 ns;

begin

  -- Clock process definition
  CLK_PROCESS : process is
  begin

    ORIG_CLK <= '0';
    wait for clk_period / 2;
    ORIG_CLK <= '1';
    wait for clk_period / 2;

  end process CLK_PROCESS;

end architecture RTL;
