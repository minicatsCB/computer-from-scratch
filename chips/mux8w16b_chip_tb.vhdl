library IEEE;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity MUX8W16B_CHIP_TB is
end entity MUX8W16B_CHIP_TB;

architecture BEHAVIOR of MUX8W16B_CHIP_TB is

  component MUX8W16B_CHIP is
    port (
      A   : in    std_logic_vector(15 downto 0);
      B   : in    std_logic_vector(15 downto 0);
      C   : in    std_logic_vector(15 downto 0);
      D   : in    std_logic_vector(15 downto 0);
      E   : in    std_logic_vector(15 downto 0);
      F   : in    std_logic_vector(15 downto 0);
      G   : in    std_logic_vector(15 downto 0);
      H   : in    std_logic_vector(15 downto 0);
      SEL : in    std_logic_vector(2 downto 0);
      O   : out   std_logic_vector(15 downto 0)
    );
  end component;

  signal a   : std_logic_vector(15 downto 0);
  signal b   : std_logic_vector(15 downto 0);
  signal c   : std_logic_vector(15 downto 0);
  signal d   : std_logic_vector(15 downto 0);
  signal e   : std_logic_vector(15 downto 0);
  signal f   : std_logic_vector(15 downto 0);
  signal g   : std_logic_vector(15 downto 0);
  signal h   : std_logic_vector(15 downto 0);
  signal o   : std_logic_vector(15 downto 0);
  signal sel : std_logic_vector(2 downto 0);

begin

  DUT : MUX8W16B_CHIP
    port map (
      A   => a,
      B   => b,
      C   => c,
      D   => d,
      E   => e,
      F   => f,
      G   => g,
      H   => h,
      SEL => sel,
      O   => o
    );

  STIMULUS : process is

    variable count : std_logic_vector(2 downto 0);

  begin

    for idx in 0 to 7 loop

      -- Convert decimal integer idx to its binary representation
      count := std_logic_vector(to_unsigned(idx, 3));

      a   <= "0000000000000000";
      b   <= "1111111111111111";
      c   <= "1111111100000000";
      d   <= "0000000011111111";
      e   <= "1010101010101010";
      f   <= "1111000011110000";
      g   <= "0101010101010101";
      h   <= "0000111100001111";
      sel <= count;
      wait for 50 ns;

      if (sel = "000") then
        assert o = a
          report "Expected: o = a | Received: o = other result"
          severity failure;
      elsif (sel = "001") then
        assert o = b
          report "Expected: o = b | Received: o = other result"
          severity failure;
      elsif (sel = "010") then
        assert o = c
          report "Expected: o = c | Received: o = other result"
          severity failure;
      elsif (sel = "011") then
        assert o = d
          report "Expected: o = d | Received: o = other result"
          severity failure;
      elsif (sel = "100") then
        assert o = e
          report "Expected: o = e | Received: o = other result"
          severity failure;
      elsif (sel = "101") then
        assert o = f
          report "Expected: o = f | Received: o = other result"
          severity failure;
      elsif (sel = "110") then
        assert o = g
          report "Expected: o = g | Received: o = other result"
          severity failure;
      elsif (sel = "111") then
        assert o = h
          report "Expected: o = h | Received: o = other result"
          severity failure;
      end if;

    end loop;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
