

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LFSR_Comp is
    Port ( 
        Reset     : in  std_logic;   -- Low-level asynchronous reset
        input_sequence_var : in STD_LOGIC_VECTOR (7 downto 0);
        input_sequence_LFSR : in STD_LOGIC_VECTOR (7 downto 0);
        stop: in STD_LOGIC;
        x_sc : out STD_LOGIC);
end LFSR_Comp;

architecture Behavioral of LFSR_Comp is
signal ver_input_sequence_var: STD_LOGIC_VECTOR (7 downto 0);
signal ver_input_sequence_LFSR: STD_LOGIC_VECTOR (7 downto 0);
signal ver_x_sc: STD_LOGIC;
--attribute keep : boolean;    
--attribute keep of ver_input_sequence_var  : signal is true;
--attribute keep of ver_input_sequence_LFSR  : signal is true;
--attribute keep of ver_x_sc  : signal is true;
begin

process(Reset,input_sequence_var, input_sequence_LFSR, stop) 
begin
    if Reset='0' then
        x_sc<='0';
        ver_x_sc <='0';
     else
        x_sc<='0';
        ver_x_sc <='0';
            if (input_sequence_var>input_sequence_LFSR AND stop='0') then
                x_sc<='1';
                ver_x_sc <='1';
            end if;

     end if;
   end process;
ver_input_sequence_var <=input_sequence_var;
ver_input_sequence_LFSR <=input_sequence_LFSR;

end Behavioral;
