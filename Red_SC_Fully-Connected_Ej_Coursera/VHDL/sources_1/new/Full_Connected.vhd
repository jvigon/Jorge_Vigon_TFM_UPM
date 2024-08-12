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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Connected is
        Port ( CLK : in STD_LOGIC;
           BTNU : in STD_LOGIC; --para reset
           X1 : in STD_LOGIC_VECTOR (7 downto 0);
           X2 : in STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC; --para start
           y : out STD_LOGIC;--RED=0, BLUE=1
           Y_Display     : out std_logic_vector(7 downto 0);   
           ndisplay     : out std_logic_vector(7 downto 0);
           resultado_total : OUT STD_LOGIC_VECTOR(10 downto 0);
           indica_final : out STD_LOGIC
           ); 
end Full_Connected;

architecture Behavioral of Full_Connected is
component Neuron_Full_Connected_Primera_Capa
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Xbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
           Wbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Wbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
           Bias_1_Capa : in STD_LOGIC_VECTOR (7 downto 0);
           Num_entradas : in integer;
           Start_g : in STD_LOGIC;
           act_layer_next : out STD_LOGIC;
           valor_y : out STD_LOGIC_VECTOR (7 downto 0));
         end component;
         
component Neuron_Full_Connected_Sigmoid
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Xbin_0 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_1 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_2 : in STD_LOGIC_VECTOR (7 downto 0);
           Xbin_3 : in STD_LOGIC_VECTOR (7 downto 0);
           Num_entradas : in integer;
           Start_g : in STD_LOGIC;
           Bias_2_Capa : in STD_LOGIC_VECTOR(7 downto 0);
           act_layer_next : out STD_LOGIC;
           resultado_total : OUT STD_LOGIC_VECTOR(10 downto 0);
           indica_final : out STD_LOGIC;
           y : out STD_LOGIC);
         end component;
  
signal act_from_primera_capa  :   std_logic; 
signal act_from_no_use_1  :   std_logic;
signal act_from_no_use_2  :   std_logic; 
signal act_from_no_use_3  :   std_logic; 
signal act_from_no_use_4  :   std_logic; 
signal act_seg_no_use : std_logic;


signal output_1_0 : std_logic_vector ( 7 downto 0);

signal output_1_1 : std_logic_vector ( 7 downto 0);
signal output_1_2 : std_logic_vector ( 7 downto 0);
signal output_1_3 : std_logic_vector ( 7 downto 0);
--signal output_1_4 : std_logic_vector ( 7 downto 0);

    signal contador : UNSIGNED(13 downto 0):=(others => '0');
    signal cont_disp_LH  :   UNSIGNED(1 downto 0):=(others => '0');
    signal std_cont_disp_LH  :   std_logic_vector(1 downto 0):=(others => '0');
    
 signal Reset  :   std_logic;   
  signal Start_g  :   std_logic;  
  signal pulsacion: std_logic; 
  signal y_final: std_logic; 
  
attribute keep : boolean; 
attribute keep of output_1_0  : signal is true;
attribute keep of output_1_1  : signal is true;
attribute keep of output_1_2  : signal is true;   
attribute keep of output_1_3  : signal is true;

begin
y<=y_final;
reset <= not(BTNU);      -- Button UP     => Reset (active low)

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
                
process(cont_disp_LH, y_final) 
begin                 
Y_Display <=  '1' & not("1111111") when (cont_disp_LH = "00" and y_final='1')  else --B
              '1' & not("0111000") when (cont_disp_LH = "01" and y_final='1')  else --L
              '1' & not("0111110") when (cont_disp_LH = "10" and y_final='1')  else--U
              '1' & not("1111001") when (cont_disp_LH = "11" and y_final='1')  else --E
              
              '1' & not("1110111") when (cont_disp_LH = "00" and y_final='0')  else --R
              '1' & not("1111001") when (cont_disp_LH = "01" and y_final='0') else --E
              '1' & not("0111111") when (cont_disp_LH = "10" and y_final='0' ) else --D
              '1' & not("0000000") when (cont_disp_LH = "11" and y_final='0')  else  
              (others => 'Z');
end process; 

