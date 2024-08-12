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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Complete_Conexions_First_LFSDR is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g: in STD_LOGIC;
           Xbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
           Wbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Wbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
           --Xbin_4 : in STD_LOGIC_VECTOR (7 downto 0);
           Num_entradas : in integer;
           New_value: out STD_LOGIC;
           complete_cycle: out STD_LOGIC;
           Finalizado: out STD_LOGIC;
           --act_next_layer_ADD: out STD_LOGIC;
           X_sc : out STD_LOGIC;
           W_sc : out STD_LOGIC);
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
           Xbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
          -- Wbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
           Wbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Wbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
           complete_X: in STD_LOGIC;
           Start_g: in STD_LOGIC;
           Num_entradas : in integer;
           Xbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           Wbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           Finalizado: out STD_LOGIC;
           New_values: out STD_LOGIC
           );
     end component;
     
     
signal no_use_complete_cycle_W  :   std_logic;
signal complete_cycle_X : STD_LOGIC;
signal Xbin_Pasar : STD_LOGIC_VECTOR (7 downto 0);
signal Wbin_Pasar : STD_LOGIC_VECTOR (7 downto 0);
signal Nuevo_valor : STD_LOGIC;

signal no_use_X: STD_LOGIC;
signal no_use_W: STD_LOGIC; 

begin

 LFSR_Instance_Controller: Inputs_Weights_Controller_First
    port map (
        Reset => Reset,
        Clk => Clk,
        Xbin_0 => Xbin_0,
        Xbin_1 => Xbin_1,
        Wbin_0 => Wbin_0,
        Wbin_1 => Wbin_1,
        complete_X => complete_cycle_X,
        Start_g => Start_g,
        Num_entradas => Num_entradas,
        Xbin_Pasar_LFSDR => Xbin_Pasar,
        Wbin_Pasar_LFSDR => Wbin_Pasar,
        Finalizado => Finalizado,
        New_values => Nuevo_valor);
        
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
