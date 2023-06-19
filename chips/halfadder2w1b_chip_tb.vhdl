library IEEE;
  use ieee.std_logic_1164.all;

entity HALFADDER2W1B_CHIP_TB is
end entity HALFADDER2W1B_CHIP_TB;

architecture BEHAVIOR of HALFADDER2W1B_CHIP_TB is

  component HALFADDER2W1B_CHIP is
    port (
      A       : in    std_logic;
      B       : in    std_logic;
      SUM     : out   std_logic;
      CARRY   : out   std_logic
    );
  end component;

  signal a       : std_logic;
  signal b       : std_logic;
  signal sum     : std_logic;
  signal carry   : std_logic;

begin

  DUT : HALFADDER2W1B_CHIP
    port map (
      A     => a,
      B     => b,
      SUM   => sum,
      CARRY => carry
    );

    STIMULUS : process is
    begin
  
      a   <= '0';
      b   <= '0';
      wait for 50 ns;
      assert sum = '0' report "Expected: sum = 0 | Received: sum = other result" severity failure;
      assert carry = '0' report "Expected: carry = 0 | Received: carry = other result" severity failure;
  
      a   <= '0';
      b   <= '1';
      wait for 50 ns;
      assert sum = '1' report "Expected: sum = 1 | Received: sum = other result" severity failure;
      assert carry = '0' report "Expected: carry = 0 | Received: carry = other result" severity failure;
  
      a   <= '1';
      b   <= '0';
      wait for 50 ns;
      assert sum = '1' report "Expected: sum = 1 | Received: sum = other result" severity failure;
      assert carry = '0' report "Expected: carry = 0 | Received: carry = other result" severity failure;
  
      a   <= '1';
      b   <= '1';
      wait for 50 ns;
      assert sum = '0' report "Expected: sum = 0 | Received: sum = other result" severity failure;
      assert carry = '1' report "Expected: carry = 1 | Received: carry = other result" severity failure;
  
      assert true
        report "Tests finished";
      wait;
  
    end process STIMULUS;
  
  end architecture BEHAVIOR;