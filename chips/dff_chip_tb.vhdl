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

  constant clockfrequency : integer := 100e6; -- 100 MHz
  constant clockperiod    : time    := 1000 ms / clockfrequency;

  signal clk              : std_logic := '0';
  signal data             : std_logic;
  signal q                : std_logic;
  signal nq               : std_logic;

begin

  DUT : DFF_CHIP
    port map (
      CLK  => clk,
      DATA => data,
      Q    => q,
      NQ   => nq
    );

  -- Process for generating the clock
  clk <= not clk after clockperiod / 2;

  -- Testbench sequence
  STIMULUS : process is
  begin

    -- Take the DUT out of reset
    data <= '1';
    wait for 20 ns;
    data <= '0';
    wait for 22 ns;
    data <= '0';
    wait for 6 ns;
    data <= '1';
    wait for 20 ns;

    -- Reset the DUT
    data <= '0';

    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
