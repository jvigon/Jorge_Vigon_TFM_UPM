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
library STD;
use STD.textio.all;                     -- basic I/O
library IEEE;
use IEEE.std_logic_1164.all;            -- basic logic types
use IEEE.std_logic_textio.all;          -- I/O for logic types

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
use work.CNN_Package.all;


entity Inputs_Weights_Controller_First is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g : in STD_LOGIC;
           valor_inical_ent_fila : in integer;
           valor_inical_ent_columna : in integer;
           Finalizado_relu : in STD_LOGIC;--INDICA QEU LA RELU HA TERMINADO Y POR TNATO EL POOL TAMBIEN(para desplazar)
           --de antes
           New_value: out STD_LOGIC; --reinicia el contador de XNOR Y ACTIVA START DE LOS LFSDR
           complete_cycle: in STD_LOGIC; --el lfsr x indica que ya ha acabado de procesar la info
           filtro : out STD_LOGIC_VECTOR ( (log2c(Numero_filtros) - 1) downto 0);
           Finalizado_filtro: out STD_LOGIC;--para que el valor pase a la relu, se ha acabado de realizar alas 75 multiplicaciones del filtro
           Xbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           Wbin_Pasar_LFSDR : out STD_LOGIC_VECTOR (7 downto 0);
           Direccion_entrada_RAM : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Valor_Entrada_RAM : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           pass_value_to_x: in STD_LOGIC;
           start_addresses: in std_logic
           );
end Inputs_Weights_Controller_First;

architecture Behavioral of Inputs_Weights_Controller_First is
SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Finalizado_filtro_next, Finalizado_filtro_reg : STD_LOGIC;--se han realizado las 75 multiplicaciones
SIGNAL X_next, X_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL X_MEM_next : STD_LOGIC_VECTOR(7 DOWNTO 0);
 
attribute keep : boolean;    
attribute keep of X_next  : signal is true;
attribute keep of W_next  : signal is true;


signal cont_f_fila_next,cont_f_fila_reg :unsigned ((log2c(Dim_filtro)-1) downto 0);
signal cont_f_col_next,cont_f_col_reg :unsigned ((log2c(Dim_filtro)-1) downto 0);
signal cont_f_depth_next,cont_f_depth_reg :unsigned ((log2c(Dim_depth_entrada)-1) downto 0);

signal cont_ent_fila_next,cont_ent_fila_reg :unsigned ((log2c(Dim_entrada)-1) downto 0);
signal cont_ent_col_next,cont_ent_col_reg :unsigned ((log2c(Dim_entrada)-1) downto 0);
signal cont_ent_depth_next,cont_ent_depth_reg :unsigned ((log2c(Dim_depth_entrada)-1) downto 0);

signal cont_pool_fila_next,cont_pool_fila_reg :unsigned ((log2c(Dim_pool)-1) downto 0);
signal cont_pool_col_next,cont_pool_col_reg :unsigned ((log2c(Dim_pool)-1) downto 0);
signal cont_pool_depth_next,cont_pool_depth_reg :unsigned ((log2c(Numero_filtros)-1) downto 0);

--signal filtro : unsigned(1 downto 0); --0 primer filtro, 1 el siguiente
signal filtro_next,filtro_reg : unsigned( (log2c(Numero_filtros) - 1) downto 0);
--anado
signal do_X_no_pad :std_logic;
signal process_siguiente_next,process_siguiente_reg :std_logic;
signal s_cambio_filtro_bias_next,s_cambio_filtro_bias_reg: std_logic;
signal desplazamiento :unsigned ((log2c(Dim_entrada)-1) downto 0); --esto para que sea 2 veces el stride
signal Finalizado_global_next,Finalizado_global_reg :std_logic;--se acaba de procesar todo para no seguir procesando

signal valor_inc_with_stride_ent_fila_next,valor_inc_with_stride_ent_fila_reg :unsigned ((log2c(Dim_entrada)-1) downto 0);--para indicar cual es la posicion a la que tienen que volver con los strides
signal valor_inc_with_stride_ent_col_next,valor_inc_with_stride_ent_col_reg :unsigned ((log2c(Dim_entrada)-1) downto 0);


