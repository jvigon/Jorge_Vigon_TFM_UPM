

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LFSR_completo is
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Ident : in STD_LOGIC;
           Start: in STD_LOGIC;
           input_sequence_var : in STD_LOGIC_VECTOR (7 downto 0);
           complete_cycle: out STD_LOGIC;
           act_next_layer_ADD: out STD_LOGIC;
           x_sc : out STD_LOGIC);
end LFSR_completo;

architecture Behavioral of LFSR_completo is
  component LFSR_Solo
    port (
    Reset     : in  std_logic;   -- Low-level asynchronous reset
    Clk       : in  std_logic;   -- System clock (20MHz), rising edge 
	Ident : in STD_LOGIC;
	Start : in STD_LOGIC;
	complete_cycle : out STD_LOGIC;
	stop: out STD_LOGIC;
	act_next_layer_ADD: out STD_LOGIC;
    o_sequence : out STD_LOGIC_VECTOR (7 downto 0));
   end component;
   
   component LFSR_Comp
    port (
	Reset     : in  std_logic;   -- Low-level asynchronous reset
	input_sequence_var : in STD_LOGIC_VECTOR (7 downto 0);
    input_sequence_LFSR : in STD_LOGIC_VECTOR (7 downto 0);
    stop: in STD_LOGIC;
    x_sc : out std_logic
    );
   end component; 
   
signal sequence_random  :   std_logic_vector( 7 downto 0);
signal s_stop: STD_LOGIC;
 
begin
   LFSR_SOLO_PHY: LFSR_Solo
     port map (
        Reset => Reset,
        Clk => Clk,
        Ident => Ident,
        Start => Start,
        complete_cycle => complete_cycle,
        stop => s_stop,
        act_next_layer_ADD=> act_next_layer_ADD,
        o_sequence => sequence_random
        );
        
   LFSR_Comp_PHY: LFSR_Comp
     port map (
        Reset => Reset,
        input_sequence_var => input_sequence_var,
        input_sequence_LFSR => sequence_random,
        stop=> s_stop,
        x_sc => x_sc
        );

end Behavioral;
