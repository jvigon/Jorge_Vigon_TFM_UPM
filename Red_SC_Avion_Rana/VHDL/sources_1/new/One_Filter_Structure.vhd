----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 12:05:10
-- Design Name: 
-- Module Name: One_Filter_Structure - Behavioral
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
use work.CNN_Package.all;

entity One_Filter_Structure is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g : in STD_LOGIC;
           valor_inical_ent_fila : in integer;
           valor_inical_ent_columna : in integer;
           
           comienza_relu : out STD_LOGIC;
           Finalizado_relu : out STD_LOGIC;
           y_estoc : out STD_LOGIC;
            Direccion_entrada_RAM : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
             Valor_entrada : in STD_LOGIC_VECTOR(7 DOWNTO 0);
             complete_cycle_next_input :out STD_LOGIC;
            process_next_input: in STD_LOGIC;---SE HAN cambiado el valor de los 4
            start_addresses: in std_logic
           );
end One_Filter_Structure;

architecture Behavioral of One_Filter_Structure is
    component Complete_Conexions_First_LFSDR
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g : in STD_LOGIC;
           valor_inical_ent_fila : in integer;
           valor_inical_ent_columna : in integer;
           --anado 
           Finalizado_relu : in STD_LOGIC;--INDICA QEU LA RELU HA TERMINADO Y POR TNATO EL POOL TAMBIEN(para desplazar)
           --de antes
           New_value: out STD_LOGIC; --para que ponga a cero el contador de xnor
           complete_cycle: out STD_LOGIC;--para que sume
           Finalizado_filtro: out STD_LOGIC;--para que el valor pase a la relu
           X_sc : out STD_LOGIC;
           W_sc : out STD_LOGIC;
           --a�ado en salida
           filtro : out STD_LOGIC_VECTOR ( (log2c(Numero_filtros) - 1) downto 0); --inidco cuando se utiliza el primer filtro o segundo para que el siguiente 
           --bloque use el bias correcto
            Direccion_entrada_RAM : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
            Valor_entrada : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           process_next_input: in STD_LOGIC;
           start_addresses: in std_logic
           
           );
         end component;

     
      component ADD_Multiplication
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
--signal entradas_complete  :   std_logic; 
signal Nuevo_Dato : std_logic;
signal complete_cycle_X  :   std_logic;
--signal complete_cycle_W  :   std_logic;
signal Suma_Finalizada : std_logic;

signal r_suma  :   std_logic_vector (7 downto 0);   
attribute keep of r_suma : signal is true;
attribute keep of complete_cycle_X  : signal is true;
attribute keep of Suma_Finalizada : signal is true;
attribute keep of output_LFSR_X : signal is true;
attribute keep of output_LFSR_W : signal is true;
--signal no_use_X: STD_LOGIC;
--signal no_use_W: STD_LOGIC; 

--ANADO
signal s_filtro : STD_LOGIC_VECTOR ( (log2c(Numero_filtros) - 1) downto 0);
signal s_finalizado_relu : std_logic;
begin

First_LFSDRs: Complete_Conexions_First_LFSDR
    port map (
        Reset => Reset,
        Clk => Clk,
        Start_g => Start_g,
        valor_inical_ent_fila => valor_inical_ent_fila,
        valor_inical_ent_columna => valor_inical_ent_columna,
        Finalizado_relu => s_finalizado_relu,
        New_value => Nuevo_Dato,
        complete_cycle => complete_cycle_X,
        Finalizado_filtro => Suma_Finalizada,
        x_sc => output_LFSR_X,
        w_sc => output_LFSR_W,
        filtro =>s_filtro,
        Direccion_entrada_RAM =>Direccion_entrada_RAM,
        Valor_entrada=>Valor_entrada,
        process_next_input=>process_next_input,
        start_addresses=>start_addresses
        );


        
   ADD_MUL: Add_Multiplication
   port map (
        Reset => Reset,
        Clk => Clk,
        x_sc => output_LFSR_X,
        w_sc => output_LFSR_W,
        Start => Nuevo_Dato,
        --entrada_complete => complete_cycle_X,
        entrada_complete => process_next_input,
        Finalizado_entradas=> Suma_Finalizada,
        r_suma=> r_suma,
         filtro =>s_filtro
         );
        
   ACT_LAYER: Activation_Layer
   port map (
        Reset => Reset,
        Clk => Clk,
        Finalizado_entradas => Suma_Finalizada,
        r_suma => r_suma,
        comienza_relu => comienza_relu,
        Finalizado_relu=> s_finalizado_relu,
        y_estoc=> y_estoc
           );
--y<=output_LFSR_X;

Finalizado_relu <= s_finalizado_relu;
complete_cycle_next_input<= complete_cycle_X;
end Behavioral;