--AÑADIDO PARA ROM

signal Direccion_pesos_next,Direccion_pesos_reg : unsigned((log2c(Dim_total_Pesos)-1)  downto 0);   --unsigned(7 downto 0);
signal inicializa_pesos_dir_next,inicializa_pesos_dir_reg : unsigned((log2c(Dim_total_Pesos)-1) downto 0); 
--USAR UN MISMO SUMADOR DIR PESOS
signal in_suma_1_pesos_dir,in_suma_2_pesos_dir : unsigned((log2c(Dim_total_Pesos)-1) downto 0); 
signal in_suma_1_pesos_dir_reg,in_suma_2_pesos_dir_reg : unsigned((log2c(Dim_total_Pesos)-1) downto 0); 
signal out_suma_pesos_dir : unsigned((log2c(Dim_total_Pesos)-1) downto 0); 

--USAR UN MISMO SUMADOR ENTRADA SUMADOR
signal in_suma_1_ent,in_suma_2_ent : unsigned((log2c(Dim_entrada)-1) downto 0); 
signal in_suma_1_ent_reg,in_suma_2_ent_reg : unsigned((log2c(Dim_entrada)-1) downto 0); 
signal out_suma_ent : unsigned((log2c(Dim_entrada)-1) downto 0);

--USAR UN MISMO SUMADOR ENTRADA DESPLAZAR SUMADOR
signal in_suma_1_desp_ent,in_suma_2_desp_ent : unsigned((log2c(Dim_entrada)-1) downto 0); 
signal in_suma_1_desp_ent_reg,in_suma_2_desp_ent_reg : unsigned((log2c(Dim_entrada)-1) downto 0); 
signal out_suma_ent_desp : unsigned((log2c(Dim_entrada)-1) downto 0);

--USAR UN MISMO SUMADOR COLUMNAS Y FILAS PESOS
signal in_suma_1_pesos,in_suma_2_pesos : unsigned((log2c(Dim_filtro)-1) downto 0); 
signal in_suma_1_pesos_reg,in_suma_2_pesos_reg : unsigned((log2c(Dim_filtro)-1) downto 0); 
signal out_suma_pesos : unsigned((log2c(Dim_filtro)-1) downto 0);

--USAR UN MISMO SUMADOR POOLING SUMADOR
signal in_suma_1_pool,in_suma_2_pool : unsigned((log2c(Dim_pool)-1) downto 0); 
signal in_suma_1_pool_reg,in_suma_2_pool_reg : unsigned((log2c(Dim_pool)-1) downto 0); 
signal out_suma_pool : unsigned((log2c(Dim_pool)-1) downto 0);
--signal Direccion_pesos_next,Direccion_pesos_reg : unsigned(7  downto 0);   --unsigned(7 downto 0);
--signal inicializa_pesos_dir_next,inicializa_pesos_dir_reg : unsigned(7 downto 0);
----USAR UN MISMO SUMADOR
--signal in_suma_1_pesos,in_suma_2_pesos : unsigned(7 downto 0);
--signal in_suma_1_pesos_reg,in_suma_2_pesos_reg : unsigned(7 downto 0);
--signal out_suma_pesos : unsigned(7 downto 0);
--ej primer filtro de 0 a 74 y segundo de 75 a 149
signal cambiamos_filtro : std_logic;--indico cuando se cambia el filtro

--ENTRADA:
--signal Direccion_ENT_next,Direccion_ENT_reg : STD_LOGIC_VECTOR((log2c(Dim_total_entrada)-1) downto 0);--11 downto 0
signal Direccion_ENT_next,Direccion_ENT_reg : STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);--11 downto 0
--de prueba luego borrar:

