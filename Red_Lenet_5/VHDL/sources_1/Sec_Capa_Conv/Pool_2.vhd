


LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

use work.CNN_Package_Second_Convolution.all;

entity Keeping_Pool_2 is
 Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Pool_bloque_ready_4: in STD_LOGIC;
           Valor_final_pool_4 : in STD_LOGIC_VECTOR (7 downto 0);
           Nueva_entrada_solicitud: in STD_LOGIC;
           X_pasar_siguiente_capa: out STD_LOGIC_VECTOR (7 downto 0);
           Pooling_ready : out STD_LOGIC
           );
end Keeping_Pool_2;

architecture Behavioral of Keeping_Pool_2 is
 
SIGNAL Flatten_ready_next, Flatten_ready_reg : STD_LOGIC;

signal Pooling_2_next,Pooling_2_reg : Pool_2;

signal pooling_full_next,pooling_full_reg : std_logic;
signal cont_pooling_fila_next,cont_pooling_fila_reg :unsigned ((log2c(Dim_pool)-1) downto 0);
signal cont_pooling_col_next,cont_pooling_col_reg :unsigned ((log2c(Dim_pool)-1) downto 0);
signal cont_pooling_depth_next,cont_pooling_depth_reg :unsigned ((log2c(Numero_filtros)-1) downto 0);

--USAR UN MISMO SUMADOR POOLING SUMADOR
signal in_suma_1_pooling,in_suma_2_pooling : unsigned((log2c(Dim_pool)-1) downto 0); 
signal in_suma_1_pooling_reg,in_suma_2_pooling_reg : unsigned((log2c(Dim_pool)-1) downto 0); 
signal out_suma_pooling : unsigned((log2c(Dim_pool)-1) downto 0);

--sacar datos
signal cont_pooling_salida_fila_next,cont_pooling_salida_fila_reg :unsigned ((log2c(Dim_pool)-1) downto 0);
signal cont_pooling_salida_col_next,cont_pooling_salida_col_reg :unsigned ((log2c(Dim_pool)-1) downto 0);
signal cont_pooling_salida_depth_next,cont_pooling_salida_depth_reg :unsigned ((log2c(Numero_filtros)-1) downto 0);

--USAR UN MISMO SUMADOR POOLING SUMADOR
signal in_suma_1_pooling_salida,in_suma_2_pooling_salida : unsigned((log2c(Dim_pool)-1) downto 0); 
signal in_suma_1_pooling_salida_reg,in_suma_2_pooling_salida_reg : unsigned((log2c(Dim_pool)-1) downto 0); 
signal out_suma_pooling_salida : unsigned((log2c(Dim_pool)-1) downto 0);

SIGNAL X_pasar_siguiente_capa_next,X_pasar_siguiente_capa_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
PROCESS (clk,reset)
	BEGIN
		   IF reset='0' THEN

		       
		       cont_pooling_salida_fila_reg <= (others => '0');
		       cont_pooling_salida_col_reg <= (others => '0');
		       cont_pooling_salida_depth_reg <= (others => '0');
		       
		       cont_pooling_fila_reg <= (others => '0');
		       cont_pooling_col_reg <= (others => '0');
		       cont_pooling_depth_reg <= (others => '0');
                
                in_suma_1_pooling_reg<=(others => '0');
                in_suma_2_pooling_reg<=(others => '0'); 
                
                in_suma_1_pooling_salida_reg<=(others => '0');
                in_suma_2_pooling_salida_reg<=(others => '0');

                pooling_full_reg<='0';

		   elsif CLK'event and CLK='1' then

		       Flatten_ready_reg <= Flatten_ready_next;       
		       
		       
		       cont_pooling_salida_fila_reg <= cont_pooling_salida_fila_next;
		       cont_pooling_salida_col_reg <= cont_pooling_salida_col_next;
		       cont_pooling_salida_depth_reg <= cont_pooling_salida_depth_next;
		       
		       cont_pooling_fila_reg <= cont_pooling_fila_next;
		       cont_pooling_col_reg <= cont_pooling_col_next;
		       cont_pooling_depth_reg <= cont_pooling_depth_next;
                
                in_suma_1_pooling_reg<=in_suma_1_pooling;
                in_suma_2_pooling_reg<=in_suma_2_pooling; 
                
                in_suma_1_pooling_salida_reg<=in_suma_1_pooling_salida;
                in_suma_2_pooling_salida_reg<=in_suma_2_pooling_salida;

                pooling_full_reg<=pooling_full_next;
                
                X_pasar_siguiente_capa_reg<=X_pasar_siguiente_capa_next;
                
                Pooling_2_reg<=Pooling_2_next;
			END IF;
 end process;
 