process(cont_disp_LH) 
begin        
nDisplay <= "11111110" when cont_disp_LH = "11" else --Ilumina el primer display
            "11111101" when cont_disp_LH = "10" else--Ilumina el segundo display 
            "11111011" when cont_disp_LH = "01" else
            "11110111" when cont_disp_LH = "00" else --leer de izq a dcha
            (others => 'Z');  
end process;

entrada:  process (clk, reset)
                begin
                    if reset = '0' then 
                        Start_g <= '0';
                        pulsacion <= '0';
                    elsif clk'event and clk = '1' then 
                    Start_g<='0';
                        if (BTNC='1' and pulsacion='0') then
                            pulsacion<='1';
                        elsif (BTNC='0' and pulsacion='1') then
                            pulsacion<='0';
                            Start_g<='1';
                        end if;
                    end if;                            
  end process entrada;
                       
Neuron_1_0: Neuron_Full_Connected_Primera_Capa
    port map (
        Reset => Reset,
        Clk => Clk,
        Xbin_0 => X1,
        Xbin_1 => X2,
        Wbin_0 =>  STD_LOGIC_VECTOR(TO_UNSIGNED(142,8)),
        Wbin_1 =>  STD_LOGIC_VECTOR(TO_UNSIGNED(134,8)), 
        Bias_1_Capa =>  STD_LOGIC_VECTOR(TO_UNSIGNED(137,8)), 
        Num_entradas =>  2,
        Start_g =>  Start_g,
        act_layer_next => act_from_primera_capa,
        valor_y => output_1_0);

Neuron_1_1: Neuron_Full_Connected_Primera_Capa
    port map (
        Reset => Reset,
        Clk => Clk,
        Xbin_0 => X1,
        Xbin_1 => X2,
        Wbin_0 =>  STD_LOGIC_VECTOR(TO_UNSIGNED(85,8)),
        Wbin_1 =>  STD_LOGIC_VECTOR(TO_UNSIGNED(43,8)), 
        Bias_1_Capa =>  STD_LOGIC_VECTOR(TO_UNSIGNED(70,8)),   
        Num_entradas =>  2,
        Start_g =>  Start_g,
        act_layer_next => act_from_no_use_1,
        valor_y => output_1_1);
        
Neuron_1_2: Neuron_Full_Connected_Primera_Capa
    port map (
        Reset => Reset,
        Clk => Clk,
        Xbin_0 => X1,
        Xbin_1 => X2,
        Wbin_0 =>  STD_LOGIC_VECTOR(TO_UNSIGNED(80,8)),
        Wbin_1 =>  STD_LOGIC_VECTOR(TO_UNSIGNED(54,8)),  
        Bias_1_Capa =>  STD_LOGIC_VECTOR(TO_UNSIGNED(108,8)),  
        Num_entradas =>  2,
        Start_g =>  Start_g,
        act_layer_next => act_from_no_use_2,
        valor_y => output_1_2);
        
Neuron_1_3: Neuron_Full_Connected_Primera_Capa
    port map (
        Reset => Reset,
        Clk => Clk,
        Xbin_0 => X1,
        Xbin_1 => X2,
        Wbin_0 =>  STD_LOGIC_VECTOR(TO_UNSIGNED(104,8)),
        Wbin_1 =>  STD_LOGIC_VECTOR(TO_UNSIGNED(51,8)), 
        Bias_1_Capa =>  STD_LOGIC_VECTOR(TO_UNSIGNED(113,8)),   
        Num_entradas =>  2,
        Start_g =>  Start_g,
        act_layer_next => act_from_no_use_3,
        valor_y => output_1_3);
        

        
--SEGUNDA CAPA:        
Neuron_2_0: Neuron_Full_Connected_Sigmoid
    port map (
        Reset => Reset,
        Clk => Clk,
        Xbin_0 => output_1_0,
        Xbin_1 => output_1_1,
        Xbin_2 => output_1_2,
        Xbin_3 => output_1_3,
        Num_entradas =>  4,
        Start_g =>  act_from_primera_capa,
        Bias_2_Capa => STD_LOGIC_VECTOR(TO_UNSIGNED(135,8)),
        act_layer_next => act_seg_no_use,
        resultado_total => resultado_total,
        indica_final => indica_final,
        y => y_final);
end Behavioral;
