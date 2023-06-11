library IEEE;
  use ieee.std_logic_1164.all;

entity MUX2W1B_CHIP_TB is
end entity MUX2W1B_CHIP_TB;

architecture BEHAVIOR of MUX2W1B_CHIP_TB is

  component MUX2W1B_CHIP is
    port (
      A   : in    std_logic;
      B   : in    std_logic;
      SEL : in    std_logic;
      O   : out   std_logic
    );
  end component;

  signal a   : std_logic;
  signal b   : std_logic;
  signal sel : std_logic;
  signal o   : std_logic;

begin

  DUT : MUX2W1B_CHIP
    port map (
      A   => a,
      B   => b,
      SEL => sel,
      O   => o
    );

  STIMULUS : process is
  begin

    a   <= '0';
    b   <= '0';
    sel <= '0';
    wait for 50 ns;

    a   <= '0';
    b   <= '0';
    sel <= '1';
    wait for 50 ns;

    a   <= '0';
    b   <= '1';
    sel <= '0';
    wait for 50 ns;

    a   <= '0';
    b   <= '1';
    sel <= '1';
    wait for 50 ns;

    a   <= '1';
    b   <= '0';
    sel <= '0';
    wait for 50 ns;

    a   <= '1';
    b   <= '0';
    sel <= '1';
    wait for 50 ns;

    a   <= '1';
    b   <= '1';
    sel <= '0';
    wait for 50 ns;

    a   <= '1';
    b   <= '1';
    sel <= '1';
    wait for 50 ns;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
