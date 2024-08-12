

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
use work.CNN_Package_First_Convolution.all;

entity LENET_5_CNN_MNSIT   is
        Port ( CLK : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in std_logic;
           Sol_Display     : out std_logic_vector(6 downto 0);   
           ndisplay     : out std_logic_vector(7 downto 0);
           number_det_output: out std_logic_vector(3 downto 0);
           finish_mnsit : out std_logic;
           --RAM
           address_uart : in STD_LOGIC_VECTOR(log2c(Dim_total_Entrada) - 1 downto 0);--Dim_total_Entrada=784
           wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
           ena : IN STD_LOGIC;
           dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
           en_riscv : OUT STD_LOGIC
           ); 
end LENET_5_CNN_MNSIT;

architecture Behavioral of LENET_5_CNN_MNSIT is

component Primera_convolucion
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           --Start_g : in STD_LOGIC;
           Pool_1_ready : out STD_LOGIC;
           --RAM
           Direccion_entrada_RAM_0 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Direccion_entrada_RAM_1 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Direccion_entrada_RAM_2 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Direccion_entrada_RAM_3 : out STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
           Valor_entrada_0 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           Valor_entrada_1 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           Valor_entrada_2 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           Valor_entrada_3 : in STD_LOGIC_VECTOR(7 DOWNTO 0);
           complete_cycle_next_input :out STD_LOGIC;
           process_next_input: in STD_LOGIC;---SE HAN cambiado el valor de los 4
           start_addresses: in std_logic;
           
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
         end component; 
              
component Segunda_convolucion
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           --Start_g : in STD_LOGIC;
           
           X_to_pool_1_procesar_0: in STD_LOGIC_VECTOR (7 downto 0);
           X_to_pool_1_procesar_1: in STD_LOGIC_VECTOR (7 downto 0);
           X_to_pool_1_procesar_2: in STD_LOGIC_VECTOR (7 downto 0);
           X_to_pool_1_procesar_3: in STD_LOGIC_VECTOR (7 downto 0);
           Direccion_to_pool_1_0: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);--de 864 12*12*6
           Direccion_to_pool_1_1: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_to_pool_1_2: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           Direccion_to_pool_1_3: out STD_LOGIC_VECTOR ((Size_address_to_pool_1-1) downto 0);
           complete_cycle_next_input_2_capa :out STD_LOGIC;
           process_next_input_2_capa: in STD_LOGIC;---SE HAN cambiado el valor de los 4
           
           --esto fc
           Nueva_entrada_solicitud_from_fc_120: in STD_LOGIC;
           X_pass_to_fc_120: out STD_LOGIC_VECTOR (7 downto 0);
           Pool_2_is_ready : out STD_LOGIC);
         end component;  
          
  component FC_120_top
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           sol_from_84: in STD_LOGIC;
           act_layer_next_top : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           resultado_fc_120: out std_logic_vector(7 downto 0)
           );
   end component;    
   
 component FC_84_top
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           sol_from_10: in STD_LOGIC;
           act_layer_next_top_84 : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           resultado_fc_84: out std_logic_vector(7 downto 0)
           );
   end component;
   
 component FC_10_top
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           finish_10: out std_logic;
           number_detected: out STD_LOGIC_VECTOR((log2c(Maximo_numero_Detect)-1) downto 0)
           );
   end component;  
   
-- component ROM_MNSIT
--        Port ( CLK : in STD_LOGIC;
--           Reset : in STD_LOGIC;
--           addra : IN STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
--           douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
--           );
--         end component;
    COMPONENT RAM_MNSIT IS
      PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
        dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
      END COMPONENT;
signal s_Nueva_entrada_solicitud_from_sec_cnn,s_Nueva_entrada_solicitud_from_fc_120 : std_logic;
signal s_X_pass_to_sec_cnn,s_X_pass_to_fc_120:  std_logic_vector ( 7 downto 0);
signal no_use_cnn,no_use_to_fc_120:  std_logic_vector ( 7 downto 0);
signal no_use_solicitud_from_fc_120 :std_logic;

