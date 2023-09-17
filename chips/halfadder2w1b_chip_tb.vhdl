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

      type pattern_type is record
        a       : std_logic;
        b       : std_logic;
        sum     : std_logic;
        carry   : std_logic;
      end record pattern_type;
  
      type pattern_array is array (natural range <>) of pattern_type;
  
      constant patterns : pattern_array :=
      (
        1 => ('0', '0', '0', '0'),
        2 => ('0', '1', '1', '0'),
        3 => ('1', '0', '1', '0'),
        4 => ('1', '1', '0', '1')
      );
  
    begin
  
      for i in patterns'range loop
        a  <= patterns(i).a;
        b  <= patterns(i).b;
        wait for 50 ns;
        assert sum = patterns(i).sum
          report "[Error] sum[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).sum) & " / Received: " & std_logic'image(sum)
          severity failure;

        assert carry = patterns(i).carry
          report "[Error] carry[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).carry) & " / Received: " & std_logic'image(carry)
          severity failure;
  
      end loop;
  
      assert false
        report "Tests finished"
        severity note;
      wait;
  
    end process STIMULUS;

end architecture BEHAVIOR;
