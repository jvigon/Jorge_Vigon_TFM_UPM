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
use work.CNN_Package.all;--poner para que pille el valor del stride

entity CNN_Filtro_4_Paralelo is
         Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g : in STD_LOGIC;
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
end CNN_Filtro_4_Paralelo;

architecture Behavioral of CNN_Filtro_4_Paralelo is

    component One_Filter_Structure
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g : in STD_LOGIC;
           Valor_inical_ent_fila : in integer;
           Valor_inical_ent_columna : in integer;
           
           comienza_relu : out STD_LOGIC;
           Finalizado_relu : out STD_LOGIC;
           y_estoc : out STD_LOGIC;
           Direccion_entrada_RAM : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
            Valor_entrada : in STD_LOGIC_VECTOR(7 DOWNTO 0);
            complete_cycle_next_input :out STD_LOGIC;
            process_next_input: in STD_LOGIC;
            start_addresses: in std_logic
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

--signal direccion_1, direccion_2, direccion_3 :  STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
--signal Valor_entrada_1,Valor_entrada_2,Valor_entrada_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal no_use_complete_1,no_use_complete_2,no_use_complete_3: std_logic;
begin

Filtro_CNN_0_P: One_Filter_Structure
    port map (
        Reset => Reset,
        Clk => Clk,
        Start_g => Start_g,
        Valor_inical_ent_fila => 0,
        Valor_inical_ent_columna => 0,
        
        comienza_relu=> comienza_relu_0,
        Finalizado_relu => Finalizado_Relu_0,
        y_estoc => y_estoc_0,
        Direccion_entrada_RAM =>Direccion_entrada_RAM_0, 
        Valor_entrada => Valor_entrada_0,
        complete_cycle_next_input=>complete_cycle_next_input,
        process_next_input=>process_next_input,
        start_addresses=>start_addresses

);

Filtro_CNN_1_P: One_Filter_Structure
    port map (
        Reset => Reset,
        Clk => Clk,
        Start_g => Start_g,
        Valor_inical_ent_fila => 0,
        Valor_inical_ent_columna => Stride,
        
        comienza_relu=> comienza_relu_1,
        Finalizado_relu => Finalizado_Relu_1,
        y_estoc => y_estoc_1,
         Direccion_entrada_RAM =>Direccion_entrada_RAM_1,
          Valor_entrada => Valor_entrada_1,
          complete_cycle_next_input=>no_use_complete_1,
          process_next_input=>process_next_input,
          start_addresses=>start_addresses  

);
Filtro_CNN_2_P: One_Filter_Structure
    port map (
        Reset => Reset,
        Clk => Clk,
        Start_g => Start_g,
        Valor_inical_ent_fila => Stride,
        Valor_inical_ent_columna => 0,
        
        comienza_relu=> comienza_relu_2,
        Finalizado_relu => Finalizado_Relu_2,
        y_estoc => y_estoc_2,
        Direccion_entrada_RAM =>Direccion_entrada_RAM_2,
        Valor_entrada => Valor_entrada_2,
        complete_cycle_next_input=>no_use_complete_2,
        process_next_input=>process_next_input,
        start_addresses=>start_addresses
);
Filtro_CNN_3_P: One_Filter_Structure
    port map (
        Reset => Reset,
        Clk => Clk,
        Start_g => Start_g,
        Valor_inical_ent_fila => Stride,
        Valor_inical_ent_columna => Stride,
        
        comienza_relu=> comienza_relu_3,
        Finalizado_relu => Finalizado_Relu_3,
        y_estoc => y_estoc_3,
        Direccion_entrada_RAM =>Direccion_entrada_RAM_3,
        Valor_entrada => Valor_entrada_3,
        complete_cycle_next_input=>no_use_complete_3,
        process_next_input=>process_next_input,
        start_addresses=>start_addresses
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


 
end Behavioral;
