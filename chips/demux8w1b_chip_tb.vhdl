library IEEE;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity DEMUX8W1B_CHIP_TB is
end entity DEMUX8W1B_CHIP_TB;

architecture BEHAVIOR of DEMUX8W1B_CHIP_TB is

  component DEMUX8W1B_CHIP is
    port (
      DATA : in    std_logic;
      SEL  : in    std_logic_vector(2 downto 0);
      O1   : out   std_logic;
      O2   : out   std_logic;
      O3   : out   std_logic;
      O4   : out   std_logic;
      O5   : out   std_logic;
      O6   : out   std_logic;
      O7   : out   std_logic;
      O8   : out   std_logic
    );
  end component;

  signal data : std_logic;
  signal o1   : std_logic;
  signal o2   : std_logic;
  signal o3   : std_logic;
  signal o4   : std_logic;
  signal o5   : std_logic;
  signal o6   : std_logic;
  signal o7   : std_logic;
  signal o8   : std_logic;
  signal sel  : std_logic_vector(2 downto 0);

begin

  DUT : DEMUX8W1B_CHIP
    port map (
      DATA => data,
      SEL  => sel,
      O1   => o1,
      O2   => o2,
      O3   => o3,
      O4   => o4,
      O5   => o5,
      O6   => o6,
      O7   => o7,
      O8   => o8
    );

  STIMULUS : process is

    variable count : std_logic_vector(2 downto 0);

  begin

    for idx in 0 to 7 loop

      -- Convert decimal integer idx to its binary representation
      count := std_logic_vector(to_unsigned(idx, 3));

      data <= '0';
      sel  <= count;
      wait for 50 ns;
      assert o1 = '0'
        report "Expected: o1 = 0 | Received: o1 = other result"
        severity failure;
      assert o2 = '0'
        report "Expected: o2 = 0 | Received: o2 = other result"
        severity failure;
      assert o3 = '0'
        report "Expected: o3 = 0 | Received: o3 = other result"
        severity failure;
      assert o4 = '0'
        report "Expected: o4 = 0 | Received: o4 = other result"
        severity failure;
      assert o5 = '0'
        report "Expected: o5 = 0 | Received: o5 = other result"
        severity failure;
      assert o6 = '0'
        report "Expected: o6 = 0 | Received: o6 = other result"
        severity failure;
      assert o7 = '0'
        report "Expected: o7 = 0 | Received: o7 = other result"
        severity failure;
      assert o8 = '0'
        report "Expected: o8 = 0 | Received: o8 = other result"
        severity failure;

      data <= '1';
      sel  <= count;
      wait for 50 ns;

      if (sel = "000") then
        assert o1 = '1'
          report "Expected: o1 = 1 | Received: o1 = other result"
          severity failure;
        assert o2 = '0'
          report "Expected: o2 = 0 | Received: o2 = other result"
          severity failure;
        assert o3 = '0'
          report "Expected: o3 = 0 | Received: o3 = other result"
          severity failure;
        assert o4 = '0'
          report "Expected: o4 = 0 | Received: o4 = other result"
          severity failure;
        assert o5 = '0'
          report "Expected: o5 = 0 | Received: o5 = other result"
          severity failure;
        assert o6 = '0'
          report "Expected: o6 = 0 | Received: o6 = other result"
          severity failure;
        assert o7 = '0'
          report "Expected: o7 = 0 | Received: o7 = other result"
          severity failure;
        assert o8 = '0'
          report "Expected: o8 = 0 | Received: o8 = other result"
          severity failure;
      elsif (sel = "001") then
        assert o1 = '0'
          report "Expected: o1 = 1 | Received: o1 = other result"
          severity failure;
        assert o2 = '1'
          report "Expected: o2 = 1 | Received: o2 = other result"
          severity failure;
        assert o3 = '0'
          report "Expected: o3 = 0 | Received: o3 = other result"
          severity failure;
        assert o4 = '0'
          report "Expected: o4 = 0 | Received: o4 = other result"
          severity failure;
        assert o5 = '0'
          report "Expected: o5 = 0 | Received: o5 = other result"
          severity failure;
        assert o6 = '0'
          report "Expected: o6 = 0 | Received: o6 = other result"
          severity failure;
        assert o7 = '0'
          report "Expected: o7 = 0 | Received: o7 = other result"
          severity failure;
        assert o8 = '0'
          report "Expected: o8 = 0 | Received: o8 = other result"
          severity failure;
      elsif (sel = "010") then
        assert o1 = '0'
          report "Expected: o1 = 0 | Received: o1 = other result"
          severity failure;
        assert o2 = '0'
          report "Expected: o2 = 0 | Received: o2 = other result"
          severity failure;
        assert o3 = '1'
          report "Expected: o3 = 1 | Received: o3 = other result"
          severity failure;
        assert o4 = '0'
          report "Expected: o4 = 0 | Received: o4 = other result"
          severity failure;
        assert o5 = '0'
          report "Expected: o5 = 0 | Received: o5 = other result"
          severity failure;
        assert o6 = '0'
          report "Expected: o6 = 0 | Received: o6 = other result"
          severity failure;
        assert o7 = '0'
          report "Expected: o7 = 0 | Received: o7 = other result"
          severity failure;
        assert o8 = '0'
          report "Expected: o8 = 0 | Received: o8 = other result"
          severity failure;
      elsif (sel = "011") then
        assert o1 = '0'
          report "Expected: o1 = 0 | Received: o1 = other result"
          severity failure;
        assert o2 = '0'
          report "Expected: o2 = 0 | Received: o2 = other result"
          severity failure;
        assert o3 = '0'
          report "Expected: o3 = 0 | Received: o3 = other result"
          severity failure;
        assert o4 = '1'
          report "Expected: o4 = 1 | Received: o4 = other result"
          severity failure;
        assert o5 = '0'
          report "Expected: o5 = 0 | Received: o5 = other result"
          severity failure;
        assert o6 = '0'
          report "Expected: o6 = 0 | Received: o6 = other result"
          severity failure;
        assert o7 = '0'
          report "Expected: o7 = 0 | Received: o7 = other result"
          severity failure;
        assert o8 = '0'
          report "Expected: o8 = 0 | Received: o8 = other result"
          severity failure;
      elsif (sel = "100") then
        assert o1 = '0'
          report "Expected: o1 = 0 | Received: o1 = other result"
          severity failure;
        assert o2 = '0'
          report "Expected: o2 = 0 | Received: o2 = other result"
          severity failure;
        assert o3 = '0'
          report "Expected: o3 = 0 | Received: o3 = other result"
          severity failure;
        assert o4 = '0'
          report "Expected: o4 = 0 | Received: o4 = other result"
          severity failure;
        assert o5 = '1'
          report "Expected: o5 = 1 | Received: o5 = other result"
          severity failure;
        assert o6 = '0'
          report "Expected: o6 = 0 | Received: o6 = other result"
          severity failure;
        assert o7 = '0'
          report "Expected: o7 = 0 | Received: o7 = other result"
          severity failure;
        assert o8 = '0'
          report "Expected: o8 = 0 | Received: o8 = other result"
          severity failure;
      elsif (sel = "101") then
        assert o1 = '0'
          report "Expected: o1 = 0 | Received: o1 = other result"
          severity failure;
        assert o2 = '0'
          report "Expected: o2 = 0 | Received: o2 = other result"
          severity failure;
        assert o3 = '0'
          report "Expected: o3 = 0 | Received: o3 = other result"
          severity failure;
        assert o4 = '0'
          report "Expected: o4 = 0 | Received: o4 = other result"
          severity failure;
        assert o5 = '0'
          report "Expected: o5 = 0 | Received: o5 = other result"
          severity failure;
        assert o6 = '1'
          report "Expected: o6 = 1 | Received: o6 = other result"
          severity failure;
        assert o7 = '0'
          report "Expected: o7 = 0 | Received: o7 = other result"
          severity failure;
        assert o8 = '0'
          report "Expected: o8 = 0 | Received: o8 = other result"
          severity failure;
      elsif (sel = "110") then
        assert o1 = '0'
          report "Expected: o1 = 0 | Received: o1 = other result"
          severity failure;
        assert o2 = '0'
          report "Expected: o2 = 0 | Received: o2 = other result"
          severity failure;
        assert o3 = '0'
          report "Expected: o3 = 0 | Received: o3 = other result"
          severity failure;
        assert o4 = '0'
          report "Expected: o4 = 0 | Received: o4 = other result"
          severity failure;
        assert o5 = '0'
          report "Expected: o5 = 0 | Received: o5 = other result"
          severity failure;
        assert o6 = '0'
          report "Expected: o6 = 0 | Received: o6 = other result"
          severity failure;
        assert o7 = '1'
          report "Expected: o7 = 1 | Received: o7 = other result"
          severity failure;
        assert o8 = '0'
          report "Expected: o8 = 0 | Received: o8 = other result"
          severity failure;
      elsif (sel = "111") then
        assert o1 = '0'
          report "Expected: o1 = 0 | Received: o1 = other result"
          severity failure;
        assert o2 = '0'
          report "Expected: o2 = 0 | Received: o2 = other result"
          severity failure;
        assert o3 = '0'
          report "Expected: o3 = 0 | Received: o3 = other result"
          severity failure;
        assert o4 = '0'
          report "Expected: o4 = 0 | Received: o4 = other result"
          severity failure;
        assert o5 = '0'
          report "Expected: o5 = 0 | Received: o5 = other result"
          severity failure;
        assert o6 = '0'
          report "Expected: o6 = 0 | Received: o6 = other result"
          severity failure;
        assert o7 = '0'
          report "Expected: o7 = 0 | Received: o7 = other result"
          severity failure;
        assert o8 = '1'
          report "Expected: o8 = 1 | Received: o8 = other result"
          severity failure;
      end if;

    end loop;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
