library ieee;
use ieee.std_logic_1164.all;

use work.my_package.all;

entity myxor3 is
    port(a, b, c:in std_logic; x:out std_logic);
end entity myxor3;

architecture struct of myxor3 is
    signal x_i : std_logic;
begin

u0: myxor port map(a, b, x_i);
u1: myxor port map(x_i, c, x);

end architecture struct;