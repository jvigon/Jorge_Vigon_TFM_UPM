----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2024 22:02:38
-- Design Name: 
-- Module Name: Neuron_Full_Connected - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


LIBRARY IEEE;library IEEE;
USE IEEE.std_logic_1164.all;use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;
use work.CNN_Package_Second_Convolution.all;--poner para que pille el valor del stride

entity CNN_Filtro_4_Paralelo_2_Capa is
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
end CNN_Filtro_4_Paralelo_2_Capa;

architecture Behavioral of CNN_Filtro_4_Paralelo_2_Capa is

    component One_Filter_Structure_2_Capa
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
         end component;
         
      component POOLING
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Valor_ESTOC_relu_Filtro_0 : in std_logic;
           Valor_ESTOC_relu_Filtro_1 : in std_logic;
           Valor_ESTOC_relu_Filtro_2 : in std_logic;
           Valor_ESTOC_relu_Filtro_3 : in std_logic;
           comienza_relu : in STD_LOGIC;
           Finalizado_relu : in std_logic;
           Valor_final_pool : out STD_LOGIC_VECTOR (7 downto 0);
           Pool_bloque_ready_4: out STD_LOGIC
           );
         end component;
 component ROM_SEC_LAYER_POOL
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_total_Pesos)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
         end component;  
         
signal Finalizado_Relu_0 : std_logic;        
signal comienza_relu_0: std_logic;
signal y_estoc_0 : std_logic;

signal Finalizado_Relu_1 : std_logic;      
signal comienza_relu_1 : std_logic;  
signal y_estoc_1 : std_logic;

signal Finalizado_Relu_2 : std_logic; 
signal comienza_relu_2 : std_logic;       
signal y_estoc_2 : std_logic;

signal Finalizado_Relu_3 : std_logic;  
signal comienza_relu_3 : std_logic;      
signal y_estoc_3 : std_logic;

signal no_use_complete_1,no_use_complete_2,no_use_complete_3: std_logic;

--bram

signal s_valor_peso_sec_pool : STD_LOGIC_VECTOR (7  downto 0);


--multiplexacion
signal address_cnn_0_pool_2,address_cnn_1_pool_2_no_use,address_cnn_2_pool_2_no_use,address_cnn_3_pool_2_no_use: STD_LOGIC_VECTOR((log2c(Dim_total_Pesos)-1) downto 0);

begin

Filtro_CNN_0_P: One_Filter_Structure_2_Capa
    port map (
        Reset => Reset,
        Clk => Clk,
        Valor_inical_ent_fila => (others => '0'),
        Valor_inical_ent_columna => (others => '0'),
        
        comienza_relu=> comienza_relu_0,
        Finalizado_relu => Finalizado_Relu_0,
        y_estoc => y_estoc_0,
        Direccion_to_pool_1 =>Direccion_to_pool_1_0, 
        Valor_pool_1=> X_to_pool_1_procesar_0,
        complete_cycle_next_input=>complete_cycle_next_input_2_capa,
        process_next_input=>process_next_input_2_capa,
        Direccion_pesos_sec_pool=>address_cnn_0_pool_2,
        valor_peso_sec_pool=>s_valor_peso_sec_pool

);

Filtro_CNN_1_P: One_Filter_Structure_2_Capa
    port map (
        Reset => Reset,
        Clk => Clk,
        Valor_inical_ent_fila => (others => '0'),
        Valor_inical_ent_columna => STD_LOGIC_VECTOR(TO_UNSIGNED(stride,4)),
        
        comienza_relu=> comienza_relu_1,
        Finalizado_relu => Finalizado_Relu_1,
        y_estoc => y_estoc_1,
        Direccion_to_pool_1 =>Direccion_to_pool_1_1, 
        Valor_pool_1=> X_to_pool_1_procesar_1,
        complete_cycle_next_input=>no_use_complete_1,
        process_next_input=>process_next_input_2_capa,
         Direccion_pesos_sec_pool=>address_cnn_1_pool_2_no_use,
        valor_peso_sec_pool=>s_valor_peso_sec_pool

);
Filtro_CNN_2_P: One_Filter_Structure_2_Capa
    port map (
        Reset => Reset,
        Clk => Clk,
        Valor_inical_ent_fila => STD_LOGIC_VECTOR(TO_UNSIGNED(stride,4)),
        Valor_inical_ent_columna => (others => '0'),
        
        comienza_relu=> comienza_relu_2,
        Finalizado_relu => Finalizado_Relu_2,
        y_estoc => y_estoc_2,
        Direccion_to_pool_1 =>Direccion_to_pool_1_2, 
        Valor_pool_1=> X_to_pool_1_procesar_2,
        complete_cycle_next_input=>no_use_complete_2,
        process_next_input=>process_next_input_2_capa,
        Direccion_pesos_sec_pool=>address_cnn_2_pool_2_no_use,
        valor_peso_sec_pool=>s_valor_peso_sec_pool

);
Filtro_CNN_3_P: One_Filter_Structure_2_Capa
    port map (
        Reset => Reset,
        Clk => Clk,
        Valor_inical_ent_fila => STD_LOGIC_VECTOR(TO_UNSIGNED(stride,4)),
        Valor_inical_ent_columna => STD_LOGIC_VECTOR(TO_UNSIGNED(stride,4)),
        
        comienza_relu=> comienza_relu_3,
        Finalizado_relu => Finalizado_Relu_3,
        y_estoc => y_estoc_3,
        Direccion_to_pool_1 =>Direccion_to_pool_1_3, 
        Valor_pool_1=> X_to_pool_1_procesar_3,
        complete_cycle_next_input=>no_use_complete_3,
        process_next_input=>process_next_input_2_capa,
        Direccion_pesos_sec_pool=>address_cnn_2_pool_2_no_use,
        valor_peso_sec_pool=>s_valor_peso_sec_pool

);


POOL: POOLING
    port map (
        Reset => Reset,
        Clk => Clk,
        Valor_ESTOC_relu_Filtro_0 => y_estoc_0,
        Valor_ESTOC_relu_Filtro_1 => y_estoc_1,
        Valor_ESTOC_relu_Filtro_2 => y_estoc_2,
        Valor_ESTOC_relu_Filtro_3 => y_estoc_3,
        comienza_relu => comienza_relu_0,
        Finalizado_relu => Finalizado_relu_0,
        Valor_final_pool => Valor_final_pool_4,
        Pool_bloque_ready_4 => Pool_bloque_ready_4
        
);
ROM_PESOS_POOL_2: ROM_SEC_LAYER_POOL
   PORT MAP(
           clk => clk,
           Reset => Reset,
           addra_pool_2 => address_cnn_0_pool_2,
           douta_pool_2 => s_valor_peso_sec_pool
           );
           
end Behavioral;
