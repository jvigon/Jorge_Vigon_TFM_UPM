----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2024 18:59:36
-- Design Name: 
-- Module Name: Neurona_Full_Connected - Behavioral
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
use work.CNN_Package.all;
--use work.FC_Package.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CNN_AVION_RANA  is
    Port (clk : in STD_LOGIC;
          rst : in STD_LOGIC;
          an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
          seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
          y : OUT STD_LOGIC;
          wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          ena : IN STD_LOGIC;
          dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
          en_riscv : OUT STD_LOGIC;
          address_uart : in STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 downto 0);
          resultado_final : out std_logic_vector((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
          start : in std_logic;
          finish_neural_detect : out std_logic);
end CNN_AVION_RANA;

architecture Behavioral of CNN_AVION_RANA  is

         
component CNN_Filtro_4_Paralelo
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g : in STD_LOGIC;
           Valor_final_pool_4 : out STD_LOGIC_VECTOR (7 downto 0);
           Pool_bloque_ready_4: out STD_LOGIC;
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
           start_addresses: in std_logic
           );
         end component;
         
 component Flatten --recoge lo que llega y lo pasa a las salidas que luego iran a las fully connected
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Pool_bloque_ready_4: in STD_LOGIC;
           Valor_final_pool_4 : in STD_LOGIC_VECTOR (7 downto 0);
           Num_entradas : in integer;
           Nueva_entrada_fc: in STD_LOGIC;
           X_pasar_siguiente_capa: out STD_LOGIC_VECTOR (7 downto 0);
           Flatten_ready : out STD_LOGIC
           );
         end component;    
             
