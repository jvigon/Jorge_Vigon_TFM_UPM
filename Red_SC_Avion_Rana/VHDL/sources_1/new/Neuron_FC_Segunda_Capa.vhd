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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.FC_Package.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Neuron_Full_Connected_Sigmoid is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           act_layer_next : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           resultado_total: out std_logic_vector((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
           y : out STD_LOGIC
           
           );
end Neuron_Full_Connected_Sigmoid;

architecture Behavioral of Neuron_Full_Connected_Sigmoid is

    component Complete_Conexions_Second_LFSDR
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g: in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           New_value: out STD_LOGIC;
           complete_cycle: out STD_LOGIC;
           Finalizado: out STD_LOGIC;
           --act_next_layer_ADD: out STD_LOGIC;
           X_sc : out STD_LOGIC;
           W_sc : out STD_LOGIC);
         end component;

     
      component ADD_Multiplication_Sigmoid
        Port ( CLK : in STD_LOGIC;
                   Reset : in STD_LOGIC;
                   x_sc : in STD_LOGIC;
                   w_sc : in STD_LOGIC;
                   Start : in STD_LOGIC;
                   entrada_complete : in STD_LOGIC;
                   Finalizado_entradas : in STD_LOGIC;
                   resultado_total: out std_logic_vector((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
                   y : out STD_LOGIC);
       end component;
       

signal output_LFSR_X  :   std_logic; 
signal output_LFSR_W  :   std_logic; 
--signal entradas_complete  :   std_logic; 
signal Nuevo_Dato : std_logic;
signal complete_cycle_X  :   std_logic;
--signal complete_cycle_W  :   std_logic;
signal Suma_Finalizada : std_logic;


signal no_use_X: STD_LOGIC;
signal no_use_W: STD_LOGIC;

--anado
signal pasar_dato_to_sigmoid : std_logic; 

attribute keep : boolean;    
attribute keep of output_LFSR_X  : signal is true;
attribute keep of output_LFSR_W : signal is true;
attribute keep of Nuevo_Dato  : signal is true;
attribute keep of complete_cycle_X  : signal is true;
attribute keep of Suma_Finalizada : signal is true;

begin

First_LFSDRs: Complete_Conexions_Second_LFSDR
    port map (
        Reset => Reset,
        Clk => Clk,
        Start_g => Start_g,
        X_anterior_capa_procesar => X_anterior_capa_procesar,
        New_value => Nuevo_Dato,
        complete_cycle => complete_cycle_X,
        Finalizado => Suma_Finalizada,
        x_sc => output_LFSR_X,
        w_sc => output_LFSR_W);


        
   ADD_MUL: Add_Multiplication_Sigmoid
   port map (
        Reset => Reset,
        Clk => Clk,
        x_sc => output_LFSR_X,
        w_sc => output_LFSR_W,
        Start => Nuevo_Dato,
        entrada_complete => complete_cycle_X,
        Finalizado_entradas=> Suma_Finalizada,
        resultado_total=>resultado_total,
        y => y
        );
        
   
Solicitud_nuevo_valor_pooling <=complete_cycle_X;
act_layer_next<= Suma_Finalizada;
end Behavioral;