/*
En meter el orden es de se recorren las columnas primero luego las filas y luego se pasa al siguiente filtro= siguiente capa de pooling
con que ese orden se debe seguir para meter
*/
METER_DATOS_EN_POOLING : process(all)
BEGIN
cont_pooling_fila_next <= cont_pooling_fila_reg;
cont_pooling_col_next<= cont_pooling_col_reg;
cont_pooling_depth_next <= cont_pooling_depth_reg;
Flatten_ready_next<='0';
pooling_full_next<=pooling_full_reg;
in_suma_1_pooling<=in_suma_1_pooling_reg;
in_suma_2_pooling<=in_suma_2_pooling_reg;
Pooling_2_next<=Pooling_2_reg;
        if (Pool_bloque_ready_4='1') then

                Pooling_2_next(TO_INTEGER(cont_pooling_fila_reg), TO_INTEGER(cont_pooling_col_reg), TO_INTEGER(cont_pooling_depth_reg))<= Valor_final_pool_4;--para que primero pille los ceros
                if (cont_pooling_col_reg<Dim_pool-1) then

                    in_suma_1_pooling<=cont_pooling_col_reg;
                    in_suma_2_pooling<=to_unsigned(1,log2c(Dim_pool));
                    cont_pooling_col_next<=out_suma_pooling;
                else 
                        cont_pooling_col_next<= (others => '0');
                        if (cont_pooling_fila_reg<Dim_pool-1) then

                            in_suma_1_pooling<=cont_pooling_fila_reg ;
                            in_suma_2_pooling<=to_unsigned(1,log2c(Dim_pool));
                            cont_pooling_fila_next<=out_suma_pooling;
                        else
                            cont_pooling_fila_next<= (others => '0');
                            cont_pooling_col_next<= (others => '0');
                            
                                if (cont_pooling_depth_reg<Numero_filtros-1) then
                                    cont_pooling_depth_next <= cont_pooling_depth_reg + 1;--este va con numero de filtros no se puede poner en el sumador
                                else
                                    cont_pooling_depth_next <= (others => '0');
                                    Flatten_ready_next<='1';
                                    pooling_full_next<='1';

                                    
                                end if;
                       end if;
                 end if;
                 
                 
         end if;
 end process;
 
 
/*
Ahora para sacar los datos como funciona el flatten se debe sacar primero el 0,0 primera capa y luego 0,0 segunda capa se debe de sacar primero los de depth
*/ 
SACAR_DATOS_DE_POOLING : process(all)
BEGIN
cont_pooling_salida_fila_next <= cont_pooling_salida_fila_reg;
cont_pooling_salida_col_next<= cont_pooling_salida_col_reg;
cont_pooling_salida_depth_next <= cont_pooling_salida_depth_reg;

in_suma_1_pooling_salida<=in_suma_1_pooling_salida_reg;
in_suma_2_pooling_salida<=in_suma_2_pooling_salida_reg;

X_pasar_siguiente_capa_next<=X_pasar_siguiente_capa_reg;
        if ((Nueva_entrada_solicitud='1' or Flatten_ready_reg='1') and pooling_full_next='1') then

            X_pasar_siguiente_capa_next<=Pooling_2_reg(TO_INTEGER(cont_pooling_salida_fila_reg), TO_INTEGER(cont_pooling_salida_col_reg), TO_INTEGER(cont_pooling_salida_depth_reg));
             if (cont_pooling_salida_depth_reg<Numero_filtros-1) then
                   cont_pooling_salida_depth_next <= cont_pooling_salida_depth_reg + 1;--este va con numero de filtros no se puede poner en el sumador
             else
                   cont_pooling_salida_depth_next <= (others => '0');
                   if (cont_pooling_salida_col_reg<Dim_pool-1) then

                            in_suma_1_pooling_salida<=cont_pooling_salida_col_reg;
                            in_suma_2_pooling_salida<=to_unsigned(1,log2c(Dim_pool));
                            cont_pooling_salida_col_next<=out_suma_pooling_salida;
                    else 
                            cont_pooling_salida_col_next<= (others => '0');
                            if (cont_pooling_salida_fila_reg<Dim_pool-1) then

                                    in_suma_1_pooling_salida<=cont_pooling_salida_fila_reg ;
                                    in_suma_2_pooling_salida<=to_unsigned(1,log2c(Dim_pool));
                                    cont_pooling_salida_fila_next<=out_suma_pooling_salida;
                             else
                                    cont_pooling_salida_fila_next<= (others => '0');
                                    cont_pooling_salida_col_next<= (others => '0');
                                    
                                end if;
                       end if;
                 end if;
                 
         end if;
 end process;
Pooling_ready <= Flatten_ready_reg;
X_pasar_siguiente_capa<= X_pasar_siguiente_capa_reg;


--SUMADOR POSICION FILAS Y COLUMNAS POOLING
out_suma_pooling<=in_suma_1_pooling + in_suma_2_pooling;

out_suma_pooling_salida<=in_suma_1_pooling_salida + in_suma_2_pooling_salida;
end Behavioral;
