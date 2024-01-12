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

  DUT : entity work.or16w1b_chip(rtl)
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
    type pattern_type is record
      a : std_logic;
      b   : std_logic;
      c   : std_logic;
      d   : std_logic;
      e   : std_logic;
      f   : std_logic;
      g   : std_logic;
      h   : std_logic;
      i   : std_logic;
      j   : std_logic;
      k   : std_logic;
      l   : std_logic;
      m   : std_logic;
      n   : std_logic;
      p   : std_logic;
      q   : std_logic;
      o   : std_logic;
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      1 => ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
      2 => ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
      3 => ('0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
      4 => ('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1'),
      5 => ('0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1')
    );
  begin

    for idx in patterns'range loop
      a  <= patterns(idx).a;
      b  <= patterns(idx).b;
      c  <= patterns(idx).c;
      d  <= patterns(idx).d;
      e  <= patterns(idx).e;
      f  <= patterns(idx).f;
      g  <= patterns(idx).g;
      h  <= patterns(idx).h;
      i  <= patterns(idx).i;
      j  <= patterns(idx).j;
      k  <= patterns(idx).k;
      l  <= patterns(idx).l;
      m  <= patterns(idx).m;
      n  <= patterns(idx).n;
      p  <= patterns(idx).p;
      q  <= patterns(idx).q;
      wait for 50 ns;
      assert o = patterns(idx).o
      report "[Error] o[" & integer'image(idx) & "] >>> Expected: " & std_logic'image(patterns(idx).o) & " / Received: " & std_logic'image(o)
        severity failure;

    end loop;

    assert false
      report "Tests finished"
      severity note;
    wait;

  end process STIMULUS;

end architecture BEHAVIOR;
