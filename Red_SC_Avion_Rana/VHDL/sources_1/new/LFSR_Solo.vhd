LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
--SIGNAL lfsr_reset : STD_LOGIC_VECTOR(8 downto 1);
SIGNAL lfsr : STD_LOGIC_VECTOR(8 downto 1);
SIGNAL s_stop : STD_LOGIC:= '1';
SIGNAL s_activacion  : STD_LOGIC:= '0';--para comparar las señales un ciclo despues de la señal start
SIGNAL cont: unsigned (7 downto 0):= (others => '0');
SIGNAL act_cont : STD_LOGIC:= '0';

attribute keep : boolean;    
attribute keep of lfsr  : signal is true;
attribute keep of s_stop  : signal is true;
attribute keep of s_activacion  : signal is true;
attribute keep of cont  : signal is true;
attribute keep of act_cont : signal is true;
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
           -- if (s_activacion='1' AND start='0' ) then
           --     s_stop<='0';
            --    s_activacion<='0';
           --     cont<=TO_unsigned(0,8);
           -- end if; 
           -- if (s_stop<='0') then --para que cuente el cero bien
           --     act_cont<='1';
           -- end if;
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
                 --if(cont=0) then
                 --     act_next_layer_ADD<='1';
                -- end if;
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

--lfsr <= std_logic_vector(TO_unsigned(255,8)) when Ident='0' else
 --              std_logic_vector(TO_unsigned(97,8));
--process(Start,s_activacion)
--begin
  --   if (start='1') then
    --         act_cont<='0'; 
      --       s_stop<='0';
     --elsif (start='0' AND  s_activacion='1') then-- DETECTAR FLANCO DE BAJADA START
       --      act_cont<='1'; 

         --    s_stop<='0';
      --end if;
      
      --if (complete_cycle = '1') then
          --      s_stop<='1';
       ---         act_cont<='0';
                
       --end if;     

--end process;

end Behavioral;