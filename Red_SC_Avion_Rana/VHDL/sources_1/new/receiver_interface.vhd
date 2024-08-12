-- Engineer: Irene Merino Balaguer
-- 
-- Create Date: 24.11.2021 20:51:27
-- Design Name: 
-- Module Name: InterfazRAM- Behavioral
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use work.CNN_Package.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity receiver_interface is
Port (clk : in STD_LOGIC;
      reset : in STD_LOGIC;
      dato_ready : in std_logic;
      address : out std_logic_vector(log2c(number_of_inputs) - 1 downto 0);
      en_ram : out std_logic;
      we_ram : out STD_LOGIC_VECTOR(0 DOWNTO 0);
      clr_flag : out std_logic;
      start : out std_logic);
end receiver_interface;

architecture Behavioral of receiver_interface is
type state_type is (idle, s0, s1);
signal state_reg, state_next : state_type;
signal address_reg , address_next :  unsigned(log2c(number_of_inputs) - 1 downto 0) := (others => '0');
begin
--control path: state register
process(clk, reset) 
begin 
if (reset = '0') then 
    state_reg <= idle;
elsif (clk'event and clk = '1') then 
     state_reg <= state_next;   
     address_reg <= address_next;
end if; 
end process;
 -- data path : routing multiplexer
 process (state_reg,address_reg, dato_ready)

 begin
     state_next <= state_reg;
     address_next <= address_reg;
 case state_reg is 
 when idle =>                                    
   clr_flag <= '0';
   en_ram <= '0';
   we_ram <= "0";
   state_next <= s0;
   start <= '0';
when s0 => 
if(dato_ready = '1') then
   state_next <= s1;
   end if; 
   clr_flag <= '0';
   en_ram <= '0';
   we_ram <= "0";
   start <= '0';
 

when s1 =>
   clr_flag <= '1';
   en_ram <= '1';
   we_ram <= "1";
   start <= '0';
   if(address_reg /= 3072) then
   address_next <= address_reg + 1;
   state_next <= s0;  
   else
   start <= '1';
   we_ram <= "0";
   end if;
end case;
end process;


 -- se?ales de salida
address <= std_logic_vector(address_reg);

end Behavioral;