signal no_use : std_logic;


    signal contador : UNSIGNED(13 downto 0):=(others => '0');
    signal cont_disp_LH  :   UNSIGNED(1 downto 0):=(others => '0');
    signal std_cont_disp_LH  :   std_logic_vector(1 downto 0):=(others => '0');

  signal Start_g  :   std_logic;  
  signal pulsacion: std_logic; 

signal s_valor_final_pool: STD_LOGIC_VECTOR (7 downto 0); 
signal s_Pool_bloque_ready_4 : STD_LOGIC;
signal s_Flatten_ready : STD_LOGIC;

---IRENE
signal address_cnn_0,address_cnn_1,address_cnn_2,address_cnn_3,address_neural,address_neural_reg,address_ram : STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
signal s_Valor_entrada_0_next, s_Valor_entrada_0_reg,s_Valor_entrada_1_next,s_Valor_entrada_1_reg,s_Valor_entrada_2_next,s_Valor_entrada_2_reg,s_Valor_entrada_3_next,s_Valor_entrada_3_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal contador_entrada_ram_next,contador_entrada_ram_reg,contador_espera_ram_next,contador_espera_ram_reg: unsigned(2 downto 0);
signal s_process_next_input_next,s_process_next_input_reg : std_logic;
signal s_process_next_input,s_complete_cycle_next_input: std_logic;
signal pasar_datos_next,pasar_datos_reg : std_logic;
signal cambio_filtro_next,cambio_filtro_reg : std_logic;

signal start_do_not_pass_next,start_do_not_pass_reg: std_logic;--hacer que solo pasen las addrress para que lo pille bien al principio, pero que no pasemos aun al siguiente dato
signal start_addresses_next,start_addresses_reg : std_logic;
---prueba rom
signal valor_entrada_ram : STD_LOGIC_VECTOR (7 downto 0); 


signal s_resultado_total:std_logic_vector((7+log2c(Rango_Normalizacion_FC_final)+1) downto 0);


signal s_Pool_1_ready: STD_LOGIC;
signal s_Pool_2_ready: STD_LOGIC;


--POOL 1
signal s_X_pool_1_procesar_0,s_X_pool_1_procesar_1,s_X_pool_1_procesar_2,s_X_pool_1_procesar_3 : STD_LOGIC_VECTOR (7 downto 0);
signal s_Direccion_pool_1_0,s_Direccion_pool_1_1,s_Direccion_pool_1_2,s_Direccion_pool_1_3 : STD_LOGIC_VECTOR((Size_address_to_pool_1-1) downto 0);
signal s_complete_cycle_pool_1,s_process_pool_1 : STD_LOGIC;

--FC 120
signal s_FC_120_ready: std_logic;
signal s_resultado_fc_120 : STD_LOGIC_VECTOR (7 downto 0);

--FC 84
signal s_solicitud_from_84 :std_logic;
--signal s_value_to_84 : STD_LOGIC_VECTOR (7 downto 0);s_resultado_fc_120
signal s_resultado_fc_84 : STD_LOGIC_VECTOR (7 downto 0);
signal s_FC_84_ready: std_logic;


--FC 10
signal s_solicitud_from_10 :std_logic;
signal s_value_to_10 : STD_LOGIC_VECTOR (7 downto 0);
signal s_resultado_fc_10 : STD_LOGIC_VECTOR (7 downto 0);
signal s_FC_10_ready: std_logic;
signal s_number_detected: STD_LOGIC_VECTOR(3 downto 0);
signal s_finish_mnsit: std_logic:='0';


--CONTROLAR CUANDO FUNCIONA LA RED

TYPE state_type IS (IDLE, ACTIVE);
SIGNAL state_reg, state_next : state_type;

--start
signal start_reg, start_prev,start_detected : STD_LOGIC;


begin


