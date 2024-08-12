
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


entity Activation_Layer is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Finalizado_entradas : in STD_LOGIC;
           r_suma : in STD_LOGIC_VECTOR (7 downto 0);
           comienza_relu : out STD_LOGIC;
           Finalizado_relu : out STD_LOGIC;
           y_estoc : out STD_LOGIC
           );
end Activation_Layer;

architecture Behavioral of Activation_Layer is

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
     
component op_activacion_RELU
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           output_LFSR_add  : in STD_LOGIC;
           output_LFSR_zero: in STD_LOGIC;
           entradas_complete : in STD_LOGIC;
           y_estoc : out STD_LOGIC);
     end component;
     
signal output_LFSR_add  :   std_logic; 
signal output_LFSR_zero  :   std_logic;  
signal complete_cycle_add  :   std_logic;
signal complete_cycle_zero  :   std_logic;

signal no_use_zero: std_logic;
begin
LFSR_Instance_add: LFSR_completo
    port map (
        Reset => Reset,
        Clk => Clk,
        Ident => '0',
        Start => Finalizado_entradas,
        input_sequence_var => r_suma,
        complete_cycle => complete_cycle_add,
        act_next_layer_ADD => Finalizado_relu,
        x_sc => output_LFSR_add);

LFSR_Instance_zero: LFSR_completo
   port map (
        Reset => Reset,
        Clk => Clk,
        Ident => '0',
        Start => Finalizado_entradas,
        input_sequence_var => std_logic_vector(TO_unsigned(128,8)),
        complete_cycle => complete_cycle_zero,
        act_next_layer_ADD => no_use_zero,
        x_sc => output_LFSR_zero);
        
op_act_RELU: op_activacion_RELU
   port map (
        Reset => Reset,
        Clk => Clk,
        output_LFSR_add => output_LFSR_add,
        output_LFSR_zero => output_LFSR_zero,
        entradas_complete => Finalizado_entradas,
        y_estoc => y_estoc);
comienza_relu <= Finalizado_entradas;
end Behavioral;
