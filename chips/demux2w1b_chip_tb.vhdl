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
    type pattern_type is record
      data : std_logic;
      sel  : std_logic;
      o1   : std_logic;
      o2   : std_logic;
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ('0', '0', '0', '0'),
      2 => ('0', '1', '0', '0'),
      3 => ('1', '0', '1', '0'),
      4 => ('1', '1', '0', '1')
    );

  begin

    for i in patterns'range loop
      sel  <= patterns(i).sel;
      data  <= patterns(i).data;
      wait for 50 ns;
      assert o1 = patterns(i).o1
        report "[Error] o1[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o1) & " / Received: " & std_logic'image(o1)
        severity failure;
      assert o2 = patterns(i).o2
        report "[Error] o2[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).o2) & " / Received: " & std_logic'image(o2)
        severity failure;

    end loop;

    assert false
      report "Tests finished"
      severity note;
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