mutiplexation:  process (clk, reset)
                begin
                    if reset = '0' then 
                        cont_disp_LH <= (others => '0');
                        contador <= (others => '0');
                       -- disp <= X"00";--iniciamos iluminando el display de l
                    elsif clk'event and clk = '1' then 
                        if contador  < 10000 then 
                            contador  <= contador  +1;
                        else
                            contador  <= (others => '0');
                            cont_disp_LH <= cont_disp_LH +1;
                        end if;
                            std_cont_disp_LH <= std_logic_vector(cont_disp_LH);
                    end if;                            
                end process mutiplexation;
                


process(clk, reset)
    begin
        if reset = '0' then
            start_reg <= '0';
            start_prev <= '0';
            state_reg <= IDLE;
        elsif rising_edge(clk) then
            start_prev <= start_reg;
            start_reg <= start;
            state_reg <= state_next;
        end if;
end process;

process(start_reg, start_prev)
    begin
        if start_prev = '0' and start_reg = '1' then
            start_detected <= '1';
        else
            start_detected <= '0';
        end if;
end process;
start_g<=start_detected;

process(state_reg, start_g, s_finish_mnsit)
begin
    case state_reg is
        when IDLE =>
            if start_g = '1' then
                state_next <= ACTIVE;
            else
                state_next <= IDLE;
            end if;
        when ACTIVE =>
            if s_finish_mnsit = '1' then
                state_next <= IDLE;
            else
                state_next <= ACTIVE;
            end if;
        when others =>
            state_next <= IDLE;
    end case;
end process;

process(state_reg)
begin
    case state_reg is
        when IDLE =>
            en_riscv <= '0';
        when ACTIVE =>
            en_riscv <= '1';
        when others =>
            en_riscv <= '0';
    end case;
end process;

--MULTIPLEXACION ENTRADA  
  MULTIPLEXACION_RAM : process(all)
BEGIN
        if (cambio_filtro_reg='1') then
                if (contador_entrada_ram_reg=0) then
                    address_neural<=address_cnn_0;
                  elsif (contador_entrada_ram_reg=1) then
                    address_neural<=address_cnn_1;
                 elsif (contador_entrada_ram_reg=2) then
                    address_neural<=address_cnn_2;
                else
                    address_neural<=address_cnn_3;
               end if;
         else 
            address_neural<=address_neural_reg;
         end if;
 end process;
  
   PROCESS (clk,reset)
	BEGIN
		   IF reset='0' THEN
                s_Valor_entrada_0_reg<=(others => '0');
                s_Valor_entrada_1_reg<=(others => '0');
                s_Valor_entrada_2_reg<=(others => '0');
                s_Valor_entrada_3_reg<=(others => '0');
                contador_entrada_ram_reg<=(others => '0');
                contador_entrada_ram_reg<=(others => '0');
                s_process_next_input_reg<='0';
                pasar_datos_reg<='0';
                start_do_not_pass_reg<='0';
                
                address_neural_reg<=(others => '0');
		   elsif CLK'event and CLK='1' then
                s_Valor_entrada_0_reg <= s_Valor_entrada_0_next;
                s_Valor_entrada_1_reg <= s_Valor_entrada_1_next;
                s_Valor_entrada_2_reg <= s_Valor_entrada_2_next;
                s_Valor_entrada_3_reg <= s_Valor_entrada_3_next;
                contador_entrada_ram_reg<=contador_entrada_ram_next;
                contador_espera_ram_reg <= contador_espera_ram_next;
                pasar_datos_reg<=pasar_datos_next;
                s_process_next_input_reg<= s_process_next_input_next;
                cambio_filtro_reg<=cambio_filtro_next;
                start_do_not_pass_reg<=start_do_not_pass_next;
                start_addresses_reg<=start_addresses_next;
                
                address_neural_reg<=address_neural;

        end if;	
 end process;
                       
 process (all)
 begin
s_process_next_input_next<='0';
cambio_filtro_next<='0';
contador_entrada_ram_next<=contador_entrada_ram_reg;
contador_espera_ram_next <= contador_espera_ram_reg;
pasar_datos_next<=pasar_datos_reg;

