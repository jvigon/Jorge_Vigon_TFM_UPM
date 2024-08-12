----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 09:31:54
-- Design Name: 
-- Module Name: Inputs_Weights_Controller - Behavioral
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

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

use work.FC_Package.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Inputs_Weights_Controller_Second is
           Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           complete_X: in STD_LOGIC;
           Start_g: in STD_LOGIC;
           Xbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           Wbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           Finalizado: out STD_LOGIC;
           New_values: out STD_LOGIC
           );
end Inputs_Weights_Controller_Second;

architecture Behavioral of Inputs_Weights_Controller_Second is
SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Finalizado_next, Finalizado_reg : STD_LOGIC;
SIGNAL X_next, X_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal cont_W_2_1_next,cont_W_2_1_reg :unsigned ((log2c(Dim_pesos_FC)-1) downto 0); 

signal PESOS_COMB: STD_LOGIC_VECTOR(7 downto 0);
TYPE ROM_ARRAY_FC_PESOS is Array (0 to (Dim_pesos_FC-1)) of STD_LOGIC_VECTOR(7 downto 0);--150 valores 5x5x3 y x2 al ser 2 filtros
CONSTANT ROM_FC_PESOS: ROM_ARRAY_FC_PESOS := (
    "00010001", 
    "11011110", 
    "00010001", 
    "11111111", 
    "10100101", 
    "00111011", 
    "10011100", 
    "10011110"
);
begin
--PROCESS (clk,reset, complete_x,Finalizado_next)
--PROCESS (clk,reset, complete_x,Finalizado_next,Xbin_0)
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
		    if(cont_W_2_1_reg= (Dim_pesos_FC-1) ) then
				   cont_W_2_1_next<=(others => '0');
				   Finalizado_next<='1';
				    
		    end if;
    end if;
end process;

--W_next <= STD_LOGIC_VECTOR(TO_UNSIGNED(112,8)) WHEN cont_W_2_1_reg=0 else -- 0
	--	      STD_LOGIC_VECTOR(TO_UNSIGNED(236,8)) WHEN cont_W_2_1_reg=1 else
		--      STD_LOGIC_VECTOR(TO_UNSIGNED(50,8)) WHEN cont_W_2_1_reg=2 else
		  --    STD_LOGIC_VECTOR(TO_UNSIGNED(197,8)) WHEN cont_W_2_1_reg=3 else
            --  "00000000";
           
--PESOS_COMB <= STD_LOGIC_VECTOR(TO_UNSIGNED(48,8)) WHEN cont_W_2_1_reg=0 else -- 0
--		      STD_LOGIC_VECTOR(TO_UNSIGNED(141,8)) WHEN cont_W_2_1_reg=1 else
--		      STD_LOGIC_VECTOR(TO_UNSIGNED(71,8)) WHEN cont_W_2_1_reg=2 else
--		      STD_LOGIC_VECTOR(TO_UNSIGNED(208,8)) WHEN cont_W_2_1_reg=3 else
--		      STD_LOGIC_VECTOR(TO_UNSIGNED(146,8)) WHEN cont_W_2_1_reg=4 else
--		      STD_LOGIC_VECTOR(TO_UNSIGNED(161,8)) WHEN cont_W_2_1_reg=5 else
--		      STD_LOGIC_VECTOR(TO_UNSIGNED(138,8)) WHEN cont_W_2_1_reg=6 else
--		      STD_LOGIC_VECTOR(TO_UNSIGNED(160,8)) WHEN cont_W_2_1_reg=7 else
--              "00000000";
W_next <=ROM_FC_PESOS(TO_INTEGER(cont_W_2_1_reg));

--X_next <= Xbin_0 WHEN cont_W_2_1_reg=0 else -- 0
--		      Xbin_1 WHEN cont_W_2_1_reg=1 else
--		      Xbin_2 WHEN cont_W_2_1_reg=2 else
--		      Xbin_3 WHEN cont_W_2_1_reg=3 else
--		      Xbin_4 WHEN cont_W_2_1_reg=4 else
--		      Xbin_5 WHEN cont_W_2_1_reg=5 else
--		      Xbin_6 WHEN cont_W_2_1_reg=6 else
--		      Xbin_7 WHEN cont_W_2_1_reg=7 else
--              "00000000";
            
X_next <= X_anterior_capa_procesar; 
Xbin_Pasar_LFSDR <= X_reg;
Wbin_Pasar_LFSDR <= W_reg;
Finalizado <= Finalizado_reg;
end Behavioral;
