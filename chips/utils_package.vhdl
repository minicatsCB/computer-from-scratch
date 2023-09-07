library ieee;
  use ieee.std_logic_1164.all;

-- Package Declaration Section
package utils_package is

  function to_string (vec: std_logic_vector) return string;

end package utils_package;

-- Package Body Section

package body utils_package is

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

end package body utils_package;
