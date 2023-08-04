library IEEE;
  use ieee.std_logic_1164.all;

entity ALU2W16B_CHIP_TB is
end entity ALU2W16B_CHIP_TB;

architecture BEHAVIOR of ALU2W16B_CHIP_TB is

  component ALU2W16B_CHIP is
    port (
      X   : in    std_logic_vector(15 downto 0);
      Y   : in    std_logic_vector(15 downto 0);
      ZX  : in    std_logic;
      NX  : in    std_logic;
      ZY  : in    std_logic;
      NY  : in    std_logic;
      F   : in    std_logic;
      NO  : in    std_logic;
      O   : out   std_logic_vector(15 downto 0);
      ZR  : out   std_logic;
      NG  : out   std_logic
    );
  end component;

  signal x  : std_logic_vector(15 downto 0);
  signal y  : std_logic_vector(15 downto 0);
  signal zx : std_logic;
  signal nx : std_logic;
  signal zy : std_logic;
  signal ny : std_logic;
  signal f  : std_logic;
  signal no : std_logic;
  signal o  : std_logic_vector(15 downto 0);
  signal zr : std_logic;
  signal ng : std_logic;

  function to_string (vec: std_logic_vector) return string is

    variable result : string (1 to vec'length) := (others => NUL);
    variable j      : integer                  := 1;

  begin

    for i in vec'range loop

      result(j) := std_logic'image(vec(i))(2);
      j         := j + 1;

    end loop;

    return result;

  end function;

begin

  DUT : ALU2W16B_CHIP
    port map (
      X  => x,
      Y  => y,
      ZX => zx,
      NX => nx,
      ZY => zy,
      NY => ny,
      F  => f,
      NO => no,
      O  => o,
      ZR => zr,
      NG => ng
    );

  STIMULUS : process is

    type pattern_type is record
      x  : std_logic_vector(15 downto 0);
      y  : std_logic_vector(15 downto 0);
      zx : std_logic;
      nx : std_logic;
      zy : std_logic;
      ny : std_logic;
      f  : std_logic;
      no : std_logic;
      o  : std_logic_vector(15 downto 0);
      zr : std_logic;
      ng : std_logic;
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ("0000000000000000", "1111111111111111", '1', '0', '1', '0', '1', '0', "0000000000000000", '1', '0'),
      2 => ("0000000000000000", "1111111111111111", '1', '1', '1', '1', '1', '1', "0000000000000001", '0', '0'),
      3 => ("0000000000000000", "1111111111111111", '1', '1', '1', '0', '1', '0', "1111111111111111", '0', '1'),
      4 => ("0000000000000000", "1111111111111111", '0', '0', '1', '1', '0', '0', "0000000000000000", '1', '0'),
      5 => ("0000000000000000", "1111111111111111", '1', '1', '0', '0', '0', '0', "1111111111111111", '0', '1'),
      6 => ("0000000000000000", "1111111111111111", '0', '0', '1', '1', '0', '1', "1111111111111111", '0', '1'),
      7 => ("0000000000000000", "1111111111111111", '1', '1', '0', '0', '0', '1', "0000000000000000", '1', '0'),
      8 => ("0000000000000000", "1111111111111111", '0', '0', '1', '1', '1', '1', "0000000000000000", '1', '0'),
      9 => ("0000000000000000", "1111111111111111", '1', '1', '0', '0', '1', '1', "0000000000000001", '0', '0'),
      10 => ("0000000000000000", "1111111111111111", '0', '1', '1', '1', '1', '1', "0000000000000001", '0', '0'),
      11 => ("0000000000000000", "1111111111111111", '1', '1', '0', '1', '1', '1', "0000000000000000", '1', '0'),
      12 => ("0000000000000000", "1111111111111111", '0', '0', '1', '1', '1', '0', "1111111111111111", '0', '1'),
      13 => ("0000000000000000", "1111111111111111", '1', '1', '0', '0', '1', '0', "1111111111111110", '0', '1'),
      14 => ("0000000000000000", "1111111111111111", '0', '0', '0', '0', '1', '0', "1111111111111111", '0', '1'),
      15 => ("0000000000000000", "1111111111111111", '0', '1', '0', '0', '1', '1', "0000000000000001", '0', '0'),
      16 => ("0000000000000000", "1111111111111111", '0', '0', '0', '1', '1', '1', "1111111111111111", '0', '1'),
      17 => ("0000000000000000", "1111111111111111", '0', '0', '0', '0', '0', '0', "0000000000000000", '1', '0'),
      18 => ("0000000000000000", "1111111111111111", '0', '1', '0', '1', '0', '1', "1111111111111111", '0', '1'),
      19 => ("0000000000010001", "0000000000000011", '1', '0', '1', '0', '1', '0', "0000000000000000", '1', '0'),
      20 => ("0000000000010001", "0000000000000011", '1', '1', '1', '1', '1', '1', "0000000000000001", '0', '0'),
      21 => ("0000000000010001", "0000000000000011", '1', '1', '1', '0', '1', '0', "1111111111111111", '0', '1'),
      22 => ("0000000000010001", "0000000000000011", '0', '0', '1', '1', '0', '0', "0000000000010001", '0', '0'),
      23 => ("0000000000010001", "0000000000000011", '1', '1', '0', '0', '0', '0', "0000000000000011", '0', '0'),
      24 => ("0000000000010001", "0000000000000011", '0', '0', '1', '1', '0', '1', "1111111111101110", '0', '1'),
      25 => ("0000000000010001", "0000000000000011", '1', '1', '0', '0', '0', '1', "1111111111111100", '0', '1'),
      26 => ("0000000000010001", "0000000000000011", '0', '0', '1', '1', '1', '1', "1111111111101111", '0', '1'),
      27 => ("0000000000010001", "0000000000000011", '1', '1', '0', '0', '1', '1', "1111111111111101", '0', '1'),
      28 => ("0000000000010001", "0000000000000011", '0', '1', '1', '1', '1', '1', "0000000000010010", '0', '0'),
      29 => ("0000000000010001", "0000000000000011", '1', '1', '0', '1', '1', '1', "0000000000000100", '0', '0'),
      30 => ("0000000000010001", "0000000000000011", '0', '0', '1', '1', '1', '0', "0000000000010000", '0', '0'),
      31 => ("0000000000010001", "0000000000000011", '1', '1', '0', '0', '1', '0', "0000000000000010", '0', '0'),
      32 => ("0000000000010001", "0000000000000011", '0', '0', '0', '0', '1', '0', "0000000000010100", '0', '0'),
      33 => ("0000000000010001", "0000000000000011", '0', '1', '0', '0', '1', '1', "0000000000001110", '0', '0'),
      34 => ("0000000000010001", "0000000000000011", '0', '0', '0', '1', '1', '1', "1111111111110010", '0', '1'),
      35 => ("0000000000010001", "0000000000000011", '0', '0', '0', '0', '0', '0', "0000000000000001", '0', '0'),
      36 => ("0000000000010001", "0000000000000011", '0', '1', '0', '1', '0', '1', "0000000000010011", '0', '0')
    );

  begin

    --  Check each pattern.
    for i in patterns'range loop

      --  Set the inputs.
      x  <= patterns(i).x;
      y  <= patterns(i).y;
      zx <= patterns(i).zx;
      nx <= patterns(i).nx;
      zy <= patterns(i).zy;
      ny <= patterns(i).ny;
      f  <= patterns(i).f;
      no <= patterns(i).no;
      --  Wait for the results.
      wait for 50 ns;
      --  Check the outputs.
      assert o = patterns(i).o
        report "[Error] o[" & integer'image(i) & "] >>> Expected: " & to_string(patterns(i).o) & " / Received: " & to_string(o)
        severity failure;
      assert zr = patterns(i).zr
        report "[Error] zr[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).zr) & " / Received: " & std_logic'image(zr)
        severity failure;
      assert ng = patterns(i).ng
        report "[Error] ng[" & integer'image(i) & "] >>> Expected: " & std_logic'image(patterns(i).ng) & " / Received: " & std_logic'image(ng)
        severity failure;

    end loop;

    assert false
      report "end of test"
      severity note;
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
