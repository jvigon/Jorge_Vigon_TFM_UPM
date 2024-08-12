LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;



entity Activation_Layer_FC_120 is
         Port ( CLK : in STD_LOGIC;
                   Reset : in STD_LOGIC;
                   Finalizado_entradas : in STD_LOGIC;
                   r_suma : in STD_LOGIC_VECTOR (7 downto 0);
                   act_layer_next : out STD_LOGIC;
                   valor_y : out STD_LOGIC_VECTOR(7 downto 0));
end Activation_Layer_FC_120;

architecture Behavioral of Activation_Layer_FC_120 is

signal valor_y_reg : STD_LOGIC_VECTOR(7 downto 0);
--ESPERAR ACTIVACION
signal salida_act_10, wait_cycle_10 : std_logic;
signal cont_act_10 : unsigned (3 downto 0);
begin
process(CLK, Reset) 
begin
    if reset='0' then
        act_layer_next<= '0';
        valor_y_reg <=(others => '0');

     elsif CLK'event and CLK='1' then
                act_layer_next<='0';
                 if (salida_act_10='1') then
                    act_layer_next<='1';
                         if( unsigned(r_suma)<128) then
                            valor_y_reg <= STD_LOGIC_VECTOR(to_unsigned(128,8));
                         else
                            valor_y_reg <=r_suma; 
                         end if;
                 else
                    valor_y_reg<=valor_y_reg;
                 end if;           
     end if;
end process;
--r_suma no instantaneo con finalizado entradas, esperar unos diclo
 ESPERAR_PASO :process (clk, reset)
    begin
        if reset = '0' then
            salida_act_10 <= '0';
            wait_cycle_10 <= '0';
        elsif rising_edge(clk) then
            -- Detect edge of act_neurons
            if Finalizado_entradas = '1' and wait_cycle_10 = '0' then
                wait_cycle_10 <= '1';
                cont_act_10 <=(others => '0');
            end if;
            if wait_cycle_10 = '1' then
                if cont_act_10 = 12 then--para asegurar que acaba el comparador
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
valor_y<=valor_y_reg;
end Behavioral;

