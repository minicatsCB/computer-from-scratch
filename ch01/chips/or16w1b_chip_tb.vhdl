library IEEE;
  use ieee.std_logic_1164.all;

entity OR16W1B_CHIP_TB is
end entity OR16W1B_CHIP_TB;

architecture BEHAVIOR of OR16W1B_CHIP_TB is

  component OR16W1B_CHIP is
    port (
      A : in    std_logic;
      B : in    std_logic;
      C : in    std_logic;
      D : in    std_logic;
      E : in    std_logic;
      F : in    std_logic;
      G : in    std_logic;
      H : in    std_logic;
      I : in    std_logic;
      J : in    std_logic;
      K : in    std_logic;
      L : in    std_logic;
      M : in    std_logic;
      N : in    std_logic;
      P : in    std_logic;
      Q : in    std_logic;
      O : out   std_logic
    );
  end component;

  signal a : std_logic;
  signal b : std_logic;
  signal c : std_logic;
  signal d : std_logic;
  signal e : std_logic;
  signal f : std_logic;
  signal g : std_logic;
  signal h : std_logic;
  signal i : std_logic;
  signal j : std_logic;
  signal k : std_logic;
  signal l : std_logic;
  signal m : std_logic;
  signal n : std_logic;
  signal p : std_logic;
  signal q : std_logic;
  signal o : std_logic;

begin

  DUT : OR16W1B_CHIP
    port map (
      A => a,
      B => b,
      C => c,
      D => d,
      E => e,
      F => f,
      G => g,
      H => h,
      I => i,
      J => j,
      K => k,
      L => l,
      M => m,
      N => n,
      P => p,
      Q => q,
      O => o
    );

  STIMULUS : process is
  begin

    a <= '0';
    b <= '0';
    c <= '0';
    d <= '0';
    e <= '0';
    f <= '0';
    g <= '0';
    h <= '0';
    i <= '0';
    j <= '0';
    k <= '0';
    l <= '0';
    m <= '0';
    n <= '0';
    p <= '0';
    q <= '0';
    wait for 50 ns;

    a <= '1';
    b <= '1';
    c <= '1';
    d <= '1';
    e <= '1';
    f <= '1';
    g <= '1';
    h <= '1';
    i <= '1';
    j <= '1';
    k <= '1';
    l <= '1';
    m <= '1';
    n <= '1';
    p <= '1';
    q <= '1';
    wait for 50 ns;

    a <= '0';
    b <= '1';
    c <= '0';
    d <= '0';
    e <= '0';
    f <= '0';
    g <= '0';
    h <= '0';
    i <= '0';
    j <= '0';
    k <= '0';
    l <= '0';
    m <= '0';
    n <= '0';
    p <= '0';
    q <= '0';
    wait for 50 ns;

    a <= '0';
    b <= '1';
    c <= '0';
    d <= '0';
    e <= '0';
    f <= '0';
    g <= '0';
    h <= '0';
    i <= '0';
    j <= '0';
    k <= '0';
    l <= '1';
    m <= '0';
    n <= '0';
    p <= '0';
    q <= '0';
    wait for 50 ns;

    assert true
      report "Tests finished";
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
