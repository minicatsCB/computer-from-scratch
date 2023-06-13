library IEEE;
  use ieee.std_logic_1164.all;

entity MUX2W16B_CHIP_TB is
end entity MUX2W16B_CHIP_TB;

architecture BEHAVIOR of MUX2W16B_CHIP_TB is

  component MUX2W16B_CHIP is
    port (
      A   : in    std_logic_vector(15 downto 0);
      B   : in    std_logic_vector(15 downto 0);
      SEL : in    std_logic;
      O   : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a   : std_logic_vector(15 downto 0);
  signal b   : std_logic_vector(15 downto 0);
  signal o   : std_logic_vector(15 downto 0);
  signal sel : std_logic;

begin

  DUT : MUX2W16B_CHIP
    port map (
      A   => a,
      B   => b,
      SEL => sel,
      O   => o
    );

  STIMULUS : process is
  begin

    a   <= "0000000000000000";
    b   <= "1111111111111111";
    sel <= '0';
    wait for 50 ns;
    assert o = "0000000000000000" report "Expected: o = 0000000000000000 | Received: o = other result" severity failure;

    a   <= "0000000000000000";
    b   <= "1111111111111111";
    sel <= '1';
    wait for 50 ns;
    assert o = "1111111111111111" report "Expected: o = 0000000000000000 | Received: o = other result" severity failure;

    a   <= "0001110001010100";
    b   <= "0001110101011001";
    sel <= '0';
    wait for 50 ns;
    assert o = "0001110001010100" report "Expected: o = 0000000000000000 | Received: o = other result" severity failure;

    a   <= "0001110001010100";
    b   <= "0001110101011001";
    sel <= '1';
    wait for 50 ns;
    assert o = "0001110101011001" report "Expected: o = 0000000000000000 | Received: o = other result" severity failure;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
