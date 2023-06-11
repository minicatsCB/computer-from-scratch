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
  signal o1   : std_logic;
  signal o2   : std_logic;
  signal o3   : std_logic;
  signal o4   : std_logic;
  signal sel  : std_logic_vector(1 downto 0));

begin

  DUT : DEMUX4W1B_CHIP
    port map (
DATA => data,
 SEL => sel,
 O1 => o1,
 O2 => o2,
 O3 => o3,
 O4 => o4
    );

  STIMULUS : process is

    variable count : std_logic_vector(1 downto 0);

  begin

    for idx in 0 to 3 loop

      -- Convert decimal integer idx to its binary representation
      count := std_logic_vector(to_unsigned(idx, 2));

      data <= '0';
      sel  <= count;
      wait for 50 ns;

      data <= '1';
      sel  <= count;
      wait for 50 ns;

    end loop;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