s_Valor_entrada_0_next <= s_Valor_entrada_0_reg;
s_Valor_entrada_1_next <= s_Valor_entrada_1_reg;
s_Valor_entrada_2_next <= s_Valor_entrada_2_reg;
s_Valor_entrada_3_next <= s_Valor_entrada_3_reg;

start_do_not_pass_next<=start_do_not_pass_reg;
start_addresses_next<='0';
    if (start_g='1') then
			  pasar_datos_next<='1';
			  cambio_filtro_next<='1';
			  start_do_not_pass_next<='1';
			  
    end if;
    if (s_complete_cycle_next_input='1') then
			  pasar_datos_next<='1';
			  cambio_filtro_next<='1';
    end if;
    if (pasar_datos_reg='1') then
				   if(contador_espera_ram_reg<5)then--sino hace automatico el paso la RAm
				        contador_espera_ram_next<= contador_espera_ram_reg +1;
				   else
				        contador_espera_ram_next<=(others => '0');
				        if (contador_entrada_ram_reg=0) then
                            s_Valor_entrada_0_next<=Valor_entrada_ram;
                         elsif (contador_entrada_ram_reg=1) then
                            s_Valor_entrada_1_next<=Valor_entrada_ram;
                        elsif (contador_entrada_ram_reg=2) then
                            s_Valor_entrada_2_next<=Valor_entrada_ram;
                        elsif (contador_entrada_ram_reg=3) then
                            s_Valor_entrada_3_next<=Valor_entrada_ram;
                       end if;				        

				        if(contador_entrada_ram_reg<=2) then
				                contador_entrada_ram_next<=contador_entrada_ram_reg+1;
				                cambio_filtro_next<='1';
				        else
				              contador_entrada_ram_next<=(others => '0');
				              --s_process_next_input_next<='1';
				              if (start_do_not_pass_reg='1') then
				                    s_process_next_input_next<='0';
				                    start_do_not_pass_next<='0';
				                    start_addresses_next<='1';
				              else
				                    s_process_next_input_next<='1';
				              end if;
				              pasar_datos_next<='0';
				       end if;	                        
			     end if;
	 end if;
  end process;	

         
 s_process_next_input<=s_process_next_input_reg; 
 Primera_Conv_CNN: Primera_Convolucion
    port map (
           Reset => Reset,
           CLK => Clk,
           --Start_g => Start_g,
           Pool_1_ready => s_Pool_1_ready,
           --RAM
           Direccion_entrada_RAM_0=>address_cnn_0,
           Direccion_entrada_RAM_1=>address_cnn_1,
           Direccion_entrada_RAM_2=>address_cnn_2,
           Direccion_entrada_RAM_3=>address_cnn_3,
           Valor_entrada_0 => s_Valor_entrada_0_reg,
           Valor_entrada_1 => s_Valor_entrada_1_reg,
           Valor_entrada_2 =>s_Valor_entrada_2_reg,
           Valor_entrada_3 => s_Valor_entrada_3_reg,
           complete_cycle_next_input=>s_complete_cycle_next_input,
           process_next_input => s_process_next_input,
           start_addresses=>start_addresses_reg,
           
           --PARA POOL 1
           X_from_pool_1_procesar_0 => s_X_pool_1_procesar_0,
           X_from_pool_1_procesar_1 => s_X_pool_1_procesar_1,
           X_from_pool_1_procesar_2 => s_X_pool_1_procesar_2,
           X_from_pool_1_procesar_3 => s_X_pool_1_procesar_3,
           Direccion_from_pool_1_0 => s_Direccion_pool_1_0,
           Direccion_from_pool_1_1 => s_Direccion_pool_1_1,
           Direccion_from_pool_1_2 => s_Direccion_pool_1_2,
           Direccion_from_pool_1_3 => s_Direccion_pool_1_3,
           
           complete_cycle_next_from_pool_1=> s_complete_cycle_pool_1,
           process_next_from_pool_1 => s_process_pool_1
           );
           
        