TYPE ROM_ARRAY_PESOS is Array (0 to (Dim_total_Pesos-1)) of STD_LOGIC_VECTOR(7 downto 0);--150 valores 5x5x3 y x2 al ser 2 filtros
CONSTANT ROM_PESOS: ROM_ARRAY_PESOS := (
            "01011011", 
            "01101010", 
            "01110001", 
            "01111110", 
            "10001011", 
            "10000100", 
            "01011010", 
            "10001110", 
            "10000010", 
            "10010000", 
            "01111111", 
            "01101101", 
            "01011101", 
            "01110101", 
            "01100001", 
            "10010001", 
            "10011001", 
            "01111001", 
            "01110110", 
            "10011001", 
            "01100101", 
            "10010010", 
            "10000100", 
            "10001100", 
            "01110111", 
            "10011011", 
            "01010110", 
            "10001001", 
            "10001001", 
            "01101100", 
            "01111001", 
            "01110101", 
            "01001000", 
            "10000001", 
            "10001110", 
            "01110111", 
            "10001011", 
            "10001000", 
            "10000000", 
            "01111011", 
            "01101101", 
            "01101000", 
            "01111000", 
            "10011111", 
            "01111101", 
            "01111000", 
            "10011110", 
            "01011110", 
            "10000010", 
            "10010000", 
            "10010100", 
            "01101000", 
            "10100101", 
            "10000000", 
            "01110110", 
            "10011011", 
            "01111010", 
            "01111010", 
            "01100101", 
            "01100110", 
            "10010010", 
            "10101010", 
            "01001101", 
            "01111011", 
            "10001111", 
            "01100110", 
            "01110011", 
            "01101010", 
            "01101000", 
            "10010001", 
            "10010110", 
            "01111110", 
            "10001100", 
            "10011001", 
            "01100000", 
            "01100100", 
            "10001001", 
            "10111000", 
            "01011101", 
            "01101110", 
            "10010111", 
            "10000101", 
            "01111011", 
            "10000111", 
            "10001010", 
            "10011000", 
            "10001111", 
            "01111100", 
            "01101101", 
            "01100000", 
            "01100110", 
            "01101001", 
            "10010100", 
            "01111000", 
            "10001100", 
            "10010101", 
            "01111001", 
            "10001001", 
            "01101110", 
            "10100111", 
            "10000001", 
            "01111011", 
            "10001101", 
            "10011000", 
            "01100000", 
            "01010101", 
            "01011111", 
            "10101010", 
            "10001010", 
            "01111101", 
            "10010000", 
            "01110011", 
            "01101000", 
            "01101000", 
            "01110001", 
            "01010110", 
            "10001110", 
            "10011111", 
            "10000001", 
            "01111110", 
            "01010110", 
            "01011110", 
            "10111111", 
            "01001011", 
            "01100101", 
            "10001011", 
            "01111000", 
            "01001100", 
            "10010011", 
            "01101101", 
            "01101110", 
            "10000110", 
            "01010111", 
            "01010000", 
            "10011000", 
            "01101010", 
            "10100101", 
            "11100000", 
            "01110110", 
            "10001010", 
            "11011001", 
            "01110101", 
            "10001110", 
            "11000001", 
            "01101001", 
            "10010000", 
            "10110101", 
            "01011011", 
            "01111110", 
            "11010010"

);
--El orden de la ram es fila 0 columna 0 luego pasa a columna1 fila 0 del primer color hasta completar las cinco columnas luego aumenta uno filas
--una vez realizado el primer color pasa al segundo, esto se asemeja al orden:
--Direccion_ENT_next <= STD_LOGIC_VECTOR(cont_ent_depth_reg) & STD_LOGIC_VECTOR(cont_ent_fila_reg) & STD_LOGIC_VECTOR(cont_ent_col_reg);

  begin  
