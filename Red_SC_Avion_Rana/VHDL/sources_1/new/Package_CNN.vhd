library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package CNN_Package is

    
    constant Dim_total_Entrada : integer := 3072; 
--    constant Dim_total_Entrada : integer := 147; 
    constant Dim_total_Pesos : integer := 150; 
    constant Dim_entrada : integer := 32; 
    --constant Dim_entrada : integer := 7;
    constant Dim_depth_entrada : integer := 3; 
    constant Dim_filtro : integer := 5; 
    constant Dim_total_filtro : integer := 75; --esto es 5x5x3 sin contar los diferentes filtros
    constant Numero_filtros : integer := 2; 
    constant Padding : integer := 0; 
    constant Stride : integer := 9; 
    constant Dim_pool : integer := 2; 
    
    type Pool_1 is array (0 to (Dim_pool-1), 0 to (Dim_pool-1), 0 to (Numero_filtros-1)) of std_logic_vector(7 downto 0);
    
    constant Division_valores : integer := 4;--valores pueden llegar de 2 y -2 a 4 -4
    function log2c(n: integer) return integer;
-------DE IRENE
--	CONSTANT address_limit : INTEGER := 728; --Size of the input image     CAMBIO RESPECTO A IRENE
--	CONSTANT input_row_size : INTEGER := 28; --Size of the input image
--	CONSTANT input_column_size : INTEGER := 28; --Size of the input image
	CONSTANT address_limit : INTEGER := 3072; --Size of the input image     CAMBIO RESPECTO A IRENE
	CONSTANT input_row_size : INTEGER := 32; --Size of the input image
	CONSTANT input_column_size : INTEGER := 32; --Size of the input image
--   CONSTANT address_limit : INTEGER := 147; --Size of the input image     CAMBIO RESPECTO A IRENE
--    CONSTANT input_row_size : INTEGER := 7; --Size of the input image
--	CONSTANT input_column_size : INTEGER := 7; --Size of the input image
	--CONSTANT n_extra_bits : INTEGER := 3; --Number of extra bits used for precision in the MAAC operations
	--================ CNN PARAMETERS ================-
	--CONSTANT layers_cnn : INTEGER := 3; --Number of layers of the convolutional part of the network
	--LAYER 1

	CONSTANT input_sizeL1 : INTEGER := 8; --Number of bits of the input data
	--CONSTANT number_of_layers1 : INTEGER := 1; --Number of layers of the input matrix   CAMBIO RESPECTO A IREEENNEE
	--CONSTANT number_of_inputs : INTEGER := input_column_size * input_row_size * number_of_layers1; --Number of inputs of the layer
	CONSTANT number_of_layers1 : INTEGER := 3; --Number of layers of the input matrix   CAMBIO RESPECTO A IREEENNEE
	CONSTANT number_of_inputs : INTEGER := input_column_size * input_row_size * number_of_layers1; --Number of inputs of the layer
	TYPE vector_data_in IS ARRAY (NATURAL RANGE <>) OF STD_LOGIC_VECTOR(input_sizeL1 - 1 DOWNTO 0);
	TYPE vector_address IS ARRAY (NATURAL RANGE <>) OF STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 DOWNTO 0);
	
	--para el cnn global
	 constant Rango_Normalizacion_FC : integer := 4;
end package CNN_Package;

package body CNN_Package is

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

end package body CNN_Package;