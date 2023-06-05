library ieee;
use ieee.std_logic_1164.all;

entity myxor is
    port(a, b : in std_logic; f : out std_logic);
end entity myxor;

architecture a_myxor of myxor is
begin
    f <= a xor b;
end architecture a_myxor;