PROCESS (clk,reset,valor_inical_ent_fila,valor_inical_ent_columna)
	BEGIN
		   IF reset='0' THEN
		       W_reg <= STD_LOGIC_VECTOR(TO_UNSIGNED(90,8));
		       X_reg <= (others => '0');
		       
		       cont_f_fila_reg <= (others => '0');
		       cont_f_col_reg <= (others => '0');
		       cont_f_depth_reg<= (others => '0');
		       
		       --cont_ent_fila_reg <= to_unsigned (valor_inical_ent_fila,5);
		       --cont_ent_col_reg <= to_unsigned (valor_inical_ent_columna,5);
		      -- cont_ent_fila_reg <= (others => '0');--0 para la dir entrada
		      -- cont_ent_col_reg <= (others => '0');
		       cont_ent_fila_reg <= to_unsigned (valor_inical_ent_fila,(log2c(Dim_entrada)));
		       cont_ent_col_reg <= to_unsigned (valor_inical_ent_columna,(log2c(Dim_entrada)));
		       valor_inc_with_stride_ent_fila_reg <= to_unsigned (valor_inical_ent_fila,log2c(Dim_entrada));
		       valor_inc_with_stride_ent_col_reg <= to_unsigned (valor_inical_ent_columna,log2c(Dim_entrada));
		       cont_ent_depth_reg<= (others => '0');
		       
		       cont_pool_fila_reg <= (others => '0');
		       cont_pool_col_reg <= (others => '0');
		       cont_pool_depth_reg <= (others => '0');
		       
		       s_cambio_filtro_bias_reg<='0';
		       filtro_reg<=(others => '0');
		       Finalizado_filtro_reg<='0';
		       Finalizado_global_reg<='0';
		       
		       --anadir rom
		        Direccion_pesos_reg<=(others => '0');
                inicializa_pesos_dir_reg<=(others => '0');
                                --suamdor
                in_suma_1_pesos_dir_reg<=(others => '0');
                in_suma_2_pesos_dir_reg<=(others => '0');
                
                in_suma_1_ent_reg<=(others => '0');
                in_suma_2_ent_reg<=(others => '0');
                
                in_suma_1_desp_ent_reg<=(others => '0');
                in_suma_2_desp_ent_reg<=(others => '0');
                
                in_suma_1_pool_reg<=(others => '0');
                in_suma_2_pool_reg<=(others => '0');
                
                in_suma_1_pesos_reg<=(others => '0');
                in_suma_2_pesos_reg<=(others => '0');
		   elsif CLK'event and CLK='1' then
			    New_value<='0';
			    Finalizado_filtro_reg<=Finalizado_filtro_next;
			    cont_f_fila_reg <= cont_f_fila_next;
                cont_f_col_reg<= cont_f_col_next;
                cont_f_depth_reg <= cont_f_depth_next;
                	       
		       cont_ent_fila_reg <= cont_ent_fila_next;
		       cont_ent_col_reg <= cont_ent_col_next;
		       cont_ent_depth_reg<= cont_ent_depth_next;
		       
		       cont_pool_fila_reg <= cont_pool_fila_next;
		       cont_pool_col_reg <= cont_pool_col_next;
		       cont_pool_depth_reg <= cont_pool_depth_next;
		       
		       s_cambio_filtro_bias_reg<= s_cambio_filtro_bias_next;
		       filtro_reg<=filtro_next;
		       Finalizado_global_reg <= Finalizado_global_next; --una vez que se ponga a uno se mantiene para no calcular mas
		       valor_inc_with_stride_ent_fila_reg<=valor_inc_with_stride_ent_fila_next;
               valor_inc_with_stride_ent_col_reg<=valor_inc_with_stride_ent_col_next;
				W_reg <= W_next;
				X_reg <= X_next;
				
				--añadir por rom
                Direccion_pesos_reg<=Direccion_pesos_next;
                inicializa_pesos_dir_reg<=inicializa_pesos_dir_next;
               --sumador
                in_suma_1_pesos_dir_reg<=in_suma_1_pesos_dir;
                in_suma_2_pesos_dir_reg<=in_suma_2_pesos_dir;
                
                in_suma_1_ent_reg<=in_suma_1_ent;
                in_suma_2_ent_reg<=in_suma_2_ent; 
                
                in_suma_1_desp_ent_reg<=in_suma_1_desp_ent;
                in_suma_2_desp_ent_reg<=in_suma_2_desp_ent; 
                
                in_suma_1_pool_reg<=in_suma_1_pool;
                in_suma_2_pool_reg<=in_suma_2_pool; 
                
                in_suma_1_pesos_reg<=in_suma_1_pesos;
                in_suma_2_pesos_reg<=in_suma_2_pesos;
                
				    if(Finalizado_filtro_next='1' OR Finalizado_global_reg='1') then--acaba de realizarse el filtro esperar al siguiente
				    --if(Finalizado_reg='1') then
				          New_value<='0';  
				    --elsif(( Start_g='1' OR complete_cycle='1' OR Finalizado_relu='1')and do_X_no_pad='1') then 
				    elsif(( start_addresses='1' OR pass_value_to_x='1' OR Finalizado_relu='1')and do_X_no_pad='1')then
				    --cuando la variable global start es 1 (inicio del todo) , cuando estamos en mitad del procesado del filtro (complete_cycle es 1) o cuando tenemos que empezar 
				    --de nuevo el procesamiento finalizado relu es 1, siempre y cuando no estemos en zona de padding
				    	  New_value<='1';
				    end if;	                        
			END IF;
 end process;
 --son contadores pequenos se deja asi sino no se necesitaria otro grande
