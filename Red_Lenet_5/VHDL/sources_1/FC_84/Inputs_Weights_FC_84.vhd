

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

use work.Package_FC_84.all;


entity Inputs_Weights_FC_84 is
           Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           complete_X: in STD_LOGIC;
           Start_g: in STD_LOGIC;
           Xbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           Finalizado: out STD_LOGIC;
           New_values: out STD_LOGIC;
                                                        --bram
            Direccion_pesos_fc_84 : out STD_LOGIC_VECTOR ((log2c(Dim_pesos_FC_84)-1)  downto 0)
           );
end Inputs_Weights_FC_84;

architecture Behavioral of Inputs_Weights_FC_84 is
SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Finalizado_next, Finalizado_reg : STD_LOGIC;
SIGNAL X_next, X_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal cont_W_2_1_next,cont_W_2_1_reg :unsigned ((log2c(Dim_pesos_FC_84)-1) downto 0); 

signal PESOS_COMB: STD_LOGIC_VECTOR(7 downto 0);

begin

PROCESS (clk,reset)
	BEGIN
		   IF reset='0' THEN
		       W_reg <= STD_LOGIC_VECTOR(TO_UNSIGNED(90,8));
		       X_reg <= (others => '0');
		       cont_W_2_1_reg <= (others => '0');
		   elsif CLK'event and CLK='1' then
			    New_values<='0';
			    Finalizado_reg<=Finalizado_next;
			    cont_W_2_1_reg <= cont_W_2_1_next;
				W_reg <= W_next;
				X_reg <= X_next;
				    if(Finalizado_next='1') then
				          New_values<='0';  
				    elsif(Start_g='1' OR Complete_X='1') then
				          New_values<='1';
				    end if;	                        
			END IF;
 end process;
 
process(Complete_X,cont_W_2_1_reg)
begin
Finalizado_next<='0';
cont_W_2_1_next <= cont_W_2_1_reg;
            if (Complete_X='1') then
            cont_W_2_1_next<=cont_W_2_1_reg +1;
		    if(cont_W_2_1_reg= (Dim_pesos_FC_84-1) ) then
				   cont_W_2_1_next<=(others => '0');
				   Finalizado_next<='1';
				    
		    end if;
    end if;
end process;


Direccion_pesos_fc_84<=std_logic_vector(cont_W_2_1_reg);

X_next <= X_anterior_capa_procesar; 
Xbin_Pasar_LFSDR <= X_reg;

Finalizado <= Finalizado_reg;
end Behavioral;
