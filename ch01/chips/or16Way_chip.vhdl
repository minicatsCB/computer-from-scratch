library IEEE;
use IEEE.std_logic_1164.all;

-- If a = b = c = .. = p = 0 then o = 0 else o = 1
entity or16Way_chip is
    port (
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        d: in std_logic;
        e: in std_logic;
        f: in std_logic;
        g: in std_logic;
        h: in std_logic;
        i: in std_logic;
        j: in std_logic;
        k: in std_logic;
        l: in std_logic;
        m: in std_logic;
        n: in std_logic;
        p: in std_logic;
        q: in std_logic;
        o: out std_logic
    );
end or16Way_chip;

architecture parts of or16Way_chip is
    signal a_o, b_o, c_o, d_o, e_o, f_o, g_o, h_o : std_logic := '0';
    signal i_o, j_o, k_o, l_o : std_logic := '0';
    signal m_o, n_o : std_logic := '0';
begin
    u0: entity work.or2w1b_chip(parts) port map(a, b, a_o);
    u1: entity work.or2w1b_chip(parts) port map(c, d, b_o);
    u2: entity work.or2w1b_chip(parts) port map(e, f, c_o);
    u3: entity work.or2w1b_chip(parts) port map(g, h, d_o);
    u4: entity work.or2w1b_chip(parts) port map(i, j, e_o);
    u5: entity work.or2w1b_chip(parts) port map(k, l, f_o);
    u6: entity work.or2w1b_chip(parts) port map(m, n, g_o);
    u7: entity work.or2w1b_chip(parts) port map(p, q, h_o);

    u8: entity work.or2w1b_chip(parts) port map(a_o, b_o, i_o);
    u9: entity work.or2w1b_chip(parts) port map(c_o, d_o, j_o);
    u10: entity work.or2w1b_chip(parts) port map(e_o, f_o, k_o);
    u11: entity work.or2w1b_chip(parts) port map(g_o, h_o, l_o);

    u12: entity work.or2w1b_chip(parts) port map(i_o, j_o, m_o);
    u13: entity work.or2w1b_chip(parts) port map(k_o, l_o, n_o);

    u14: entity work.or2w1b_chip(parts) port map(m_o, n_o, o);
end parts;