PESOS_FILTRO : process(all)
BEGIN
cont_f_fila_next <= cont_f_fila_reg;
cont_f_col_next<= cont_f_col_reg;
cont_f_depth_next <= cont_f_depth_reg;
Finalizado_filtro_next<='0';
--añadir por rom
Direccion_pesos_next<=Direccion_pesos_reg;
--sumador
in_suma_1_pesos_dir<=in_suma_1_pesos_dir_reg;
in_suma_2_pesos_dir<=in_suma_2_pesos_dir_reg;

in_suma_1_pesos<=in_suma_1_pesos_reg;
in_suma_2_pesos<=in_suma_2_pesos_reg;
        if (cambiamos_filtro='1') then
            Direccion_pesos_next<=inicializa_pesos_dir_next;--0 o 75 dependiendo si se ha acabado el primer filtro
            --pongo next ya que cambia a la vez que cambiamos_filtro se pone a uno
                   --si filtro es 0 inicializa deberia ser 0 y si filro 1 inicializa deberia ser 75
                   --lo pongo aqui tambien porqeu sino no lo pilla ya que no se hace un complete_cycle a tiempo
        end if;
        --Finalizado_global_reg indica que ya acabado del todo si es uno ya ha acabado el filtrado
        --esto lo pongo porque me hacia uno de más
        if ((complete_cycle='1' OR process_siguiente_reg='1') and Finalizado_global_reg='0' ) then
            if (cont_f_depth_reg<Dim_depth_entrada-1) then
                          cont_f_depth_next <= cont_f_depth_reg + 1;--este depende de dim entrada no se puede poner en un mismo sumador con los otros dos
                          --Direccion_pesos_next<=Direccion_pesos_reg+1;
                          in_suma_1_pesos_dir<=Direccion_pesos_reg;
                          in_suma_2_pesos_dir<=to_unsigned(1,log2c(Dim_total_Pesos));
                          Direccion_pesos_next<=out_suma_pesos_dir;
                          else
                               cont_f_depth_next <= (others => '0');
                                if (cont_f_col_reg<Dim_filtro-1) then
                                    --cont_f_col_next<= cont_f_col_reg + 1;
                                    in_suma_1_pesos<=cont_f_col_reg;
                                    in_suma_2_pesos<=to_unsigned(1,log2c(Dim_filtro));
                                    cont_f_col_next<=out_suma_pesos;
                                    --Direccion_pesos_next<=Direccion_pesos_reg+1;
                                    in_suma_1_pesos_dir<=Direccion_pesos_reg;
                                    in_suma_2_pesos_dir<=to_unsigned(1,log2c(Dim_total_Pesos));
                                    Direccion_pesos_next<=out_suma_pesos_dir;
                                else 
                                        cont_f_col_next<= (others => '0');
                                        if (cont_f_fila_reg<Dim_filtro-1) then
                                            --cont_f_fila_next<= cont_f_fila_reg + 1;
                                            in_suma_1_pesos<=cont_f_fila_reg;
                                            in_suma_2_pesos<=to_unsigned(1,log2c(Dim_filtro));
                                            cont_f_fila_next<=out_suma_pesos;
                                            --Direccion_pesos_next<=Direccion_pesos_reg+1;
                                            in_suma_1_pesos_dir<=Direccion_pesos_reg;
                                            in_suma_2_pesos_dir<=to_unsigned(1,log2c(Dim_total_Pesos));
                                            Direccion_pesos_next<=out_suma_pesos_dir;
                                        else
                                            cont_f_fila_next<= (others => '0');
                                            cont_f_col_next<= (others => '0');
                                             Finalizado_filtro_next<='1';
                                            Direccion_pesos_next<=inicializa_pesos_dir_reg;--reseteamos
                                end if;
                       end if;
                 end if;
                 
         end if;
 end process;
            
 
