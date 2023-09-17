library IEEE;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity DEMUX4W1B_CHIP_TB is
end entity DEMUX4W1B_CHIP_TB;

architecture BEHAVIOR of DEMUX4W1B_CHIP_TB is

  component DEMUX4W1B_CHIP is
    port (
      DATA : in    std_logic;
      SEL  : in    std_logic_vector(1 downto 0);
      O1   : out   std_logic;
      O2   : out   std_logic;
      O3   : out   std_logic;
      O4   : out   std_logic
    );
  end component;

  signal data : std_logic;
  signal sel  : std_logic_vector(1 downto 0);
  signal o1   : std_logic;
  signal o2   : std_logic;
  signal o3   : std_logic;
  signal o4   : std_logic;

begin

  DUT : DEMUX4W1B_CHIP
    port map (
      DATA => data,
      SEL  => sel,
      O1   => o1,
      O2   => o2,
      O3   => o3,
      O4   => o4
    );


    STIMULUS : process is
      variable count : std_logic_vector(1 downto 0);

      type pattern_type is record
        data : std_logic;
        sel  : std_logic_vector(1 downto 0);
        o1   : std_logic;
        o2   : std_logic;
        o3   : std_logic;
        o4   : std_logic;
      end record pattern_type;
  
      type pattern_array is array (natural range <>) of pattern_type;
  
      constant patterns : pattern_array :=
      (
        1 => ('0', "00", '0', '0', '0', '0'),
        2 => ('0', "01", '0', '0', '0', '0'),
        3 => ('0', "10", '0', '0', '0', '0'),
        4 => ('0', "11", '0', '0', '0', '0'),
        5 => ('1', "00", '1', '0', '0', '0'),
        6 => ('1', "01", '0', '1', '0', '0'),
        7 => ('1', "10", '0', '0', '1', '0'),
        8 => ('1', "11", '0', '0', '0', '1')
      );
  
    begin
  
      for i in patterns'range loop
        for idx in 0 to 3 loop

          -- Convert decimal integer idx to its binary representation
          count := std_logic_vector(to_unsigned(idx, 2));

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
        end loop;
  
      end loop;
  
      assert false
        report "Tests finished"
        severity note;
      wait;
  
    end process STIMULUS;

end architecture BEHAVIOR;
