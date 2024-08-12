----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 16:20:53
-- Design Name: 
-- Module Name: Flatten - Behavioral
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

use work.CNN_Package_First_Convolution.all;


entity Keeping_Pool_1 is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Pool_bloque_ready_4: in STD_LOGIC;
           Valor_final_pool_4 : in STD_LOGIC_VECTOR (7 downto 0);
           Pooling_ready : out STD_LOGIC;
           
           --PARA POOL 1 A SEGUNDA CAPA
           X_from_pool_1_procesar_0: out STD_LOGIC_VECTOR (7 downto 0);
           X_from_pool_1_procesar_1: out STD_LOGIC_VECTOR (7 downto 0);
           X_from_pool_1_procesar_2: out STD_LOGIC_VECTOR (7 downto 0);
           X_from_pool_1_procesar_3: out STD_LOGIC_VECTOR (7 downto 0);
           Direccion_from_pool_1_0: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);--de 864 12*12*6
           Direccion_from_pool_1_1: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_from_pool_1_2: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_from_pool_1_3: in STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           
           complete_cycle_next_from_pool_1 :in STD_LOGIC;
           process_next_from_pool_1: out STD_LOGIC---SE HAN cambiado el valor de los 4
           
           );
end Keeping_Pool_1;

architecture Behavioral of Keeping_Pool_1 is
 
SIGNAL Flatten_ready_next, Flatten_ready_reg : STD_LOGIC;

signal Pooling_1_next,Pooling_1_reg : Pool_1;

signal pooling_full_next,pooling_full_reg : std_logic;
signal cont_pooling_fila_next,cont_pooling_fila_reg :unsigned ((log2c(Dim_pool)-1) downto 0);
signal cont_pooling_col_next,cont_pooling_col_reg :unsigned ((log2c(Dim_pool)-1) downto 0);
signal cont_pooling_depth_next,cont_pooling_depth_reg :unsigned ((log2c(Numero_filtros)-1) downto 0);

--USAR UN MISMO SUMADOR POOLING SUMADOR
signal in_suma_1_pooling,in_suma_2_pooling : unsigned((log2c(Dim_pool)-1) downto 0); 
signal in_suma_1_pooling_reg,in_suma_2_pooling_reg : unsigned((log2c(Dim_pool)-1) downto 0); 
signal out_suma_pooling : unsigned((log2c(Dim_pool)-1) downto 0);

--extraer
signal cont_col_extract_0_next,cont_col_extract_1_next,cont_col_extract_2_next,cont_col_extract_3_next : unsigned(log2c(Dim_pool)-1 downto 0);
signal cont_col_extract_0_reg,cont_col_extract_1_reg,cont_col_extract_2_reg,cont_col_extract_3_reg : unsigned(log2c(Dim_pool)-1 downto 0);
signal cont_fila_extract_0_next,cont_fila_extract_1_next,cont_fila_extract_2_next,cont_fila_extract_3_next : unsigned(log2c(Dim_pool)-1 downto 0);
signal cont_fila_extract_0_reg,cont_fila_extract_1_reg,cont_fila_extract_2_reg,cont_fila_extract_3_reg : unsigned(log2c(Dim_pool)-1 downto 0);
signal cont_depth_extract_0_next,cont_depth_extract_1_next,cont_depth_extract_2_next,cont_depth_extract_3_next : unsigned(log2c(Numero_filtros)-1 downto 0);
signal cont_depth_extract_0_reg,cont_depth_extract_1_reg,cont_depth_extract_2_reg,cont_depth_extract_3_reg : unsigned(log2c(Numero_filtros)-1 downto 0);
SIGNAL process_next, process_reg : STD_LOGIC;
signal  X_from_pool_1_procesar_0_reg,X_from_pool_1_procesar_1_reg,X_from_pool_1_procesar_2_reg,X_from_pool_1_procesar_3_reg :  STD_LOGIC_VECTOR (7 downto 0);

