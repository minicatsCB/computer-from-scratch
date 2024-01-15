library IEEE;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity DFF_CHIP_TB is
end entity DFF_CHIP_TB;

architecture BEHAVIOR of DFF_CHIP_TB is

  component DFF_CHIP is
    port (
      CLK    : in    std_logic;
      DATA   : in    std_logic;
      Q      : out   std_logic;
      NQ     : out   std_logic
    );
  end component;

  signal clk              : std_logic;
  signal data             : std_logic;
  signal q                : std_logic;
  signal nq               : std_logic;

begin

  DUT : entity work.DFF_CHIP(rtl)
    port map (
      CLK  => clk,
      DATA => data,
      Q    => q,
      NQ   => nq
    );

  MASTER_CLK : entity work.HEARTBEAT(RTL)
    port map (LEVEL => clk);

  -- Testbench sequence
  STIMULUS : process is
  begin

    -- Take the DUT out of reset
    data <= '1';
    wait for 20 ns;
    assert q = '1' severity failure;
    assert nq = '0' severity failure;

    data <= '0';
    wait for 22 ns;
    assert q = '0' severity failure;
    assert nq = '1' severity failure;

    data <= '0';
    wait for 6 ns;
    assert q = '0' severity failure;
    assert nq = '1' severity failure;

    data <= '1';
    wait for 20 ns;
    assert q = '1' severity failure;
    assert nq = '0' severity failure;

    -- Reset the DUT
    data <= '0';
    assert q = '1' severity failure;

    assert false
      report "Tests finished"
      severity note;
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
