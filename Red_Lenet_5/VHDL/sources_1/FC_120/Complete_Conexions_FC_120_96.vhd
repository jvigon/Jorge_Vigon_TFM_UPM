
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.Package_FC_120.all;
entity Complete_Conexions_FC_120 is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g: in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           New_value: out STD_LOGIC;
           complete_cycle: out STD_LOGIC;
           Finalizado: out STD_LOGIC;
           X_sc : out STD_LOGIC;
           W_sc : out STD_LOGIC;
                                  --bram
            Direccion_pesos_fc_120 : out STD_LOGIC_VECTOR ((log2c(Dim_pesos_FC)-1)  downto 0);
            valor_peso_fc_120: in STD_LOGIC_VECTOR (7  downto 0)
           );
end Complete_Conexions_FC_120;

architecture Behavioral of Complete_Conexions_FC_120 is


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
     
component Inputs_Weights_FC_120
           Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           complete_X: in STD_LOGIC;
           Start_g: in STD_LOGIC;
           Xbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           --Wbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           Finalizado: out STD_LOGIC;
           New_values: out STD_LOGIC;
                                             --bram
            Direccion_pesos_fc_120 : out STD_LOGIC_VECTOR ((log2c(Dim_pesos_FC)-1)  downto 0)
           );
     end component;
     
     
signal no_use_complete_cycle_W  :   std_logic;
signal complete_cycle_X : STD_LOGIC;
signal Xbin_Pasar : STD_LOGIC_VECTOR (7 downto 0);
signal Nuevo_valor : STD_LOGIC;

signal no_use_X: STD_LOGIC;
signal no_use_W: STD_LOGIC; 

begin

 LFSR_Instance_Controller: Inputs_Weights_FC_120
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        complete_X => complete_cycle_X,
        Start_g => Start_g,
        Xbin_Pasar_LFSDR => Xbin_Pasar,
        Finalizado => Finalizado,
        New_values => Nuevo_valor,
        Direccion_pesos_fc_120=>Direccion_pesos_fc_120
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
        input_sequence_var => valor_peso_fc_120,
        complete_cycle => no_use_complete_cycle_W,
        act_next_layer_ADD => no_use_W,
        x_sc => W_sc);
        
complete_cycle <= complete_cycle_X;
New_value <= Nuevo_valor;
end Behavioral;

