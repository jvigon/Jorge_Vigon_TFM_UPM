----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 10:02:44
-- Design Name: 
-- Module Name: Conexions_LFSDR - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;

entity Complete_Conexions_First_LFSDR is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g : in STD_LOGIC;
           valor_inical_ent_fila : in integer;
           valor_inical_ent_columna : in integer;
           --de antes
           Finalizado_relu : in STD_LOGIC;--INDICA QEU LA RELU HA TERMINADO Y POR TNATO EL POOL TAMBIEN(para desplazar)
           New_value: out STD_LOGIC;--esto para mult que reinicie el contador de XNOR a cero
           complete_cycle: out STD_LOGIC;
           Finalizado_filtro: out STD_LOGIC;
           X_sc : out STD_LOGIC;
           W_sc : out STD_LOGIC;
           --añado en salida
            filtro : out STD_LOGIC_VECTOR ( (log2c(Numero_filtros) - 1) downto 0);
           --bloque use el bias correcto
            Direccion_entrada_RAM : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
            Valor_entrada : in STD_LOGIC_VECTOR(7 DOWNTO 0);
            process_next_input: in STD_LOGIC;
            start_addresses: in std_logic
            );
end Complete_Conexions_First_LFSDR;

architecture Behavioral of Complete_Conexions_First_LFSDR is


component LFSR_completo
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Ident : in STD_LOGIC;
           Start: in STD_LOGIC;
           input_sequence_var : in STD_LOGIC_VECTOR (7 downto 0);
           complete_cycle: out STD_LOGIC;
           act_next_layer_ADD: out STD_LOGIC;
           x_sc : out STD_LOGIC);
     end component;
     
component Inputs_Weights_Controller_First
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g : in STD_LOGIC;
           valor_inical_ent_fila : in integer;
           valor_inical_ent_columna : in integer;
           Finalizado_relu : in STD_LOGIC;--INDICA QEU LA RELU HA TERMINADO Y POR TNATO EL POOL TAMBIEN(para desplazar)
           --de antes
           New_value: out STD_LOGIC;
           complete_cycle: in STD_LOGIC;---modificar la address
           filtro : out STD_LOGIC_VECTOR ( (log2c(Numero_filtros) - 1) downto 0);
           Finalizado_filtro: out STD_LOGIC;
           Xbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           Wbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           --RAM:
           Direccion_entrada_RAM : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Valor_Entrada_RAM : in STD_LOGIC_VECTOR (7 downto 0);
           pass_value_to_x: in STD_LOGIC;
           start_addresses: in std_logic
           );
     end component;
     


          
signal no_use_complete_cycle_W  :   std_logic;
signal complete_cycle_X : STD_LOGIC;
signal Xbin_Pasar : STD_LOGIC_VECTOR (7 downto 0);
signal Wbin_Pasar : STD_LOGIC_VECTOR (7 downto 0);
signal Nuevo_valor : STD_LOGIC;

signal no_use_X: STD_LOGIC;
signal no_use_W: STD_LOGIC; 

--signal Direccion_RAM : STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);

begin

 LFSR_Instance_Controller: Inputs_Weights_Controller_First
    port map (
        Reset => Reset,
        Clk => Clk,
        Start_g => Start_g,
        valor_inical_ent_fila =>valor_inical_ent_fila,
        valor_inical_ent_columna =>valor_inical_ent_columna,
        Finalizado_relu =>Finalizado_relu,
        New_value => Nuevo_valor,
        complete_cycle => complete_cycle_X,
        pass_value_to_x=>process_next_input,
        --complete_cycle => process_next_input,
        Finalizado_filtro => Finalizado_filtro,
        Xbin_Pasar_LFSDR => Xbin_Pasar,
        Wbin_Pasar_LFSDR => Wbin_Pasar,
        filtro => filtro,
        Direccion_entrada_RAM =>Direccion_entrada_RAM,
        Valor_Entrada_RAM =>Valor_entrada,
        start_addresses=>start_addresses
        --process_next_input=> process_next_input
        );
        
 LFSR_Instance_X: LFSR_completo
    port map (
        Reset => Reset,
        Clk => Clk,
        Ident => '0',
        Start => Nuevo_valor,
        input_sequence_var => Xbin_Pasar,
        complete_cycle => complete_cycle_X,
        act_next_layer_ADD => no_use_X,
        x_sc => X_sc);
        
 LFSR_Instance_W: LFSR_completo
    port map (
        Reset => Reset,
        Clk => Clk,
        Ident => '1',
        Start => Nuevo_valor,
        input_sequence_var => Wbin_Pasar,
        complete_cycle => no_use_complete_cycle_W,
        act_next_layer_ADD => no_use_W,
        x_sc => W_sc);

complete_cycle <= complete_cycle_X;
New_value <= Nuevo_valor;
end Behavioral;
