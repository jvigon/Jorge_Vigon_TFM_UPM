----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2024 13:36:41
-- Design Name: 
-- Module Name: op_act_RELU - Behavioral
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

entity op_activacion_RELU is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           output_LFSR_add  : in STD_LOGIC;
           output_LFSR_zero: in STD_LOGIC;
           entradas_complete : in STD_LOGIC;
           y_estoc: out std_logic
           );

end op_activacion_RELU;

architecture Behavioral of op_activacion_RELU is
signal y2_next : STD_LOGIC;
signal y2_reg : STD_LOGIC;

--COMPROBACION
signal cont_y : unsigned (7 downto 0);
SIGNAL valor_y : STD_LOGIC_VECTOR( 7 downto 0);

begin

process(output_LFSR_add, output_LFSR_zero,entradas_complete)
begin 
    if (entradas_complete='1') then
        y2_next <= '0';--reinicar
    else
        y2_next <= output_LFSR_add OR output_LFSR_zero;
    end if;
end process;

process(CLK, Reset) 
begin
    if reset='0' then
        y2_reg<= '0';
        cont_y <= (others=>'0');
     elsif CLK'event and CLK='1' then

            y2_reg<= y2_next;

            if (entradas_complete = '1') then
                cont_y <= (others=>'0');
            else
                   if (y2_reg='1') then
                            cont_y <= cont_y + 1;
                   else
                            cont_y <= cont_y;
                   end if;
            end if;
     end if;
end process;

valor_y <= std_logic_vector(cont_y);
y_estoc<= y2_reg;
end Behavioral;
