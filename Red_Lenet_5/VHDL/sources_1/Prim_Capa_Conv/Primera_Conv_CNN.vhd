

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
use work.CNN_Package_First_Convolution.all;


entity Primera_convolucion is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
          -- Start_g : in STD_LOGIC;
           Pool_1_ready : out STD_LOGIC;
           --RAM
           Direccion_entrada_RAM_0 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Direccion_entrada_RAM_1 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Direccion_entrada_RAM_2 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Direccion_entrada_RAM_3 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Valor_entrada_0 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           Valor_entrada_1 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           Valor_entrada_2 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           Valor_entrada_3 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           complete_cycle_next_input :out STD_LOGIC;
           process_next_input: in STD_LOGIC;---SE HAN cambiado el valor de los 4
           start_addresses: in std_logic;
           
           --PARA POOL 1 A SEGUNDA CAPA
           X_from_pool_1_procesar_0: out STD_LOGIC_VECTOR (7 downto 0);
           X_from_pool_1_procesar_1: out STD_LOGIC_VECTOR (7 downto 0);
           X_from_pool_1_procesar_2: out STD_LOGIC_VECTOR (7 downto 0);
           X_from_pool_1_procesar_3: out STD_LOGIC_VECTOR (7 downto 0);
           Direccion_from_pool_1_0: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);--de 864 12*12*6
           Direccion_from_pool_1_1: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_from_pool_1_2: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_from_pool_1_3: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           
           complete_cycle_next_from_pool_1 :in STD_LOGIC;
           process_next_from_pool_1: out STD_LOGIC---SE HAN cambiado el valor de los 4
           );
end Primera_convolucion;

architecture Behavioral of Primera_convolucion is
component CNN_Filtro_4_Paralelo
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           --Start_g : in STD_LOGIC;
           Valor_final_pool_4 : out STD_LOGIC_VECTOR (7 downto 0);
           Pool_bloque_ready_4: out STD_LOGIC;
           Direccion_entrada_RAM_0 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Direccion_entrada_RAM_1 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Direccion_entrada_RAM_2 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Direccion_entrada_RAM_3 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Valor_entrada_0 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           Valor_entrada_1 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           Valor_entrada_2 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           Valor_entrada_3 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           complete_cycle_next_input :out STD_LOGIC;
           process_next_input: in STD_LOGIC;---SE HAN cambiado el valor de los 4
           start_addresses: in std_logic
           );
         end component;
         
 component Keeping_Pool_1 --recoge lo que llega y lo pasa a las salidas que luego iran a las fully connected
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Pool_bloque_ready_4: in STD_LOGIC;
           Valor_final_pool_4 : in STD_LOGIC_VECTOR (7 downto 0);
           Pooling_ready : out STD_LOGIC;
           
           --PARA POOL 1 A SEGUNDA CAPA
           X_from_pool_1_procesar_0: out STD_LOGIC_VECTOR (7 downto 0);
           X_from_pool_1_procesar_1: out STD_LOGIC_VECTOR (7 downto 0);
           X_from_pool_1_procesar_2: out STD_LOGIC_VECTOR (7 downto 0);
           X_from_pool_1_procesar_3: out STD_LOGIC_VECTOR (7 downto 0);
           Direccion_from_pool_1_0: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);--de 864 12*12*6
           Direccion_from_pool_1_1: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_from_pool_1_2: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_from_pool_1_3: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           
           complete_cycle_next_from_pool_1 :in STD_LOGIC;
           process_next_from_pool_1: out STD_LOGIC---SE HAN cambiado el valor de los 4
           
           );
         end component;    


signal s_valor_final_pool: STD_LOGIC_VECTOR (7 downto 0); 
signal s_Pool_bloque_ready_4 : STD_LOGIC;
        
begin

Filtrado_4_Paralelo_completo: CNN_Filtro_4_Paralelo
    port map (
           Reset => Reset,
           CLK => Clk,
           --Start_g =>  Start_g,
           valor_final_pool_4  => s_valor_final_pool,
           Pool_bloque_ready_4 => s_Pool_bloque_ready_4,
           Direccion_entrada_RAM_0 => Direccion_entrada_RAM_0,
           Direccion_entrada_RAM_1 => Direccion_entrada_RAM_1,
           Direccion_entrada_RAM_2 => Direccion_entrada_RAM_2,
           Direccion_entrada_RAM_3 => Direccion_entrada_RAM_3,
           Valor_entrada_0 => Valor_entrada_0,
           Valor_entrada_1 => Valor_entrada_1,
           Valor_entrada_2=> Valor_entrada_2,
           Valor_entrada_3 => Valor_entrada_3,
           complete_cycle_next_input => complete_cycle_next_input,
           process_next_input=> process_next_input,
           start_addresses=> start_addresses
           );
Pool_1_Result: Keeping_Pool_1
    port map (
           Reset => Reset,
           CLK => Clk,
           Valor_final_pool_4 => s_valor_final_pool,
           Pool_bloque_ready_4 => s_Pool_bloque_ready_4,
           Pooling_ready => Pool_1_ready,
           
           --sacar valores de pool 1
           X_from_pool_1_procesar_0 => X_from_pool_1_procesar_0,
           X_from_pool_1_procesar_1 => X_from_pool_1_procesar_1,
           X_from_pool_1_procesar_2 => X_from_pool_1_procesar_2,
           X_from_pool_1_procesar_3 => X_from_pool_1_procesar_3,
           Direccion_from_pool_1_0 => Direccion_from_pool_1_0,
           Direccion_from_pool_1_1 => Direccion_from_pool_1_1,
           Direccion_from_pool_1_2 => Direccion_from_pool_1_2,
           Direccion_from_pool_1_3 => Direccion_from_pool_1_3,
           
           complete_cycle_next_from_pool_1 => complete_cycle_next_from_pool_1,
           process_next_from_pool_1 => process_next_from_pool_1
           );    

end Behavioral;
