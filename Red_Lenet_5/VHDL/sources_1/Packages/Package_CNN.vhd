library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package CNN_Package_First_Convolution is
    
    constant Maximo_numero_Detect : integer := 9;
    
    constant Dim_total_Entrada : integer := 784; 
    constant Dim_total_Pesos : integer := 150; --6 filtros de 5x5
    constant Dim_entrada : integer := 28; 
    constant Dim_depth_entrada : integer := 1; 
    constant Dim_filtro : integer := 5; 
    constant Dim_total_filtro : integer := 25; --esto es 5x5x1 sin contar los diferentes filtros
    constant Numero_filtros : integer := 6; 
    constant Padding : integer := 0; 
    constant Stride : integer := 1; 
    constant Dim_pool : integer := 12; 
  
    type Pool_1 is array (0 to (Dim_pool-1), 0 to (Dim_pool-1), 0 to (Numero_filtros-1)) of std_logic_vector(7 downto 0);
    
    constant Division_valores : integer := 2;--valores pueden llegar de 2 y -2 a 4 -4
    function log2c(n: integer) return integer;


        --para el global
    constant Rango_Normalizacion_FC_final : integer := 2;
--    constant Dim_fila_pool_1 : integer := 12; 
--    constant Dim_depth_pool_1 : integer := 6; 
     constant Size_address_to_pool_1 : integer := log2c(Numero_filtros) + 2*log2c(Dim_pool);
end package CNN_Package_First_Convolution;

package body CNN_Package_First_Convolution is

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

end package body CNN_Package_First_Convolution;