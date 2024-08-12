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
           Xbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_2 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_3 : in STD_LOGIC_VECTOR (7 downto 0);
           Num_entradas : in integer;
           Start_g : in STD_LOGIC;           
           Bias_2_Capa : in STD_LOGIC_VECTOR(7 downto 0); 
           act_layer_next : out STD_LOGIC;
           resultado_total : OUT STD_LOGIC_VECTOR(10 downto 0);
           indica_final : out STD_LOGIC;
           y :  out STD_LOGIC);
end Neuron_Full_Connected_Sigmoid;

architecture Behavioral of Neuron_Full_Connected_Sigmoid is

    component Complete_Conexions_Second_LFSDR
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g: in STD_LOGIC;
           Xbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_2 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_3 : in STD_LOGIC_VECTOR (7 downto 0);
           Num_entradas : in integer;
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
                   r_suma : out STD_LOGIC_VECTOR (7 downto 0));
       end component;
       
      component Sigmoid
         Port ( CLK : in STD_LOGIC;
                   Reset : in STD_LOGIC;
                   Finalizado_entradas : in STD_LOGIC;
                   r_suma : in STD_LOGIC_VECTOR (7 downto 0);
                   Bias_2_Capa : in STD_LOGIC_VECTOR(7 downto 0); 
                   act_layer_next : out STD_LOGIC;
                   resultado_total : out STD_LOGIC_VECTOR(10 downto 0); 
                   indica_final : out STD_LOGIC;
                   y :out STD_LOGIC);
       end component;
       
signal output_LFSR_X  :   std_logic; 
signal output_LFSR_W  :   std_logic; 
--signal entradas_complete  :   std_logic; 
signal Nuevo_Dato : std_logic;
signal complete_cycle_X  :   std_logic;
--signal complete_cycle_W  :   std_logic;
signal Suma_Finalizada : std_logic;

signal r_suma  :   std_logic_vector (7 downto 0);   

signal no_use_X: STD_LOGIC;
signal no_use_W: STD_LOGIC; 

attribute keep : boolean;    
attribute keep of output_LFSR_X  : signal is true;
attribute keep of output_LFSR_W : signal is true;
attribute keep of Nuevo_Dato  : signal is true;
attribute keep of complete_cycle_X  : signal is true;
attribute keep of Suma_Finalizada : signal is true;
attribute keep of r_suma : signal is true;

begin

First_LFSDRs: Complete_Conexions_Second_LFSDR
    port map (
        Reset => Reset,
        Clk => Clk,
        Start_g => Start_g,
        Xbin_0 => Xbin_0,
        Xbin_1 => Xbin_1,
        Xbin_2 => Xbin_2,
        Xbin_3 => Xbin_3,
        Num_entradas => Num_entradas,
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
        r_suma=> r_suma );
        
   SIGMOID_ACT: Sigmoid
   port map (
        Reset => Reset,
        Clk => Clk,
        Finalizado_entradas => Suma_Finalizada,
        r_suma => r_suma,
        Bias_2_Capa => Bias_2_Capa,
        act_layer_next=> act_layer_next,
        resultado_total=> resultado_total,
        indica_final=>indica_final,
        y=> y );
--y<=output_LFSR_X;
end Behavioral;
