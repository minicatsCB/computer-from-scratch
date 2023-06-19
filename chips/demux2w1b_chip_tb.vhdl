library IEEE;
  use ieee.std_logic_1164.all;

entity DEMUX2W1B_CHIP_TB is
end entity DEMUX2W1B_CHIP_TB;

architecture BEHAVIOR of DEMUX2W1B_CHIP_TB is

  component DEMUX2W1B_CHIP is
    port (
      DATA : in    std_logic;
      SEL  : in    std_logic;
      O1   : out   std_logic;
      O2   : out   std_logic
    );
  end component;

  signal data : std_logic;
  signal sel  : std_logic;
  signal o1   : std_logic;
  signal o2   : std_logic;

begin

  DUT : DEMUX2W1B_CHIP
    port map (
      DATA => data,
      SEL  => sel,
      O1   => o1,
      O2   => o2
    );

  STIMULUS : process is
  begin

    data <= '0';
    sel  <= '0';
    wait for 50 ns;
    assert o1 = '0' report "Expected: o1 = 0 | Received: o1 = other result" severity failure;
    assert o2 = '0'report "Expected: o2 = 0 | Received: o2 = other result" severity failure;

    data <= '0';
    sel  <= '1';
    wait for 50 ns;
    assert o1 = '0' report "Expected: o1 = 0 | Received: o1 = other result" severity failure;
    assert o2 = '0'report "Expected: o2 = 0 | Received: o2 = other result" severity failure;
    
    data <= '1';
    sel  <= '0';
    wait for 50 ns;
    assert o1 = '1' report "Expected: o1 = 1 | Received: o1 = other result" severity failure;
    assert o2 = '0'report "Expected: o2 = 0 | Received: o2 = other result" severity failure;

    data <= '1';
    sel  <= '1';
    wait for 50 ns;
    assert o1 = '0' report "Expected: o1 = 0 | Received: o1 = other result" severity failure;
    assert o2 = '1'report "Expected: o2 = 1 | Received: o2 = other result" severity failure;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
