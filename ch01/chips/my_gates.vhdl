library ieee;
use ieee.std_logic_1164.all;

package my_package is
    component myxor is
        port(a, b : in std_logic; f : out std_logic);
    end component myxor;
    component not_chip is
        port (
            a: in std_logic;
            o: out std_logic
        );
    end component not_chip;
end package my_package;