
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2021 10:53:46
-- Design Name: 
-- Module Name: Interface_circuit - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FF_buff is 
generic (W: integer := 8); 
port( 
    clk, reset: in std_logic; 
    clr_flag, set_flag : in std_logic; 
    din: in std_logic_vector (W-1 downto 0) ; 
    dout : out std_logic_vector (W-1 downto 0) ; 
    flag: out std_logic); 
end; 
architecture Behavioral  of FF_buff is 
signal buf_reg, buf_next: std_logic_vector (W-1 downto 0) ; 
signal flag_reg , flag_next : std_logic; 
begin
-- FF & register 
process ( clk , reset ) 
begin 
    if( reset = '0') then 
        buf_reg <= (others=> '0'); 
        flag_reg <= '0'; 
        elsif (clk'event and clk = '1') then 
        buf_reg <= buf_next ; 
        flag_reg <= flag_next;
    end if;
end process; 
--next-state logic 
process (buf_reg ,flag_reg , set_flag , clr_flag , din ) 
begin 
    buf_next <= buf_reg; 
    flag_next <= flag_reg; 
        if (set_flag = '1') then 
        buf_next <= din; 
        flag_next <= '1';
        elsif ( clr_flag = '1') then 
        flag_next <= '0'; 
        end if;
end process;
-- output logic
dout <= buf_reg;
flag <= flag_reg;
end Behavioral ;
