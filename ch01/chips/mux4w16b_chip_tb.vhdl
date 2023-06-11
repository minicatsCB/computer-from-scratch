library IEEE;
  use ieee.std_logic_1164.all;

entity MUX4W16B_CHIP_TB is
end entity MUX4W16B_CHIP_TB;

architecture BEHAVIOR of MUX4W16B_CHIP_TB is

  component MUX4W16B_CHIP is
    port (
      A   : in    std_logic_vector(15 downto 0);
      B   : in    std_logic_vector(15 downto 0);
      C   : in    std_logic_vector(15 downto 0);
      D   : in    std_logic_vector(15 downto 0);
      SEL : in    std_logic_vector(1 downto 0);
      O   : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a   : std_logic_vector(15 downto 0);
  signal b   : std_logic_vector(15 downto 0);
  signal c   : std_logic_vector(15 downto 0);
  signal d   : std_logic_vector(15 downto 0);
  signal o   : std_logic_vector(15 downto 0);
  signal sel : std_logic_vector(1 downto 0);

begin

  DUT : MUX4W16B_CHIP
    port map (
      A   => a,
      B   => b,
      C   => c,
      D   => d,
      SEL => sel,
      O   => o
    );

  STIMULUS : process is
  begin

    a   <= "0000000000000000";
    b   <= "1111111111111111";
    c   <= "1111111100000000";
    d   <= "0000000011111111";
    sel <= "00";
    wait for 50 ns;

    a   <= "0000000000000000";
    b   <= "1111111111111111";
    c   <= "1111111100000000";
    d   <= "0000000011111111";
    sel <= "01";
    wait for 50 ns;

    a   <= "0000000000000000";
    b   <= "1111111111111111";
    c   <= "1111111100000000";
    d   <= "0000000011111111";
    sel <= "10";
    wait for 50 ns;

    a   <= "0000000000000000";
    b   <= "1111111111111111";
    c   <= "1111111100000000";
    d   <= "0000000011111111";
    sel <= "11";
    wait for 50 ns;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