ENTRADA_CONTROL : process(all)
BEGIN
cont_ent_fila_next <= cont_ent_fila_reg;
cont_ent_col_next<= cont_ent_col_reg;
cont_ent_depth_next <= cont_ent_depth_reg;
do_X_no_pad<='1';
process_siguiente_next<='0';
valor_inc_with_stride_ent_fila_next<=valor_inc_with_stride_ent_fila_reg;
valor_inc_with_stride_ent_col_next<=valor_inc_with_stride_ent_col_reg;

in_suma_1_ent<=in_suma_1_ent_reg;
in_suma_2_ent<=in_suma_2_ent_reg;

in_suma_1_desp_ent<=in_suma_1_desp_ent_reg;
in_suma_2_desp_ent<=in_suma_2_desp_ent_reg;
      if (Finalizado_relu='1') then
        --if (Finalizado_filtro='1') then
                    if (cont_pool_col_reg<Dim_pool-1) then
                            --valor_inc_with_stride_ent_col_next<= to_unsigned (valor_inical_ent_columna,log2c(Dim_entrada)) + desplazamiento;--desplazo 2 veces el stride derecha
                            in_suma_1_ent<=to_unsigned (valor_inical_ent_columna,log2c(Dim_entrada));
                            in_suma_2_ent<=desplazamiento;--desplazo 2 veces el stride derecha
                            valor_inc_with_stride_ent_col_next<=out_suma_ent;
                            ---cont_ent_col_next<= to_unsigned (valor_inical_ent_columna,log2c(Dim_entrada)) + desplazamiento;
                            in_suma_1_desp_ent<=to_unsigned (valor_inical_ent_columna,log2c(Dim_entrada));
                            in_suma_2_desp_ent<=desplazamiento;--desplazo 2 veces el stride derecha
                            cont_ent_col_next<=out_suma_ent_desp;
                    else 
                            if (cont_pool_fila_reg<Dim_pool-1) then
                                 cont_ent_col_next<= to_unsigned (valor_inical_ent_fila,log2c(Dim_entrada));--nueva fila reincio columna
                                 valor_inc_with_stride_ent_col_next<= to_unsigned (valor_inical_ent_fila,log2c(Dim_entrada));--nueva fila reincio columna
                                 --valor_inc_with_stride_ent_fila_next<= to_unsigned (valor_inical_ent_fila,log2c(Dim_entrada)) + desplazamiento;--desplazo 2 veces el stride abajo
                                 in_suma_1_ent<=to_unsigned (valor_inical_ent_fila,log2c(Dim_entrada));
                                 in_suma_2_ent<=desplazamiento;--desplazo 2 veces el stride derecha
                                 valor_inc_with_stride_ent_fila_next<=out_suma_ent;
                                 --cont_ent_fila_next <= to_unsigned (valor_inical_ent_fila,log2c(Dim_entrada)) + desplazamiento;
                                 in_suma_1_desp_ent<=to_unsigned (valor_inical_ent_fila,log2c(Dim_entrada));
                                 in_suma_2_desp_ent<=desplazamiento;--desplazo 2 veces el stride derecha
                                 cont_ent_fila_next<=out_suma_ent_desp;
                            else
                                valor_inc_with_stride_ent_fila_next<= to_unsigned (valor_inical_ent_fila,log2c(Dim_entrada)); --cuando cubro todos los desplazamientos de un filtro vuelvo al inicio para el siguiente
                                valor_inc_with_stride_ent_col_next<= to_unsigned (valor_inical_ent_columna,log2c(Dim_entrada));
                                cont_ent_fila_next<= to_unsigned (valor_inical_ent_fila,log2c(Dim_entrada));--reinicio filas y columnas
                                cont_ent_col_next <= to_unsigned (valor_inical_ent_columna,log2c(Dim_entrada));
                           end if;
                    end if;
        elsif ((complete_cycle='1' OR process_siguiente_reg='1') and Finalizado_global_reg='0' ) then
                if (cont_ent_col_reg< padding OR cont_ent_col_reg> ( Dim_entrada -padding)) then
                    process_siguiente_next<='1';
                    do_X_no_pad<='0';
                elsif (cont_ent_fila_reg< padding OR cont_ent_fila_reg> ( Dim_entrada -padding)) then
                    process_siguiente_next<='1';
                    do_X_no_pad<='0';
                else --no zona padding
                        do_X_no_pad<='1';
               end if;--arriba pading sin mas
               if (cont_ent_depth_reg<Dim_depth_entrada-1) then--ahora hago primero los de la capa
                              cont_ent_depth_next <= cont_ent_depth_reg + 1;--este no sigue las dimensiones de entrada sino de depth 

                      else
                              cont_ent_depth_next <= (others => '0');
               
                       if (cont_ent_col_reg<(to_integer(valor_inc_with_stride_ent_col_reg) +Dim_filtro-1)) then --actualizamos valor
                                    --cont_ent_col_next<= cont_ent_col_reg + 1;
                                  in_suma_1_ent<=cont_ent_col_reg;
                                  in_suma_2_ent<=to_unsigned(1,log2c(Dim_entrada));
                                  cont_ent_col_next<=out_suma_ent;
                       else 
                                        cont_ent_col_next<= valor_inc_with_stride_ent_col_reg;
                                        if (cont_ent_fila_reg<(to_integer(valor_inc_with_stride_ent_fila_reg) +Dim_filtro-1)) then
                                            --cont_ent_fila_next<= cont_ent_fila_reg + 1;
                                              in_suma_1_ent<=cont_ent_fila_reg;
                                              in_suma_2_ent<=to_unsigned(1,log2c(Dim_entrada));
                                              cont_ent_fila_next<=out_suma_ent;
                                        else
                                            cont_ent_fila_next<=valor_inc_with_stride_ent_fila_reg;
                                            cont_ent_col_next<= valor_inc_with_stride_ent_col_reg;
      
                                       end if;
                       end if;         
                 
                
                end if;
           end if;
 end process;
 