component Neuron_Full_Connected_Sigmoid
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           act_layer_next : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
            resultado_total: out std_logic_vector((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
           y : out STD_LOGIC);
         end component;
         
 component ROM_RANA_AVION
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
           douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
         end component;
         
    COMPONENT RAM_ENTRADA_AVION_RANA IS
      PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        --addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
        dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT LED IS
      PORT (
        clk : IN STD_LOGIC;
        resultado_total : IN STD_LOGIC_VECTOR((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
        --address_uart_ver_led : in STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 downto 0);
        an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
      );
    END COMPONENT;

signal solictud_nueva_entrada : std_logic;
signal siguiente_entrada_procesar :  std_logic_vector ( 7 downto 0);
signal s_act_layer_next : std_logic;


--signal output_1_4 : std_logic_vector ( 7 downto 0);

    signal contador : UNSIGNED(5 downto 0):=(others => '0');
    signal cont_disp_LH  :   UNSIGNED(1 downto 0):=(others => '0');
    signal std_cont_disp_LH  :   std_logic_vector(1 downto 0):=(others => '0');
    
 signal Reset  :   std_logic;   
  signal Start_g  :   std_logic;  
  signal pulsacion: std_logic; 
  signal y_final: std_logic; 
  

--NUEVO CNN
--signal s_finalizado_global_filtro: std_logic; 
signal s_valor_final_pool: STD_LOGIC_VECTOR (7 downto 0); 
signal s_Pool_bloque_ready_4 : STD_LOGIC;
signal s_Flatten_ready : STD_LOGIC;

---IRENE
signal address_cnn_0,address_cnn_1,address_cnn_2,address_cnn_3,address,address_neural,address_neural_reg : STD_LOGIC_VECTOR((log2c(Dim_total_Entrada)-1) downto 0);
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
signal valor_entrada_rom : STD_LOGIC_VECTOR (7 downto 0); 

signal s_resultado_total:std_logic_vector((7+log2c(Rango_Normalizacion_FC)+1) downto 0);


--CONTROLAR CUANDO FUNCIONA LA RED

TYPE state_type IS (IDLE, ACTIVE);
SIGNAL state_reg, state_next : state_type;

--start
signal start_reg, start_prev,start_detected : STD_LOGIC;
signal finish_reg, finish_prev,finish_detected_next,finish_detected_reg : STD_LOGIC;
begin
y<=y_final;
Reset<=rst;

process(clk, reset)
    begin
        if reset = '0' then
            start_reg <= '0';
            start_prev <= '0';
            finish_reg<='0';
            finish_prev<='0';
            finish_detected_reg<='0';
        elsif rising_edge(clk) then
            start_prev <= start_reg;
            start_reg <= start;
            finish_prev <= finish_reg;
            finish_reg <= s_act_layer_next;
            finish_detected_reg<=finish_detected_next;
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

process(finish_reg, finish_prev,finish_detected_reg)
    begin
    finish_detected_next<=finish_detected_reg;
        if finish_prev = '0' and finish_reg = '1' then
            finish_detected_next <= '1';
        end if;
end process;
finish_neural_detect<=finish_detected_reg;

process(clk, reset)
begin
    if reset = '0' then
        state_reg <= IDLE;
    elsif rising_edge(clk) then
        state_reg <= state_next;
    end if;
end process;

-- Next state logic
process(state_reg, start_g, s_act_layer_next)
begin
    case state_reg is
        when IDLE =>
            if start_g = '1' then
                state_next <= ACTIVE;
            else
                state_next <= IDLE;
            end if;
        when ACTIVE =>
            if s_act_layer_next = '1' then
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

Filtrado_4_Paralelo_completo: CNN_Filtro_4_Paralelo
    port map (
           Reset => Reset,
           CLK => Clk,
           Start_g =>  Start_g,
           valor_final_pool_4  => s_valor_final_pool,
           Pool_bloque_ready_4 => s_Pool_bloque_ready_4,
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
           start_addresses=>start_addresses_reg
           );
Conv_Flatten: Flatten
    port map (
           Reset => Reset,
           CLK => Clk,
           --Finalizado_global_filtro => s_finalizado_global_filtro,
           Valor_final_pool_4 => s_valor_final_pool,
           Pool_bloque_ready_4 => s_Pool_bloque_ready_4,
           Num_entradas => 8,
           Nueva_entrada_fc =>solictud_nueva_entrada,
           X_pasar_siguiente_capa =>siguiente_entrada_procesar,
           Flatten_ready => s_Flatten_ready
           );             

        
--SEGUNDA CAPA:        
Neuron_2_0: Neuron_Full_Connected_Sigmoid
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>siguiente_entrada_procesar,
        Start_g =>  s_flatten_ready,
        Solicitud_nuevo_valor_pooling => solictud_nueva_entrada,
        act_layer_next => s_act_layer_next,
        resultado_total => resultado_final,
        --indica_final => indica_final,
        y => y_final);
        
--address <= address_neural when en_riscv_buff = '1' else address_uart; 
address <= address_neural when en_riscv = '1' else address_uart; 
Mem_Prueba : RAM_ENTRADA_AVION_RANA
    PORT MAP(
        clka => clk,
        ena => ena,
        wea => wea,
        addra => address,
        dina => dina,
        douta => Valor_entrada_ram
    );

           
 LED_NUMEROS: LED  
    PORT MAP(
           clk => clk,
           resultado_total=>s_resultado_total,
           --address_uart_ver_led=>address_uart,
           an=> an,
           seg=>seg
           );        
MULTIPLEXACION_RAM : process(all)
BEGIN
        if (cambio_filtro_reg='1' or start_g='1') then--evitar corto principio
                if (contador_entrada_ram_reg=0) then
                   address_neural<=address_cnn_0;
                  elsif (contador_entrada_ram_reg=1) then
                    address_neural<=address_cnn_1;
                 elsif (contador_entrada_ram_reg=2) then
                    address_neural<=address_cnn_2;
                --elsif (contador_entrada_ram_reg=3) then
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
                contador_espera_ram_reg<=(others => '0');
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
                            s_Valor_entrada_0_next<=valor_entrada_ram;
                         elsif (contador_entrada_ram_reg=1) then
                            s_Valor_entrada_1_next<=valor_entrada_ram;
                        elsif (contador_entrada_ram_reg=2) then
                            s_Valor_entrada_2_next<=valor_entrada_ram;
                        elsif (contador_entrada_ram_reg=3) then
                            s_Valor_entrada_3_next<=valor_entrada_ram;
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
s_resultado_total<=resultado_final;
--finish_neural<=s_act_layer_next;
end Behavioral;
