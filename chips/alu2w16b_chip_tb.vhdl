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
  begin

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '1';
    nx <= '0';
    zy <= '1';
    ny <= '0';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;
    assert zr = '1'
      report "Expected: zr = 1 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '1';
    nx <= '1';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000000001"
      report "Expected: o = 0000000000000001 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '1';
    nx <= '1';
    zy <= '1';
    ny <= '0';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '0';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;
    assert zr = '1'
      report "Expected: zr = 1 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '0';
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '0';
    no <= '1';
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;
    assert zr = '1'
      report "Expected: zr = 1 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;
    assert zr = '1'
      report "Expected: zr = 1 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000000001"
      report "Expected: o = 0000000000000001 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;
    assert zr = '1'
      report "Expected: zr = 1 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;
    assert zr = '1'
      report "Expected: zr = 1 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "1111111111111110"
      report "Expected: o = 1111111111111110 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '0';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000000001"
      report "Expected: o = 0000000000000001 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '0';
    zy <= '0';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '0';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;
    assert zr = '1'
      report "Expected: zr = 1 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000000000";
    y  <= "1111111111111111";
    zx <= '0';
    nx <= '1';
    zy <= '0';
    ny <= '1';
    f  <= '0';
    no <= '1';
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '1';
    nx <= '0';
    zy <= '1';
    ny <= '0';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000000000"
      report "Expected: o = 0000000000000000 | Received: o = other result"
      severity failure;
    assert zr = '1'
      report "Expected: zr = 1 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '1';
    nx <= '1';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000000001"
      report "Expected: o = 0000000000000001 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '1';
    nx <= '1';
    zy <= '1';
    ny <= '0';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "1111111111111111"
      report "Expected: o = 1111111111111111 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '0';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000010001"
      report "Expected: o = 0000000000010001 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000000011"
      report "Expected: o = 0000000000000011 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '0';
    no <= '1';
    wait for 50 ns;
    assert o = "1111111111101110"
      report "Expected: o = 1111111111101110 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '1';
    wait for 50 ns;
    assert o = "1111111111111100"
      report "Expected: o = 1111111111111100  | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "1111111111101111"
      report "Expected: o = 1111111111101111 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "1111111111111101"
      report "Expected: o = 1111111111111101 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "1111111111101111"
      report "Expected: o = 00001111111111101111000000010010 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000000100"
      report "Expected: o = 0000000000000100 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '0';
    zy <= '1';
    ny <= '1';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000010000"
      report "Expected: o = 0000000000010000 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '1';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000000010"
      report "Expected: o = 0000000000000010 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '0';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000010100"
      report "Expected: o = 0000000000010100 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '1';
    zy <= '0';
    ny <= '0';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000001110"
      report "Expected: o = 0000000000001110 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '0';
    zy <= '0';
    ny <= '1';
    f  <= '1';
    no <= '1';
    wait for 50 ns;
    assert o = "1111111111110010"
      report "Expected: o = 1111111111110010 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '1'
      report "Expected: ng = 1 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '0';
    zy <= '0';
    ny <= '0';
    f  <= '0';
    no <= '0';
    wait for 50 ns;
    assert o = "0000000000000001"
      report "Expected: o = 0000000000000001 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    x  <= "0000000000010001";
    y  <= "0000000000000011";
    zx <= '0';
    nx <= '1';
    zy <= '0';
    ny <= '1';
    f  <= '0';
    no <= '1';
    wait for 50 ns;
    assert o = "0000000000010011"
      report "Expected: o = 0000000000010011 | Received: o = other result"
      severity failure;
    assert zr = '0'
      report "Expected: zr = 0 | Received: zr = other result"
      severity failure;
    assert ng = '0'
      report "Expected: ng = 0 | Received: ng = other result"
      severity failure;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
