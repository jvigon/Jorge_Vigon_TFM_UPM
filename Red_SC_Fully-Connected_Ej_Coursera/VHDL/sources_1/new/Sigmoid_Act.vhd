----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2024 13:36:41
-- Design Name: 
-- Module Name: op_act_RELU - Behavioral
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

entity Sigmoid is
 Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Finalizado_entradas : in STD_LOGIC;
           r_suma : in STD_LOGIC_VECTOR (7 downto 0);
           Bias_2_Capa : in STD_LOGIC_VECTOR(7 downto 0); 
           act_layer_next : out STD_LOGIC;
           resultado_total : OUT STD_LOGIC_VECTOR(10 downto 0);
           indica_final : out STD_LOGIC;
           y : out STD_LOGIC);
end Sigmoid;

architecture Behavioral of Sigmoid is
signal mult_suma_next, mult_suma_reg : std_logic_vector(10 downto 0);
signal c_mult_suma_next, c_mult_suma_reg : std_logic_vector(11 downto 0);
signal bias_next,bias_reg: std_logic_vector( 11 downto 0);
signal suma_final_next, suma_final_reg : signed(11 downto 0);

signal resultado_total_next,resultado_total_reg : std_logic_vector(10 downto 0);
signal c_resultado_total_next,c_resultado_total_reg  : std_logic_vector(10 downto 0);
attribute keep : boolean;
attribute keep of mult_suma_next : signal is true;
attribute keep of c_mult_suma_next : signal is true;
attribute keep of bias_next : signal is true;
attribute keep of suma_final_next : signal is true;
attribute keep of resultado_total_next : signal is true;

signal y_next,y_reg: STD_LOGIC;
--signal complete_y : STD_LOGIC;

SIGNAL s_activacion: STD_LOGIC:= '0';

SIGNAL act_calculos_next: STD_LOGIC:= '0';
SIGNAL act_calculos_reg  : STD_LOGIC:= '0';
begin

process (mult_suma_reg,c_mult_suma_reg,suma_final_reg,c_resultado_total_reg,resultado_total_reg,bias_reg,mult_suma_next,r_suma,
Bias_2_Capa,c_mult_suma_next,bias_next,suma_final_next,c_resultado_total_next,resultado_total_next,y_reg,act_calculos_reg)

begin 
y_next <= y_reg;
mult_suma_next <= mult_suma_reg;
c_mult_suma_next<=c_mult_suma_reg;
suma_final_next <= suma_final_reg;
c_resultado_total_next<= c_resultado_total_reg;
resultado_total_next <= resultado_total_reg;
bias_next <= bias_reg;
   if (act_calculos_reg='1') then
        mult_suma_next <= r_suma & '0' & '0' & '0';--multiplicar por 8
        c_mult_suma_next<= not(mult_suma_next(10)) & not(mult_suma_next(10)) & mult_suma_next(9 downto 0);
        bias_next <= not(Bias_2_Capa(7))& not(Bias_2_Capa(7))& not(Bias_2_Capa(7)) & not(Bias_2_Capa(7)) & not(Bias_2_Capa(7)) & Bias_2_Capa(6 downto 0);
        suma_final_next <= signed(c_mult_suma_next) + signed(bias_next);
        if (suma_final_next> "001111111111") then
                    y_next<= '1';
             elsif( suma_final_next< "110000000000") then
                     y_next<= '0';
             else
                    c_resultado_total_next<= std_logic_vector(suma_final_next(10 downto 0));
                    resultado_total_next<= not(c_resultado_total_next(10)) & c_resultado_total_next(9 downto 0);
                    if(unsigned(resultado_total_next)>1024) then
                            y_next<='1';
                    else
                            y_next<='0';
                    end if;
      end if;
   end if;
end process;

process(CLK, Reset) 
begin
    if reset='0' then
        mult_suma_reg <= (others=>'0');
        y_reg<='0';
        c_mult_suma_reg<=(others=>'0');
        suma_final_reg <= (others=>'0');
        c_resultado_total_reg<= (others=>'0');
        resultado_total_reg <= (others=>'0');
        bias_reg <= (others=>'0');
        
    -- elsif (Finalizado_entradas='1' AND  s_activacion='0') then
     --        s_activacion<='1';
    --         act_calculos_next<='0';     
    -- elsif (Finalizado_entradas='0' AND  s_activacion='1') then-- DETECTAR FLANCO DE BAJADA de finalizar_entradas
    --         s_activacion<='0'; 
    --         act_calculos_next<='1';     
     elsif CLK'event and CLK='1' then
            mult_suma_reg <= mult_suma_next;
            y_reg<=y_next;
            c_mult_suma_reg<=c_mult_suma_next;
            suma_final_reg <= suma_final_next;
            c_resultado_total_reg<= c_resultado_total_next;
            resultado_total_reg <= resultado_total_next;
            bias_reg <= bias_next;
            act_calculos_reg<=act_calculos_next;  --Esto para evitar el UU de r_suma
            if (Finalizado_entradas='1' AND  s_activacion='0') then--if oara evitar UU suma
                 s_activacion<='1';
                 act_calculos_next<='0';
            elsif (Finalizado_entradas='0' AND  s_activacion='1') then-- DETECTAR FLANCO DE BAJADA de finalizar_entrada
                 s_activacion<='0'; 
                  act_calculos_next<='1';  
             end if;
     end if;
end process;
--yi<=y2_reg;
y<= y_reg;
resultado_total <=resultado_total_next; 
indica_final <=s_activacion; 
end Behavioral;
