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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Inputs_Weights_Controller_First is
           Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Xbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
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
end Inputs_Weights_Controller_First;

architecture Behavioral of Inputs_Weights_Controller_First is
SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Finalizado_next, Finalizado_reg : STD_LOGIC;
SIGNAL X_next, X_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);

signal cont_W_2_1_next,cont_W_2_1_reg :unsigned (2 downto 0); 
attribute keep : boolean;    
attribute keep of X_next  : signal is true;
attribute keep of W_next  : signal is true;

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
				    --if(Finalizado_reg='1') then
				          New_values<='0';  
				    elsif(Start_g='1' OR Complete_X='1') then
				          New_values<='1';
				    end if;	                        
			END IF;
 end process;
 
process(Complete_X, Num_entradas,cont_W_2_1_reg)
begin
Finalizado_next<='0';
cont_W_2_1_next <= cont_W_2_1_reg;
            if (Complete_X='1') then
            cont_W_2_1_next<=cont_W_2_1_reg +1;
		    if(cont_W_2_1_reg= (Num_entradas-1) ) then
				   cont_W_2_1_next<=(others => '0');
				   Finalizado_next<='1';
				    
		    end if;
    end if;
end process;

W_next <= Wbin_0 WHEN cont_W_2_1_reg=0 else -- 0
		      Wbin_1 WHEN cont_W_2_1_reg=1 else
		      --STD_LOGIC_VECTOR(TO_UNSIGNED(75,8)) WHEN cont_W_2_1_reg=2 else
		      --STD_LOGIC_VECTOR(TO_UNSIGNED(128,8)) WHEN cont_W_2_1_reg=3 else
              --STD_LOGIC_VECTOR(TO_UNSIGNED(210,8)) WHEN cont_W_2_1_reg=4 else
              "00000000";

X_next <= Xbin_0 WHEN cont_W_2_1_reg=0 else -- 0
		      Xbin_1 WHEN cont_W_2_1_reg=1 else
		      --Xbin_2 WHEN cont_W_2_1_reg=2 else
		      --Xbin_3 WHEN cont_W_2_1_reg=3 else
              --Xbin_4 WHEN cont_W_2_1_reg=4 else
              "00000000";
              
Xbin_Pasar_LFSDR <= X_reg;
Wbin_Pasar_LFSDR <= W_reg;
Finalizado <= Finalizado_reg;
end Behavioral;
