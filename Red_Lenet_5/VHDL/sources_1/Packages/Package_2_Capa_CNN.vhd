library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package CNN_Package_Second_Convolution is

    
    constant Dim_total_Entrada : integer := 864; --12*12*6
    constant Dim_total_Pesos : integer := 2400; --16 filtros de 5x5x6
    constant Dim_entrada : integer := 12; 
    constant Dim_depth_entrada : integer := 6; 
    constant Dim_filtro : integer := 5; 
    constant Dim_total_filtro : integer := 150; --esto es 5x5x6= sin contar los diferentes filtros
    constant Numero_filtros : integer := 16; 
    constant Padding : integer := 0; 
    constant Stride : integer := 1; 
    constant Dim_pool : integer := 4; 
    
    
    type Pool_2 is array (0 to (Dim_pool-1), 0 to (Dim_pool-1), 0 to (Numero_filtros-1)) of std_logic_vector(7 downto 0);
    
    constant Division_valores : integer := 2;--NORMALIZAR POR 2
    function log2c(n: integer) return integer;

    constant Size_address_to_pool_1 : integer := log2c(Dim_depth_entrada) + 2*log2c(Dim_entrada);
end package CNN_Package_Second_Convolution;

package body CNN_Package_Second_Convolution is

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

end package body CNN_Package_Second_Convolution;