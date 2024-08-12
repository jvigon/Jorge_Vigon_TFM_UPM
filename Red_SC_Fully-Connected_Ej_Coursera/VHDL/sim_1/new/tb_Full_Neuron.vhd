----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2024 10:40:47
-- Design Name: 
-- Module Name: tb_Full_Neuron - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_Full_Neuron is

end tb_Full_Neuron;

architecture Behavioral of tb_Full_Neuron is
SIGNAL BTNU: std_logic;
SIGNAL CLK: std_logic;
SIGNAL X1: std_logic_vector(7 downto 0) := STD_LOGIC_VECTOR(TO_UNSIGNED(0,8));
SIGNAL X2: std_logic_vector(7 downto 0) := STD_LOGIC_VECTOR(TO_UNSIGNED(0,8));
SIGNAL BTNC: std_logic;
SIGNAL y: std_logic;
SIGNAL Y_Display : std_logic_vector(7 downto 0);
SIGNAL nDisplay : std_logic_vector(7 downto 0);
SIGNAL resultado_total : std_logic_vector(10 downto 0);
SIGNAL indica_final: std_logic :='0';

SIGNAL ver_i : integer := 0;
SIGNAL ver_j : integer := 0;
SIGNAL i : integer := 0;
SIGNAL j : integer := 0;
--constant TCLK : time := 50 ns; --20 MHz --100ns =10MHZ
constant TCLK : time := 50 ns;
signal time_counter : time := 0 ns;


FILE result : TEXT IS OUT "C:\Users\Jorge\Desktop\Master\TFM\BIEN HECHO\VHDL\RED_COURSERA\OPTMIZANDO_SUMADOR\CON_TESTBENCH_SENCILLA_COURSERA\result.txt";

--
signal result_unsigned : unsigned(10 downto 0);
component Full_Connected
    Port ( 
           CLK : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           X1 : in STD_LOGIC_VECTOR (7 downto 0);
           X2 : in STD_LOGIC_VECTOR (7 downto 0);         
           BTNC : in STD_LOGIC;
           y : out std_logic;
           Y_Display     : out std_logic_vector(7 downto 0);   
           ndisplay     : out std_logic_vector(7 downto 0);
           resultado_total : OUT STD_LOGIC_VECTOR(10 downto 0);
           indica_final : out STD_LOGIC
           ); 
       end component;
begin

 UUT: Full_Connected
     port map (
             BTNU => BTNU,
             Clk => Clk,
             X1 => X1,
             X2 => X2,
             BTNC => BTNC,
             y => y,
             Y_Display => Y_Display,
             nDisplay => nDisplay,
             resultado_total => resultado_total,
             indica_final => indica_final
        );
--BTNU <= '0', '1' after 25 ns, '0' after 125 ns; --20*4=150ns
--BTNC <= '0', '1' after 50000 ns, '0' after 50050 ns,'1' after 200000 ns, '0' after 200050 ns, '1' after 400000 ns, '0' after 400050 ns, '1' after 600000 ns, '0' after 600050 ns,  '1' after 800000 ns, '0' after 800050 ns, '1' after 1000000 ns, '0' after 1000050 ns;

BTNU <= '0', '1' after 200 ns, '0' after 20050 ns;
result_unsigned <= unsigned( resultado_total);
p_clk : PROCESS
  BEGIN
     Clk <= '1';
     wait for Tclk/2;
     Clk <= '0';
     wait for Tclk/2;
  END PROCESS;    
--X1_sequence: process
--begin

   --Xbin   <= STD_LOGIC_VECTOR(TO_UNSIGNED(240,8)) after 3*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(50,8)) after 10*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(160,8)) after 11*TCLK, 
   --                          STD_LOGIC_VECTOR(TO_UNSIGNED(254,8)) after 12*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(2,8)) after 13*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(150,8)) after 14*TCLK, 
    --                         STD_LOGIC_VECTOR(TO_UNSIGNED(95,8)) after 18*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(240,8)) after 280*TCLK, "ZZZZZZZZ" after 300*TCLK;
     --                         wait;
    --Xbin_0   <= STD_LOGIC_VECTOR(TO_UNSIGNED(225,8)) after 3*TCLK;
  -- X1   <= STD_LOGIC_VECTOR(TO_UNSIGNED(159,8)) after 3*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(255,8)) after 3500*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(255,8)) after 7000*TCLK,  STD_LOGIC_VECTOR(TO_UNSIGNED(64,8)) after 10500*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(0,8)) after 14000*TCLK,   STD_LOGIC_VECTOR(TO_UNSIGNED(32,8)) after 17500*TCLK;
   --       wait;
  --  X1   <= x"00" after 1*TCLK; wait;
 --end process;
 --X2_sequence: process
--begin


--   X2   <= STD_LOGIC_VECTOR(TO_UNSIGNED(0,8)) after 3*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(255,8)) after 3500*TCLK, STD_LOGIC_VECTOR(TO_UNSIGNED(255,8)) after 7000*TCLK,  STD_LOGIC_VECTOR(TO_UNSIGNED(128,8)) after 10500*TCLK,  STD_LOGIC_VECTOR(TO_UNSIGNED(0,8)) after 14000*TCLK,  STD_LOGIC_VECTOR(TO_UNSIGNED(223,8)) after 17500*TCLK;
 --          wait;
     -- X2   <= x"00" after 1*TCLK; wait;
 --end process;

X1_bucle: process (clk)
        variable v_data_out : bit_vector(10 downto 0);
        variable v_final_num : real;
	    variable v_linea : line;
	  BEGIN
          if (BTNU='1') then
             X1<= STD_LOGIC_VECTOR(TO_UNSIGNED(0,8));
             X2<= STD_LOGIC_VECTOR(TO_UNSIGNED(0,8));
   	      
          else 
          
                 if (clk'event and clk='1') then
                        if (i<32) then
                                   if (j<32) then
                                        if (indica_final = '1') then                                   
 
                                                    X1<= STD_LOGIC_VECTOR(TO_UNSIGNED(8*i,8));
                                                    X2<= STD_LOGIC_VECTOR(TO_UNSIGNED(8*j,8));
                                                    --v_data_out := To_BitVector(resultado_total); --PASA A UN VECTOR
                                                    --WRITE(v_linea, v_data_out); -- LO ESCRIBE EN UNA LINEA
                                                    --WRITELINE(result, v_linea); -- LO PASA AL 
                                                    j <= j+1;
                                                   v_final_num := real(to_integer(result_unsigned)-1024) / 128.0;
                                                   WRITE(v_linea, v_final_num);
                                                   WRITELINE(result, v_linea);
                                        --j<= j+1;
                                          end if;
                                    else
                                              i<=i+1;  
                                              j<=0; 
                                    end if;
                                     
                           end if;
                           
                 end if;
                   
                   --i<= i+1;
                   --j<=0;        
       end if;
            
         --end if;
 end process;

START_bucle: process (clk)
       
	  BEGIN
	      if time_counter < 50000 ns then
            BTNC <= '0';
        elsif time_counter = 50000 ns then
            BTNC <= '1';
        elsif time_counter = 50050 ns then
              BTNC <= '0';
        else
              if (clk'event and clk='1') then
              BTNC <= '0';
                         if (indica_final = '1') then
                               BTNC <= '1';
                         end if;
               end if;
        end if;
 end process;
 
Time_bucle: process (clk, BTNU)
       
	  BEGIN
               if BTNU = '1' then
                time_counter <= 0 ns;
            else
                time_counter <= time_counter + 1 ns;
            end if;
 end process;
end Behavioral;

