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
  signal sel  : std_logic_vector(2 downto 0);
  signal o1   : std_logic;
  signal o2   : std_logic;
  signal o3   : std_logic;
  signal o4   : std_logic;
  signal o5   : std_logic;
  signal o6   : std_logic;
  signal o7   : std_logic;
  signal o8   : std_logic;

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

      type pattern_type is record
        data : std_logic;
        sel  : std_logic_vector(2 downto 0);
        o1   : std_logic;
        o2   : std_logic;
        o3   : std_logic;
        o4   : std_logic;
        o5   : std_logic;
        o6   : std_logic;
        o7   : std_logic;
        o8   : std_logic;
      end record pattern_type;
  
      type pattern_array is array (natural range <>) of pattern_type;
  
      constant patterns : pattern_array :=
      (
        1 => ('0', "000", '0', '0', '0', '0', '0', '0', '0', '0'),
        2 => ('0', "001", '0', '0', '0', '0', '0', '0', '0', '0'),
        3 => ('0', "010", '0', '0', '0', '0', '0', '0', '0', '0'),
        4 => ('0', "011", '0', '0', '0', '0', '0', '0', '0', '0'),
        5 => ('0', "100", '0', '0', '0', '0', '0', '0', '0', '0'),
        6 => ('0', "101", '0', '0', '0', '0', '0', '0', '0', '0'),
        7 => ('0', "110", '0', '0', '0', '0', '0', '0', '0', '0'),
        8 => ('0', "111", '0', '0', '0', '0', '0', '0', '0', '0'),
        9 => ('1', "000", '1', '0', '0', '0', '0', '0', '0', '0'),
        10 => ('1', "001", '0', '1', '0', '0', '0', '0', '0', '0'),
        11 => ('1', "010", '0', '0', '1', '0', '0', '0', '0', '0'),
        12 => ('1', "011", '0', '0', '0', '1', '0', '0', '0', '0'),
        13 => ('1', "100", '0', '0', '0', '0', '1', '0', '0', '0'),
        14 => ('1', "101", '0', '0', '0', '0', '0', '1', '0', '0'),
        15 => ('1', "110", '0', '0', '0', '0', '0', '0', '1', '0'),
        16 => ('1', "111", '0', '0', '0', '0', '0', '0', '0', '1')
      );
  
    begin
  
      for i in patterns'range loop
        for idx in 0 to 7 loop

          -- Convert decimal integer idx to its binary representation
          count := std_logic_vector(to_unsigned(idx, 3));

          data  <= patterns(i).data;
          sel  <= patterns(i).sel;
          wait for 50 ns;
          
          assert o1 = patterns(i).o1
            report "[Error] o1[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o1) & " / Received: " & std_logic'image(o1)
            severity failure;

          assert o2 = patterns(i).o2
            report "[Error] o2[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o2) & " / Received: " & std_logic'image(o2)
            severity failure;

          assert o3 = patterns(i).o3
            report "[Error] o3[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o3) & " / Received: " & std_logic'image(o3)
            severity failure;

          assert o4 = patterns(i).o4
            report "[Error] o4[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o4) & " / Received: " & std_logic'image(o4)
            severity failure;

          assert o5 = patterns(i).o5
            report "[Error] o5[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o5) & " / Received: " & std_logic'image(o5)
            severity failure;

          assert o6 = patterns(i).o6
            report "[Error] o6[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o6) & " / Received: " & std_logic'image(o6)
            severity failure;

          assert o7 = patterns(i).o7
            report "[Error] o7[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o7) & " / Received: " & std_logic'image(o7)
            severity failure;

          assert o8 = patterns(i).o8
            report "[Error] o8[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o8) & " / Received: " & std_logic'image(o8)
            severity failure;
        end loop;
  
      end loop;
  
      assert false
        report "Tests finished"
        severity note;
      wait;
  
    end process STIMULUS;

end architecture BEHAVIOR;
