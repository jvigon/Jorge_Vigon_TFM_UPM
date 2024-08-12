LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity POOLING is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Valor_ESTOC_relu_Filtro_0 : in std_logic;
           Valor_ESTOC_relu_Filtro_1 : in std_logic;
           Valor_ESTOC_relu_Filtro_2 : in std_logic;
           Valor_ESTOC_relu_Filtro_3 : in std_logic;
           comienza_relu : in STD_LOGIC;
           Finalizado_relu : in std_logic;
           Valor_final_pool : out STD_LOGIC_VECTOR (7 downto 0);
           Pool_bloque_ready_4: out STD_LOGIC
           );
end POOLING;

architecture Behavioral of POOLING is
SIGNAL resultado_OR_next,resultado_OR_reg : STD_LOGIC;
SIGNAL contador : UNSIGNED (7 DOWNTO 0);
SIGNAL Valor_final_pool_next,Valor_final_pool_reg : STD_LOGIC_VECTOR (7 downto 0);
signal s_activacion_e_1,s_activacion_e_2 : std_logic :='0';
--SIGNAL Finalizado_global_filtro_next, Finalizado_global_filtro_reg : STD_LOGIC;
begin
--PROCESS (clk,reset,Finalizado_relu)
--	BEGIN
--		   IF reset='0' THEN
--		       salida_bloque_reg <= (others => '0');
--		       Finalizado_global_filtro_reg <= '0';
--		   elsif CLK'event and CLK='1' then
--		       Finalizado_global_filtro_next <=Finalizado_global_filtro_reg;
--		       salida_bloque_reg <= salida_bloque_next;
--		       Pool_bloque_ready_4<='0';
--		       if (Finalizado_relu='1') then
--		            Pool_bloque_ready_4<='1';
--		            Valor_final_pool <=salida_bloque_next;
--		       END IF;
		                      
--			END IF;
-- end process;

process(Valor_ESTOC_relu_Filtro_0, Valor_ESTOC_relu_Filtro_1, Valor_ESTOC_relu_Filtro_2, Valor_ESTOC_relu_Filtro_3,comienza_relu)
begin 
    if (comienza_relu='1') then
        resultado_OR_next <= '0';--reinicar
    else
        resultado_OR_next <= Valor_ESTOC_relu_Filtro_0 OR Valor_ESTOC_relu_Filtro_1 OR Valor_ESTOC_relu_Filtro_2 OR Valor_ESTOC_relu_Filtro_3;
    end if;
end process;

process(CLK, Reset) 
begin
    if reset='0' then
        contador <= (others=>'0');
        resultado_OR_reg <='0';
     elsif CLK'event and CLK='1' then
            --act_layer_next<= '0';
            resultado_OR_reg<=resultado_OR_next;
            Pool_bloque_ready_4<='0';
            if (comienza_relu = '1') then
                contador <= (others=>'0');
            else
                   if (resultado_OR_reg='1') then
                            contador <= contador + 1;
                   else
                            contador <= contador;
                   end if;
            end if;
--             if (Finalizado_relu='1') then
--		            Pool_bloque_ready_4<='1';
--	                Valor_final_pool <=std_logic_vector(contador);
	                
	             s_activacion_e_1<='0';
                 s_activacion_e_2<='0';    
	           if (Finalizado_relu='1') then --adetrasar 3 ciclos para que pille correctamente la última de xnor
                    s_activacion_e_1<='1';                  
                  elsif (Finalizado_relu='0' and s_activacion_e_1='1') then-- DETECTAR FLANCO DE BAJADA START
                     s_activacion_e_1<='0';
                     s_activacion_e_2<='1';
                  elsif (Finalizado_relu='0' and s_activacion_e_2='1') then-- DETECTAR FLANCO DE BAJADA START
                     Pool_bloque_ready_4<='1';
	                 Valor_final_pool <=std_logic_vector(contador);
                  else 
                     Pool_bloque_ready_4<='0';
                  end if;
	       END IF;

end process;
end Behavioral;
