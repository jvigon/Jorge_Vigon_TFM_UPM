

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.CNN_Package_Second_Convolution.all;

entity Segunda_convolucion is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_to_pool_1_procesar_0: in STD_LOGIC_VECTOR (7 downto 0);
           X_to_pool_1_procesar_1: in STD_LOGIC_VECTOR (7 downto 0);
           X_to_pool_1_procesar_2: in STD_LOGIC_VECTOR (7 downto 0);
           X_to_pool_1_procesar_3: in STD_LOGIC_VECTOR (7 downto 0);
           Direccion_to_pool_1_0: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);--de 864 12*12*6
           Direccion_to_pool_1_1: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_to_pool_1_2: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_to_pool_1_3: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           complete_cycle_next_input_2_capa :out STD_LOGIC;
           process_next_input_2_capa: in STD_LOGIC;---SE HAN cambiado el valor de los 4
           
           --esto fc
           Nueva_entrada_solicitud_from_fc_120: in STD_LOGIC;
           X_pass_to_fc_120: out STD_LOGIC_VECTOR (7 downto 0);
           Pool_2_is_ready : out STD_LOGIC);

end Segunda_convolucion;

architecture Behavioral of Segunda_convolucion is
component CNN_Filtro_4_Paralelo_2_capa
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           --Start_g : in STD_LOGIC;
            Valor_final_pool_4 : out STD_LOGIC_VECTOR (7 downto 0);
           Pool_bloque_ready_4: out STD_LOGIC;
           X_to_pool_1_procesar_0: in STD_LOGIC_VECTOR (7 downto 0);
           X_to_pool_1_procesar_1: in STD_LOGIC_VECTOR (7 downto 0);
           X_to_pool_1_procesar_2: in STD_LOGIC_VECTOR (7 downto 0);
           X_to_pool_1_procesar_3: in STD_LOGIC_VECTOR (7 downto 0);
           Direccion_to_pool_1_0: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);--de 864 12*12*6
           Direccion_to_pool_1_1: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_to_pool_1_2: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_to_pool_1_3: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           complete_cycle_next_input_2_capa :out STD_LOGIC;
           process_next_input_2_capa: in STD_LOGIC---SE HAN cambiado el valor de los 4
           );
         end component;
         
 component Keeping_Pool_2 --recoge lo que llega y lo pasa a las salidas que luego iran a las fully connected
 Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Pool_bloque_ready_4: in STD_LOGIC;
           Valor_final_pool_4 : in STD_LOGIC_VECTOR (7 downto 0);
           Nueva_entrada_solicitud: in STD_LOGIC;
           X_pasar_siguiente_capa: out STD_LOGIC_VECTOR (7 downto 0);
           Pooling_ready : out STD_LOGIC
           );
         end component;    


signal s_valor_final_pool: STD_LOGIC_VECTOR (7 downto 0); 
signal s_Pool_bloque_ready_4 : STD_LOGIC;

begin

Filtrado_4_Paralelo_completo_2_Capa: CNN_Filtro_4_Paralelo_2_capa
    port map (
           Reset => Reset,
           CLK => Clk,
           valor_final_pool_4  => s_valor_final_pool,
           Pool_bloque_ready_4 => s_Pool_bloque_ready_4,
           X_to_pool_1_procesar_0=> X_to_pool_1_procesar_0,
           X_to_pool_1_procesar_1=> X_to_pool_1_procesar_1,
           X_to_pool_1_procesar_2=> X_to_pool_1_procesar_2,
           X_to_pool_1_procesar_3=> X_to_pool_1_procesar_3,
           Direccion_to_pool_1_0=>Direccion_to_pool_1_0,
           Direccion_to_pool_1_1=>Direccion_to_pool_1_1,
           Direccion_to_pool_1_2=>Direccion_to_pool_1_2,
           Direccion_to_pool_1_3=>Direccion_to_pool_1_3,
           complete_cycle_next_input_2_capa=> complete_cycle_next_input_2_capa,
           process_next_input_2_capa=>process_next_input_2_capa
           );
Pool_2_Result: Keeping_Pool_2
    port map (
           Reset => Reset,
           CLK => Clk,
           Valor_final_pool_4 => s_valor_final_pool,
           Pool_bloque_ready_4 => s_Pool_bloque_ready_4,
           Nueva_entrada_solicitud =>Nueva_entrada_solicitud_from_fc_120,
           X_pasar_siguiente_capa =>X_pass_to_fc_120,
           Pooling_ready => Pool_2_is_ready
           );    

end Behavioral;
