LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
use work.Package_FC_10.all;


entity FC_10_top is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           finish_10 : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           number_detected: out STD_LOGIC_VECTOR(3 downto 0)
           );
end FC_10_top;

architecture Behavioral of FC_10_top is
 component Neurona_FC_10_0
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           act_layer_next : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_10_1
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;
component Neurona_FC_10_2
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;          
component Neurona_FC_10_3
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;
component Neurona_FC_10_4
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;   
component Neurona_FC_10_5
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;
component Neurona_FC_10_6
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;    
component Neurona_FC_10_7
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;
component Neurona_FC_10_8
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;   
component Neurona_FC_10_9
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
           end component;
                                                      
signal finalizado_fully : std_logic;
          
signal s_resultado_neurona_fc_10_0,s_resultado_neurona_fc_10_1,s_resultado_neurona_fc_10_2,s_resultado_neurona_fc_10_3,s_resultado_neurona_fc_10_4,s_resultado_neurona_fc_10_5,s_resultado_neurona_fc_10_6,s_resultado_neurona_fc_10_7,s_resultado_neurona_fc_10_8,s_resultado_neurona_fc_10_9: std_logic_vector(7 downto 0);

--ESPERAR ACTIVACION
signal salida_act_10, wait_cycle_10 : std_logic;
signal cont_act_10 : unsigned (4 downto 0);

--para ver maximo
signal max_val : STD_LOGIC_VECTOR(7 downto 0);
signal temp_index, max_index_next,max_index_reg : STD_LOGIC_VECTOR(3 downto 0);
--finish
signal finish_next, finish_reg : std_logic;

begin
NEURONA_FC_10_0_Nueron: Neurona_FC_10_0
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_0,
        Solicitud_nuevo_valor_pooling => Solicitud_nuevo_valor_pooling,
        act_layer_next => finalizado_fully,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_0
        );
NEURONA_FC_10_1_Nueron: Neurona_FC_10_1
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_1,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_1
        );
NEURONA_FC_10_2_Nueron: Neurona_FC_10_2
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_2,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_2
        );
NEURONA_FC_10_3_Nueron: Neurona_FC_10_3
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_3,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_3
        );  
NEURONA_FC_10_4_Nueron: Neurona_FC_10_4
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_4,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_4
        );
NEURONA_FC_10_5_Nueron: Neurona_FC_10_5
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_5,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_5
        );      
NEURONA_FC_10_6_Nueron: Neurona_FC_10_6
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_6,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_6
        );
NEURONA_FC_10_7_Nueron: Neurona_FC_10_7
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_7,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_7
        ); 
NEURONA_FC_10_8_Nueron: Neurona_FC_10_8
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_8,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_8
        );
NEURONA_FC_10_9_Nueron: Neurona_FC_10_9
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_10_NEURON_9,
        resultado_neurona_fc_10 => s_resultado_neurona_fc_10_9
        );   
 ESPERAR_ACTIVATION :process (clk, reset)
    begin
        if reset = '0' then
            salida_act_10 <= '0';
            wait_cycle_10 <= '0';
            finish_reg<='0';
            max_index_reg<=(others => '0');
        elsif rising_edge(clk) then
            finish_reg<=finish_next;
            max_index_reg<=max_index_next;
            -- Detect edge of act_neurons
            if finalizado_fully = '1' and wait_cycle_10 = '0' then
                wait_cycle_10 <= '1';
                cont_act_10 <=(others => '0');
            end if;
            if wait_cycle_10 = '1' then
                if cont_act_10 = 20 then--para asegurar que acaba el comparador
                    salida_act_10 <= '1';
                    wait_cycle_10 <= '0';
                    cont_act_10<=(others => '0');
                else
                    salida_act_10 <= '0';
                    cont_act_10 <= cont_act_10 + 1;
                end if;
            else
                salida_act_10 <= '0';
            end if;
        end if;
    end process;
FINISH_ACTIVATION :process (salida_act_10, finish_next,finish_reg,max_index_reg,temp_index)
    begin
    finish_next<=finish_reg;
    max_index_next<=max_index_reg;
        if salida_act_10 = '1' then
            finish_next<='1';  
            max_index_next<=temp_index;
        end if; 
end process;      
COMPARADOR : process(clk,reset)
    begin
    if reset='0' then
            max_val <= (others => '0');
            temp_index <= "0000";
           
        elsif rising_edge(clk) then
            
            if unsigned(s_resultado_neurona_fc_10_0) > unsigned(max_val) then
                max_val <= s_resultado_neurona_fc_10_0;
                temp_index <= "0000";
            end if;

            if unsigned(s_resultado_neurona_fc_10_1) > unsigned(max_val) then
                max_val <= s_resultado_neurona_fc_10_1;
                temp_index <= "0001";
            end if;

            if unsigned(s_resultado_neurona_fc_10_2) > unsigned(max_val) then
                max_val <= s_resultado_neurona_fc_10_2;
                temp_index <= "0010";
            end if;

            if unsigned(s_resultado_neurona_fc_10_3) > unsigned(max_val) then
                max_val <= s_resultado_neurona_fc_10_3;
                temp_index <= "0011";
            end if;

            if unsigned(s_resultado_neurona_fc_10_4) > unsigned(max_val) then
                max_val <= s_resultado_neurona_fc_10_4;
                temp_index <= "0100";
            end if;

            if unsigned(s_resultado_neurona_fc_10_5) > unsigned(max_val) then
                max_val <= s_resultado_neurona_fc_10_5;
                temp_index <= "0101";
            end if;

            if unsigned(s_resultado_neurona_fc_10_6) > unsigned(max_val) then
                max_val <= s_resultado_neurona_fc_10_6;
                temp_index <= "0110";
            end if;

            if unsigned(s_resultado_neurona_fc_10_7) > unsigned(max_val) then
                max_val <= s_resultado_neurona_fc_10_7;
                temp_index <= "0111";
            end if;

            if unsigned(s_resultado_neurona_fc_10_8) > unsigned(max_val) then
                max_val <= s_resultado_neurona_fc_10_8;
                temp_index <= "1000";
            end if;


            if ((unsigned(s_resultado_neurona_fc_10_9)> unsigned(max_val)) and (unsigned(s_resultado_neurona_fc_10_9) >=30))  then
                max_val <= s_resultado_neurona_fc_10_9;
                temp_index <= "1001";
                --si valores muy pequeños que no clasifica bien se confunde y los pone como 9, esto pasa a veces con los doses, se ha visto en test
            elsif ((unsigned(s_resultado_neurona_fc_10_9)> unsigned(max_val)) and (unsigned(s_resultado_neurona_fc_10_9)<30)) then
                max_val <= s_resultado_neurona_fc_10_9;
                temp_index <= "0010";
            end if;
        end if;
    end process;
--salidas
number_detected<=max_index_reg;
finish_10<=finish_reg;                               
end Behavioral;