SALTO_BLOQUE : process(all)
BEGIN
cont_pool_fila_next <= cont_pool_fila_reg;
cont_pool_col_next<= cont_pool_col_reg;
cont_pool_depth_next <= cont_pool_depth_reg;
s_cambio_filtro_bias_next <= s_cambio_filtro_bias_reg;
Finalizado_global_next <=Finalizado_global_reg;
filtro_next<=filtro_reg;
--añadido para rom:
inicializa_pesos_dir_next<=inicializa_pesos_dir_reg;
cambiamos_filtro<= '0';

in_suma_1_pool<=in_suma_1_pool_reg;
in_suma_2_pool<=in_suma_2_pool_reg;
        if (Finalizado_relu='1') then
        --if (Finalizado_filtro='1') then
                if (cont_pool_col_reg<Dim_pool-1) then
                    --cont_pool_col_next<= cont_pool_col_reg + 1;
                    in_suma_1_pool<=cont_pool_col_reg;
                    in_suma_2_pool<=to_unsigned(1,log2c(Dim_pool));
                    cont_pool_col_next<=out_suma_pool;
                else 
                        cont_pool_col_next<= (others => '0');
                        if (cont_pool_fila_reg<Dim_pool-1) then
                            --cont_pool_fila_next<= cont_pool_fila_reg + 1;
                            in_suma_1_pool<=cont_pool_fila_reg ;
                            in_suma_2_pool<=to_unsigned(1,log2c(Dim_pool));
                            cont_pool_fila_next<=out_suma_pool;
                        else
                            cont_pool_fila_next<= (others => '0');
                            cont_pool_col_next<= (others => '0');
                            s_cambio_filtro_bias_next<='1';
                            cambiamos_filtro<= '1';
                            
                                if (cont_pool_depth_reg<Numero_filtros-1) then
                                    inicializa_pesos_dir_next<=inicializa_pesos_dir_reg + to_unsigned(Dim_total_filtro,log2c(Dim_total_Pesos));
                                    --no mismo process me da cortocircuito no puedo aprovechar el sumador de insuma
                                    filtro_next<= filtro_reg+1; --acabamos el primer filtro, pasamos al siguiente
                                    cont_pool_depth_next <= cont_pool_depth_reg + 1;--este va con numero de filtros no se puede poner en el sumador
                                else
                                    cont_pool_depth_next <= (others => '0');
                                    Finalizado_global_next<='1';
                                    --filtro_next<=to_unsigned(1,2);
                                    
                                end if;
                       end if;
                 end if;
                 
         end if;
 end process;
 