SIGNAL Finalizado_filtro_next, Finalizado_filtro_reg : STD_LOGIC;
begin
PROCESS (clk,reset)
	BEGIN
		   IF reset='0' THEN

		       

		       
		       cont_pooling_fila_reg <= (others => '0');
		       cont_pooling_col_reg <= (others => '0');
		       cont_pooling_depth_reg <= (others => '0');
                
                in_suma_1_pooling_reg<=(others => '0');
                in_suma_2_pooling_reg<=(others => '0'); 

                pooling_full_reg<='0';

		       
		       --sacar
		       process_reg<='0';
		       
		         cont_depth_extract_0_reg<=(others => '0');
                 cont_fila_extract_0_reg<=(others => '0');
                 cont_col_extract_0_reg<=(others => '0');
                 
                 cont_depth_extract_1_reg<=(others => '0');
                 cont_fila_extract_1_reg<=(others => '0');
                 cont_col_extract_1_reg<=(others => '0');
                 
                 cont_depth_extract_2_reg<=(others => '0');
                 cont_fila_extract_2_reg<=(others => '0');
                 cont_col_extract_2_reg<=(others => '0');
                 
                 cont_depth_extract_3_reg<=(others => '0');
                 cont_fila_extract_3_reg<=(others => '0');
                 cont_col_extract_3_reg<=(others => '0');
		   elsif CLK'event and CLK='1' then

		       Flatten_ready_reg <= Flatten_ready_next;       

		       cont_pooling_fila_reg <= cont_pooling_fila_next;
		       cont_pooling_col_reg <= cont_pooling_col_next;
		       cont_pooling_depth_reg <= cont_pooling_depth_next;
                
                in_suma_1_pooling_reg<=in_suma_1_pooling;
                in_suma_2_pooling_reg<=in_suma_2_pooling; 
                pooling_full_reg<=pooling_full_next;
                
                Pooling_1_reg<=Pooling_1_next;
                
                --sacar
                process_reg<=process_next;
                
                 cont_depth_extract_0_reg<=cont_depth_extract_0_next;
                 cont_fila_extract_0_reg<=cont_fila_extract_0_next;
                 cont_col_extract_0_reg<=cont_col_extract_0_next;
                 
                 cont_depth_extract_1_reg<=cont_depth_extract_1_next;
                 cont_fila_extract_1_reg<=cont_fila_extract_1_next;
                 cont_col_extract_1_reg<=cont_col_extract_1_next;
                 
                 cont_depth_extract_2_reg<=cont_depth_extract_2_next;
                 cont_fila_extract_2_reg<=cont_fila_extract_2_next;
                 cont_col_extract_2_reg<=cont_col_extract_2_next;
                 
                 cont_depth_extract_3_reg<=cont_depth_extract_3_next;
                 cont_fila_extract_3_reg<=cont_fila_extract_3_next;
                 cont_col_extract_3_reg<=cont_col_extract_3_next;
                 
                  X_from_pool_1_procesar_0_reg<=X_from_pool_1_procesar_0;
                  X_from_pool_1_procesar_1_reg<=X_from_pool_1_procesar_1;
                  X_from_pool_1_procesar_2_reg<=X_from_pool_1_procesar_2;
                  X_from_pool_1_procesar_3_reg<=X_from_pool_1_procesar_3;
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
Pooling_1_next<=Pooling_1_reg;
        if (Pool_bloque_ready_4='1') then
                Pooling_1_next(TO_INTEGER(cont_pooling_fila_reg), TO_INTEGER(cont_pooling_col_reg), TO_INTEGER(cont_pooling_depth_reg))<= Valor_final_pool_4;--para que primero pille los ceros
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
 

 process(all)
 begin
 cont_depth_extract_0_next<=cont_depth_extract_0_reg;
 cont_fila_extract_0_next<=cont_fila_extract_0_reg;
 cont_col_extract_0_next<=cont_col_extract_0_reg;
 
 cont_depth_extract_1_next<=cont_depth_extract_1_reg;
 cont_fila_extract_1_next<=cont_fila_extract_1_reg;
 cont_col_extract_1_next<=cont_col_extract_1_reg;
 
 cont_depth_extract_2_next<=cont_depth_extract_2_reg;
 cont_fila_extract_2_next<=cont_fila_extract_2_reg;
 cont_col_extract_2_next<=cont_col_extract_2_reg;
 
 cont_depth_extract_3_next<=cont_depth_extract_3_reg;
 cont_fila_extract_3_next<=cont_fila_extract_3_reg;
 cont_col_extract_3_next<=cont_col_extract_3_reg;
 
 process_next<='0';
 X_from_pool_1_procesar_0<=X_from_pool_1_procesar_0_reg;
 X_from_pool_1_procesar_1<=X_from_pool_1_procesar_1_reg;
 X_from_pool_1_procesar_2<=X_from_pool_1_procesar_2_reg;
  X_from_pool_1_procesar_3<=X_from_pool_1_procesar_3_reg;
 if(complete_cycle_next_from_pool_1='1' or Flatten_ready_reg='1') then
        cont_depth_extract_0_next<= unsigned (Direccion_from_pool_1_0((Size_address_to_pool_1-1) downto (Size_address_to_pool_1 - log2c(Numero_filtros))));
        cont_fila_extract_0_next<= unsigned (Direccion_from_pool_1_0(((Size_address_to_pool_1 - log2c(Numero_filtros) -1)) downto (log2c(Dim_pool))));
        cont_col_extract_0_next<= unsigned (Direccion_from_pool_1_0((log2c(Dim_pool) -1) downto 0));
        X_from_pool_1_procesar_0<=Pooling_1_reg(TO_INTEGER(cont_fila_extract_0_next), TO_INTEGER(cont_col_extract_0_next), TO_INTEGER(cont_depth_extract_0_next));
        
        cont_depth_extract_1_next<= unsigned (Direccion_from_pool_1_1((Size_address_to_pool_1-1) downto (Size_address_to_pool_1 - log2c(Numero_filtros))));
        cont_fila_extract_1_next<= unsigned (Direccion_from_pool_1_1(((Size_address_to_pool_1 - log2c(Numero_filtros) -1)) downto (log2c(Dim_pool))));
        cont_col_extract_1_next<= unsigned (Direccion_from_pool_1_1((log2c(Dim_pool) -1) downto 0));
        X_from_pool_1_procesar_1<=Pooling_1_reg(TO_INTEGER(cont_fila_extract_1_next), TO_INTEGER(cont_col_extract_1_next), TO_INTEGER(cont_depth_extract_1_next));
        
        
        cont_depth_extract_2_next<= unsigned (Direccion_from_pool_1_2((Size_address_to_pool_1-1) downto (Size_address_to_pool_1 - log2c(Numero_filtros))));
        cont_fila_extract_2_next<= unsigned (Direccion_from_pool_1_2(((Size_address_to_pool_1 - log2c(Numero_filtros) -1)) downto (log2c(Dim_pool))));
        cont_col_extract_2_next<= unsigned (Direccion_from_pool_1_2((log2c(Dim_pool) -1) downto 0));
        X_from_pool_1_procesar_2<=Pooling_1_reg(TO_INTEGER(cont_fila_extract_2_next), TO_INTEGER(cont_col_extract_2_next), TO_INTEGER(cont_depth_extract_2_next));
        
        cont_depth_extract_3_next<= unsigned (Direccion_from_pool_1_3((Size_address_to_pool_1-1) downto (Size_address_to_pool_1 - log2c(Numero_filtros))));
        cont_fila_extract_3_next<= unsigned (Direccion_from_pool_1_3(((Size_address_to_pool_1 - log2c(Numero_filtros) -1)) downto (log2c(Dim_pool))));
        cont_col_extract_3_next<= unsigned (Direccion_from_pool_1_3((log2c(Dim_pool) -1) downto 0));
        X_from_pool_1_procesar_3<=Pooling_1_reg(TO_INTEGER(cont_fila_extract_3_next), TO_INTEGER(cont_col_extract_3_next), TO_INTEGER(cont_depth_extract_3_next));
        process_next<='1';
    end if;
end process;
process_next_from_pool_1<= process_reg;
Pooling_ready <= Flatten_ready_reg;


--SUMADOR POSICION FILAS Y COLUMNAS POOLING
out_suma_pooling<=in_suma_1_pooling + in_suma_2_pooling;


end Behavioral;