Second_Conv_CNN: Segunda_Convolucion
    port map (
           Reset => Reset,
           CLK => Clk,
            
           --POOL1
           X_to_pool_1_procesar_0 => s_X_pool_1_procesar_0,
           X_to_pool_1_procesar_1 => s_X_pool_1_procesar_1,
           X_to_pool_1_procesar_2 => s_X_pool_1_procesar_2,
           X_to_pool_1_procesar_3 => s_X_pool_1_procesar_3,
           Direccion_to_pool_1_0 => s_Direccion_pool_1_0,
           Direccion_to_pool_1_1 => s_Direccion_pool_1_1,
           Direccion_to_pool_1_2 => s_Direccion_pool_1_2,
           Direccion_to_pool_1_3 => s_Direccion_pool_1_3,
           
           complete_cycle_next_input_2_capa=> s_complete_cycle_pool_1,
           process_next_input_2_capa => s_process_pool_1,
           Nueva_entrada_solicitud_from_fc_120=>s_Nueva_entrada_solicitud_from_fc_120,
           X_pass_to_fc_120=>s_X_pass_to_fc_120,
           Pool_2_is_ready => s_Pool_2_ready
                     
           ); 
--fc 120
FC_120_Global :FC_120_top    
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>s_X_pass_to_fc_120,
        Start_g =>  s_Pool_2_ready,
        sol_from_84=>s_solicitud_from_84,
        Solicitud_nuevo_valor_pooling => s_Nueva_entrada_solicitud_from_fc_120,
        act_layer_next_top => s_FC_120_ready,
        resultado_fc_120 => s_resultado_fc_120
        );
FC_84_Global :FC_84_top    
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>s_resultado_fc_120,
        Start_g =>  s_FC_120_ready,
        sol_from_10=>s_solicitud_from_10,
        Solicitud_nuevo_valor_pooling => s_solicitud_from_84,
        act_layer_next_top_84 => s_FC_84_ready,
        resultado_fc_84 => s_resultado_fc_84
        );
        
FC_10_Global :FC_10_top    
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>s_resultado_fc_84,
        Start_g =>  s_FC_84_ready,
        Solicitud_nuevo_valor_pooling => s_solicitud_from_10,
        finish_10=>s_finish_mnsit,
        number_detected=>s_number_detected
        ); 
                       

address_ram <= address_neural when en_riscv = '1' else address_uart; 
RAM_ENTRADA_MNSIT : RAM_MNSIT
    PORT MAP(
        clka => clk,
        ena => ena,
        wea => wea,
        addra => address_ram,
        dina => dina,
        douta => Valor_entrada_ram
    );
    
 
 
--MULTIPLEXACION FINAL
    Sol_Display <=  "1000000" WHEN s_finish_mnsit='1' and s_number_detected="0000" else  -- 0, 1& es DP que siempre apagado
              "1111001" WHEN s_finish_mnsit='1' and s_number_detected="0001" else  --1
              "0100100" WHEN s_finish_mnsit='1' and s_number_detected="0010" else  --2
              "0110000" WHEN s_finish_mnsit='1' and s_number_detected="0011" else  --3
              "0011001" WHEN s_finish_mnsit='1' and s_number_detected="0100" else  --4
              "0010010" WHEN s_finish_mnsit='1' and s_number_detected="0101" else  --5
              "0000010" WHEN s_finish_mnsit='1' and s_number_detected="0110" else  --6
              "1111000" WHEN s_finish_mnsit='1' and s_number_detected="0111" else  -- 7
              "0000000" WHEN s_finish_mnsit='1' and s_number_detected="1000" else  -- 8
              "0010000" WHEN s_finish_mnsit='1' and s_number_detected="1001" else  -- 9
              "0111111";-- WHEN OTHERS;   
      nDisplay <= "11111110";        
finish_mnsit<=s_finish_mnsit;
number_det_output<=s_number_detected;
end Behavioral;
