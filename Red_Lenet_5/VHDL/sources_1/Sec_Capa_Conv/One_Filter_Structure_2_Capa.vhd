
LIBRARY IEEE;library IEEE;
USE IEEE.std_logic_1164.all;use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
use work.CNN_Package_Second_Convolution.all;

entity One_Filter_Structure_2_Capa is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Valor_inical_ent_fila : in STD_LOGIC_VECTOR(3 downto 0);
           Valor_inical_ent_columna : in STD_LOGIC_VECTOR(3 downto 0);
           
           comienza_relu : out STD_LOGIC;
           Finalizado_relu : out STD_LOGIC;
           y_estoc : out STD_LOGIC;
           Direccion_to_pool_1 : out STD_LOGIC_VECTOR((Size_address_to_pool_1-1) downto 0);
            Valor_pool_1 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
            complete_cycle_next_input :out STD_LOGIC;
            process_next_input: in STD_LOGIC;
            --bram
            Direccion_pesos_sec_pool : out STD_LOGIC_VECTOR ((log2c(Dim_total_Pesos)-1)  downto 0);
            valor_peso_sec_pool: in STD_LOGIC_VECTOR (7  downto 0)
           );
end One_Filter_Structure_2_Capa;

architecture Behavioral of One_Filter_Structure_2_Capa is
    component Complete_Conexions_First_LFSDR_2_Capa
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Valor_inical_ent_fila : in STD_LOGIC_VECTOR(3 downto 0);
           Valor_inical_ent_columna : in STD_LOGIC_VECTOR(3 downto 0);
           Finalizado_relu : in STD_LOGIC;--INDICA QEU LA RELU HA TERMINADO Y POR TNATO EL POOL TAMBIEN(para desplazar)
           New_value: out STD_LOGIC; --para que ponga a cero el contador de xnor
           complete_cycle: out STD_LOGIC;--para que sume
           Finalizado_filtro: out STD_LOGIC;--para que el valor pase a la relu
           X_sc : out STD_LOGIC;
           W_sc : out STD_LOGIC;
           --añado en salida
           filtro : out STD_LOGIC_VECTOR ( (log2c(Numero_filtros) - 1) downto 0); --inidco cuando se utiliza el primer filtro o segundo para que el siguiente 
           --bloque use el bias correcto
            Direccion_to_pool_1 : out STD_LOGIC_VECTOR((Size_address_to_pool_1-1) downto 0);
            Valor_pool_1 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           process_next_input: in STD_LOGIC;
           --bram
            Direccion_pesos_sec_pool : out STD_LOGIC_VECTOR ((log2c(Dim_total_Pesos)-1)  downto 0);
            valor_peso_sec_pool: in STD_LOGIC_VECTOR (7  downto 0)
           
           );
         end component;

     
      component Add_Multiplication_2_layer
        Port ( CLK : in STD_LOGIC;
                   Reset : in STD_LOGIC;
                   x_sc : in STD_LOGIC;
                   w_sc : in STD_LOGIC;
                   Start : in STD_LOGIC;
                   entrada_complete : in STD_LOGIC;
                   Finalizado_entradas : in STD_LOGIC;
                   r_suma : out STD_LOGIC_VECTOR (7 downto 0);
                   filtro : in STD_LOGIC_VECTOR ( (log2c(Numero_filtros) - 1) downto 0)
                   );
       end component;
       
      component Activation_Layer
         Port ( CLK : in STD_LOGIC;
                   Reset : in STD_LOGIC;
                   Finalizado_entradas : in STD_LOGIC;
                   r_suma : in STD_LOGIC_VECTOR (7 downto 0);
                   comienza_relu : out STD_LOGIC;
                   Finalizado_relu : out STD_LOGIC;
                   y_estoc : out STD_LOGIC
                   );
       end component;

attribute keep : boolean;       
signal output_LFSR_X  :   std_logic; 
signal output_LFSR_W  :   std_logic; 
signal Nuevo_Dato : std_logic;
signal complete_cycle_X  :   std_logic;
signal Suma_Finalizada : std_logic;

signal r_suma  :   std_logic_vector (7 downto 0);   


--ANADO
signal s_filtro : STD_LOGIC_VECTOR ( (log2c(Numero_filtros) - 1) downto 0);
signal s_finalizado_relu : std_logic;
begin

First_LFSDRs: Complete_Conexions_First_LFSDR_2_Capa
    port map (
        Reset => Reset,
        Clk => Clk,
        valor_inical_ent_fila => valor_inical_ent_fila,
        valor_inical_ent_columna => valor_inical_ent_columna,
        Finalizado_relu => s_finalizado_relu,
        New_value => Nuevo_Dato,
        complete_cycle => complete_cycle_X,
        Finalizado_filtro => Suma_Finalizada,
        x_sc => output_LFSR_X,
        w_sc => output_LFSR_W,
        filtro =>s_filtro,
        Direccion_to_pool_1 =>Direccion_to_pool_1,
        Valor_pool_1=>Valor_pool_1,
        process_next_input=>process_next_input,
        Direccion_pesos_sec_pool=>Direccion_pesos_sec_pool,
        valor_peso_sec_pool=>valor_peso_sec_pool
        );


        
   ADD_MUL: Add_Multiplication_2_layer
   port map (
        Reset => Reset,
        Clk => Clk,
        x_sc => output_LFSR_X,
        w_sc => output_LFSR_W,
        Start => Nuevo_Dato,
        entrada_complete => process_next_input,
        Finalizado_entradas=> Suma_Finalizada,
        r_suma=> r_suma,
         filtro =>s_filtro
         );
        
   ACT_LAYER: Activation_Layer--mismo que antes no tiene ninguna package ni nada
   port map (
        Reset => Reset,
        Clk => Clk,
        Finalizado_entradas => Suma_Finalizada,
        r_suma => r_suma,
        comienza_relu => comienza_relu,
        Finalizado_relu=> s_finalizado_relu,
        y_estoc=> y_estoc
           );

Finalizado_relu <= s_finalizado_relu;
complete_cycle_next_input<= complete_cycle_X;
end Behavioral;