desplazamiento<= UNSIGNED(STD_LOGIC_VECTOR(TO_UNSIGNED(stride,log2c(Dim_entrada)-1) & '0'));--2 veces el stride
Finalizado_filtro <= Finalizado_filtro_reg;
Xbin_Pasar_LFSDR <= X_reg;
Wbin_Pasar_LFSDR <= W_reg;
--cambio_filtro <= s_cambio_filtro_bias_reg;--PARA QUE ME PILLE ASI LOS 4 PRIMEROS EN LA SUMA
filtro<= STD_LOGIC_VECTOR(filtro_reg);
--X_next <=   STD_LOGIC_VECTOR(TO_UNSIGNED(222,8)) when  cont_ent_fila_reg=0 and  cont_ent_col_reg=0 and cont_f_depth_reg =0 else
--            STD_LOGIC_VECTOR(TO_UNSIGNED(198,8)) when  cont_ent_fila_reg=0 and  cont_ent_col_reg=0 and cont_f_depth_reg =1 else
--            STD_LOGIC_VECTOR(TO_UNSIGNED(159,8)) when  cont_ent_fila_reg=0 and  cont_ent_col_reg=0 and cont_f_depth_reg =2 else
--            STD_LOGIC_VECTOR(TO_UNSIGNED(220,8)) when  cont_ent_fila_reg=0 and  cont_ent_col_reg=1 and cont_f_depth_reg =0 else

--X_MEM_next <= STD_LOGIC_VECTOR(TO_UNSIGNED(matriz_entrada(to_integer(cont_ent_fila_reg),to_integer(cont_ent_col_reg),to_integer(cont_ent_depth_reg)),8));

--AVION TEST FACIL 489
DIRECCION_ENTRADA: process(cont_ent_fila_reg,cont_ent_col_reg,cont_ent_depth_reg)
BEGIN
     --Direccion_ENT_next <= STD_LOGIC_VECTOR(cont_ent_fila_reg) & STD_LOGIC_VECTOR(cont_ent_col_reg) & STD_LOGIC_VECTOR(cont_ent_depth_reg);
     Direccion_ENT_next <= STD_LOGIC_VECTOR(cont_ent_depth_reg) & STD_LOGIC_VECTOR(cont_ent_fila_reg) & STD_LOGIC_VECTOR(cont_ent_col_reg);
end process;

--X_next<= ROM_ENTRADA(TO_INTEGER(UNSIGNED(Direccion_ENT_next)));
process(X_reg,pass_value_to_x,Valor_Entrada_RAM,start_addresses)
begin
X_next<=X_reg;
    if (pass_value_to_x='1' or start_addresses='1') then
        X_next<=Valor_Entrada_RAM;
    end if;
end process;
 W_next <=ROM_PESOS(TO_INTEGER(Direccion_pesos_reg));
Direccion_entrada_RAM<=Direccion_ENT_next;
--SUMADOR DIRECCIONES PESOS
out_suma_pesos_dir<=in_suma_1_pesos_dir+in_suma_2_pesos_dir;

--SUMADOR POSICION FILAS Y COLUMNAS ENTRADAS
out_suma_ent<=in_suma_1_ent + in_suma_2_ent;

--SUMADOR DESPLAZAMIENTO ENTRADA
out_suma_ent_desp<=in_suma_1_desp_ent + in_suma_2_desp_ent;

--SUMADOR POSICION FILAS Y COLUMNAS PESOS
out_suma_pesos<=in_suma_1_pesos + in_suma_2_pesos;

--SUMADOR POSICION FILAS Y COLUMNAS POOLING
out_suma_pool<=in_suma_1_pool + in_suma_2_pool;
--Finalizado <= Finalizado_reg;
end Behavioral;
