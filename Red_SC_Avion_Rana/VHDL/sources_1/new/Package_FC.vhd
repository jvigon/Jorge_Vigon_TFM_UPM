LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
package FC_Package is

    
    constant Dim_pesos_FC : integer := 8; 
    constant Rango_Normalizacion_FC : integer := 4;
    constant Rango_Sigmoid : integer := 4;
    constant Umbral_Sigmoid : integer := 512;--128*Rango_Sigmoid
    constant BIAS_FC : STD_LOGIC_VECTOR := STD_LOGIC_VECTOR(TO_UNSIGNED(167,8));
    constant Factor_De_Correction: integer :=20; 
    function log2c(n: integer) return integer;

end package FC_Package;

package body FC_Package is

    function log2c(n: integer) return integer is
        variable m, p: integer := 0;
    begin
        m := 0;
        p := 1;
        while p < n loop
            m := m + 1;
            p := p * 2;
        end loop;
        return m;
    end function log2c;

end package body FC_Package;
