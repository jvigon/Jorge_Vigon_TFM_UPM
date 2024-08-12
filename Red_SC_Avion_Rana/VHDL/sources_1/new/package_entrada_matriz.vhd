library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package MatrixTypes is
    type matrix_array is array(0 to 31, 0 to 31, 0 to 2) of integer range 0 to 255;
end package MatrixTypes;