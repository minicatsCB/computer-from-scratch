library ieee;
  use ieee.std_logic_1164.all;

entity HEARTBEAT is
  port (
    LEVEL : out   std_logic
  );
end entity HEARTBEAT;

architecture RTL of HEARTBEAT is

  constant clk_period : time := 10 ns;

begin

  -- Clock process definition
  CLK_PROCESS : process is
  begin

    LEVEL <= '0';
    wait for clk_period / 2;
    LEVEL <= '1';
    wait for clk_period / 2;

  end process CLK_PROCESS;

end architecture RTL;
