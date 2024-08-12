LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity LFSR_Solo is
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Ident : in STD_LOGIC;
           Start : in STD_LOGIC;
           complete_cycle : out STD_LOGIC;
           stop : out STD_LOGIC;
           act_next_layer_ADD: out STD_LOGIC;
           o_sequence : out STD_LOGIC_VECTOR (7 downto 0));
end LFSR_Solo;

architecture Behavioral of LFSR_Solo is

SIGNAL lfsr : STD_LOGIC_VECTOR(8 downto 1);
SIGNAL s_stop : STD_LOGIC:= '1';
SIGNAL s_activacion  : STD_LOGIC:= '0';--para comparar las señales un ciclo despues de la señal start
SIGNAL cont: unsigned (7 downto 0):= (others => '0');
SIGNAL act_cont : STD_LOGIC:= '0';

--attribute keep : boolean;    
--attribute keep of lfsr  : signal is true;
--attribute keep of s_stop  : signal is true;
--attribute keep of s_activacion  : signal is true;
--attribute keep of cont  : signal is true;
--attribute keep of act_cont : signal is true;
begin

process(clk,reset, Ident) 
begin
    if reset='0' then
        cont<=TO_unsigned(0,8);
        complete_cycle <= '0';
        
        if Ident='0' then
           lfsr <= std_logic_vector(TO_unsigned(255,8)); --primer lfsr, antes 255
           
        else
           lfsr <= std_logic_vector(TO_unsigned(101,8)); --segundo lfsr 97 seed la que menos error da
        end if;
  
     elsif CLK'event and CLK='1' then
            complete_cycle <= '0';
             act_next_layer_ADD<='0';
               if (start='1') then

                 s_activacion<='1';
              elsif (start='0' and s_activacion='0') then-- DETECTAR FLANCO DE BAJADA START
                 s_activacion<='0';
                 s_stop<='0';
              elsif (s_stop='0') then
                 act_cont<='1';
              end if;
              
            if (act_cont='1') then
                 for i in 1 to 7 loop
                 lfsr(i+1)<= lfsr(i);
                 end loop;
                 lfsr(1)<= lfsr(8) XOR lfsr(6) XOR lfsr(5) XOR lfsr(4);
                 cont<= cont+1;
                    
               end if;
               
            if (cont=254) then --antes 255, sino pilla dos veces el primero
                s_activacion<='0';
                complete_cycle <= '1';
                cont<=TO_unsigned(0,8);
             
                act_next_layer_ADD<='1';
                act_cont<='0';
                s_stop<='1';
            end if;     
             
          end if;
    end process;
stop <= s_stop;
o_sequence<= lfsr;



end Behavioral;