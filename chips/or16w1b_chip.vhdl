library IEEE;
  use ieee.std_logic_1164.all;

-- If a = b = c = .. = p = 0 then o = 0 else o = 1

entity OR16W1B_CHIP is
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
end entity OR16W1B_CHIP;

architecture RTL of OR16W1B_CHIP is

  signal a_o      : std_logic;
  signal b_o      : std_logic;
  signal c_o      : std_logic;
  signal d_o      : std_logic;
  signal e_o      : std_logic;
  signal f_o      : std_logic;
  signal g_o      : std_logic;
  signal h_o      : std_logic;
  signal i_o      : std_logic;
  signal j_o      : std_logic;
  signal k_o      : std_logic;
  signal l_o      : std_logic;
  signal m_o, n_o : std_logic;

begin

  U0 : entity work.or2w1b_chip(rtl)
    port map (
      A => A,
      B => B,
      O => a_o
    );

  U1 : entity work.or2w1b_chip(rtl)
    port map (
      A => C,
      B => D,
      O => b_o
    );

  U2 : entity work.or2w1b_chip(rtl)
    port map (
      A => E,
      B => F,
      O => c_o
    );

  U3 : entity work.or2w1b_chip(rtl)
    port map (
      A => G,
      B => H,
      O => d_o
    );

  U4 : entity work.or2w1b_chip(rtl)
    port map (
      A => I,
      B => J,
      O => e_o
    );

  U5 : entity work.or2w1b_chip(rtl)
    port map (
      A => K,
      B => L,
      O => f_o
    );

  U6 : entity work.or2w1b_chip(rtl)
    port map (
      A => M,
      B => N,
      O => g_o
    );

  U7 : entity work.or2w1b_chip(rtl)
    port map (
      A => P,
      B => Q,
      O => h_o
    );

  U8 : entity work.or2w1b_chip(rtl)
    port map (
      A => a_o,
      B => b_o,
      O => i_o
    );

  U9 : entity work.or2w1b_chip(rtl)
    port map (
      A => c_o,
      B => d_o,
      O => j_o
    );

  U10 : entity work.or2w1b_chip(rtl)
    port map (
      A => e_o,
      B => f_o,
      O => k_o
    );

  U11 : entity work.or2w1b_chip(rtl)
    port map (
      A => g_o,
      B => h_o,
      O => l_o
    );

  U12 : entity work.or2w1b_chip(rtl)
    port map (
      A => i_o,
      B => j_o,
      O => m_o
    );

  U13 : entity work.or2w1b_chip(rtl)
    port map (
      A => k_o,
      B => l_o,
      O => n_o
    );

  U14 : entity work.or2w1b_chip(rtl)
    port map (
      A => m_o,
      B => n_o,
      O => O
    );

end architecture RTL;
