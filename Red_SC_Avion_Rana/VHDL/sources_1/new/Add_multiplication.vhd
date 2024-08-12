----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2024 17:49:09
-- Design Name: 
-- Module Name: Add_multiplication - Behavioral
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
use work.CNN_Package.all;
entity Add_Multiplication is
        Port ( CLK : in STD_LOGIC;
                   Reset : in STD_LOGIC;
                   x_sc : in STD_LOGIC;
                   w_sc : in STD_LOGIC;
                   Start : in STD_LOGIC;
                   entrada_complete : in STD_LOGIC;
                   Finalizado_entradas : in STD_LOGIC;
                   filtro : in STD_LOGIC_VECTOR ( (log2c(Numero_filtros) - 1) downto 0);
                   r_suma : out STD_LOGIC_VECTOR (7 downto 0));
end Add_Multiplication;

architecture Behavioral of Add_Multiplication is
signal r_XNOR: std_logic;
signal suma_una_next,suma_una_reg: unsigned( 7 downto 0);
signal suma_una_std_8_next,suma_una_std_8_reg : std_logic_vector(7 downto 0);
signal suma_una_std_9_next,suma_una_std_9_reg : std_logic_vector(8 downto 0);--esto siempre 9 bits al restarle -128 a x para que luego sea signed
signal suma_entradas_next,suma_entradas_reg: signed((7+ Division_valores +1) downto 0);--signed(10 downto 0);
--MODIFICO ESTO AHORA PUEDEN TENER VALOR DE 2 Y PICO  O -2 Y PICO, 8 downto 0 sería justo 127 -128, 10 downto 0 para 255 -256 y dejarle un margen para luego sat

signal bias_next,bias_reg: std_logic_vector( 8 downto 0);--esto dejarlo siempre como 9

signal suma_total_next,suma_total_reg : signed((7+ Division_valores +1 -log2c(Division_valores)) downto 0);--MODIFICO ESTO AHORA PUEDEN TENER VALOR DE 2 Y PICO  O -2 Y PICO, ej 255*3=750, se necesitan 10 bits en unsigned, 11 en signed

signal resultado_total_next,resultado_total_reg : std_logic_vector(7 downto 0);
signal c_resultado_total_next,c_resultado_total_reg  : std_logic_vector(7 downto 0);
attribute keep : boolean;    
attribute keep of suma_una_reg  : signal is true;
attribute keep of suma_una_std_8_next  : signal is true;
attribute keep of suma_una_std_9_next  : signal is true;
attribute keep of suma_entradas_next  : signal is true;
attribute keep of bias_next  : signal is true;
attribute keep of suma_total_next  : signal is true;
attribute keep of resultado_total_next  : signal is true;


signal in_sum1,in_sum1_reg : signed((7+ Division_valores +1) downto 0); --MODIFICO ESTO AHORA PUEDEN TENER VALOR DE 2 Y PICO  O -2 Y PICO
signal in_sum2,in_sum2_reg: signed(8 downto 0); 
signal out_sum : signed((7+ Division_valores +1) downto 0); --MODIFICO ESTO AHORA PUEDEN TENER VALOR DE 2 Y PICO  O -2 Y PICO
--signal in_sum1_reg, in_sum2_reg: signed(8 downto 0):= (others => '0'); 

--modifico 
signal Bias_Correcto_next, Bias_Correcto_reg : STD_LOGIC_VECTOR (7 downto 0);
signal resultado_total_12_std_next,resultado_total_12_std_reg: std_logic_vector((7+ Division_valores +1) downto 0); --se tiene que dividir por 2
signal resultado_total_12_signed_next,resultado_total_12_signed_reg: signed((7+ Division_valores +1) downto 0); --se tiene que dividir por 2
TYPE ROM_ARRAY_BIAS is Array (0 to (Numero_filtros -1)) of STD_LOGIC_VECTOR(7 downto 0);
CONSTANT ROM_BIAS: ROM_ARRAY_BIAS := (
"11111111", 
"11001101"

);
begin


--COMB_XNOR: process(r_XNOR,x_sc, w_sc)
--begin
   --     r_XNOR <= x_sc XNOR w_sc;
    --    if (r_XNOR='1') then
   --             suma_una_next <= suma_una_reg + 1;
   --      else
   --             suma_una_next <= suma_una_reg;
  --       end if;
 --end process;
--COMB_ENTRADA_COMPLETA: process(entrada_complete, suma_una_std_8,suma_una_std_9)
COMB_ENTRADA_COMPLETA: process(entrada_complete, suma_una_std_8_next,suma_una_std_9_next,suma_una_std_8_reg,suma_una_std_9_reg, suma_una_reg, suma_entradas_reg,
Finalizado_entradas,bias_reg,Bias_Correcto_next,suma_total_reg,Finalizado_entradas, suma_entradas_reg, c_resultado_total_next, c_resultado_total_reg,resultado_total_reg,suma_total_next,bias_next,
in_sum1_reg,in_sum2_reg,out_sum,resultado_total_12_std_next,resultado_total_12_signed_next,resultado_total_12_std_reg,resultado_total_12_signed_reg)
begin      
suma_una_std_8_next <= suma_una_std_8_reg;
suma_una_std_9_next<=suma_una_std_9_reg;
suma_entradas_next <= suma_entradas_reg;

bias_next <= bias_reg;
suma_total_next <= suma_total_reg;
resultado_total_next <= resultado_total_reg;
c_resultado_total_next <= c_resultado_total_reg;

in_sum1 <= in_sum1_reg;
in_sum2 <= in_sum2_reg;
--anado
resultado_total_12_signed_next <= resultado_total_12_signed_reg;
resultado_total_12_std_next <= resultado_total_12_std_reg;
         if (entrada_complete='1' and Finalizado_entradas='0') then
                            suma_una_std_8_next<= std_logic_vector(suma_una_reg); --DUDA
                            --suma_una_std_8_changed<= not(suma_una_std_8(7)) & suma_una_std_8(6 downto 0); --negamos el bit MSB para restar 128
                            suma_una_std_9_next<= not(suma_una_std_8_next(7)) & not(suma_una_std_8_next(7)) & suma_una_std_8_next(6 downto 0); --prolongamos bit de signo y restamos 128
                            --suma_entradas_next <= suma_entradas_reg + signed(suma_una_std_9_next);
                            in_sum1<= suma_entradas_reg;--para utilizar mismo sumador
                            in_sum2<= signed(suma_una_std_9_next);
                            suma_entradas_next<= out_sum;
        elsif (Finalizado_entradas='1') then
                           
                            bias_next <= not(Bias_Correcto_next(7)) & not(Bias_Correcto_next(7)) & Bias_Correcto_next(6 downto 0);
                            --suma_total_next <= suma_entradas_reg + signed(bias_next);
                            in_sum1<=suma_entradas_reg;
                            in_sum2<=signed(bias_next);
                            --suma_total_next<= out_sum;
                            resultado_total_12_signed_next <= out_sum;
                            resultado_total_12_std_next <=std_logic_vector(resultado_total_12_signed_next);
                            --suma_total_next<= (resultado_total_12_signed_next(10)) & (resultado_total_12_signed_next(10 downto 1));--DIVIDIR PARA 2
                            suma_total_next<= (resultado_total_12_signed_next((7+ Division_valores +1) downto (log2c(Division_valores))));
                                   --if (suma_total_next> "001111111") then --127
                                   if (suma_total_next> "01111111") then --127
                                           resultado_total_next<="11111111";
                                   --elsif( suma_total_next< "110000000") then-- -128
                                   elsif( suma_total_next< "10000000") then-- -128
                                           resultado_total_next<="00000000";
                                  else
                                            c_resultado_total_next<= std_logic_vector(suma_total_next(7 downto 0));
                                            resultado_total_next<= not(c_resultado_total_next(7)) & c_resultado_total_next(6 downto 0);
                                   end if;
                                                 
          end if; 
end process;
/*
COMB_FINAL: process(bias_reg,Bias_1_Capa,suma_total_reg,Finalizado_entradas, suma_entradas_reg, c_resultado_total_next, c_resultado_total_reg,resultado_total_reg,suma_total_next,bias_next)
begin 
bias_next <= bias_reg;
suma_total_next <= suma_total_reg;
resultado_total_next <= resultado_total_reg;
c_resultado_total_next <= c_resultado_total_reg;
 if (Finalizado_entradas='1') then
                    --bias_next <= not(Bias_1_Capa(7)) & not(Bias_1_Capa(7)) & Bias_1_Capa(6 downto 0);
                    --suma_total_next <= suma_entradas_reg + signed(bias_next);
                    if (suma_total_next> "001111111") then
                                        resultado_total_next<="11111111";
                                    elsif( suma_total_next< "110000000") then
                                        resultado_total_next<="00000000";
                                    else
                                        c_resultado_total_next<= std_logic_vector(suma_total_next(7 downto 0));
                                        resultado_total_next<= not(c_resultado_total_next(7)) & c_resultado_total_next(6 downto 0);
                     end if;
        
     end if;
end process;*/
process(CLK, Reset, Finalizado_entradas) 
begin
    if reset='0' then
        suma_una_reg<= (others => '0');
        suma_entradas_reg<= to_signed(0,(7+ Division_valores +2));
        --suma_una_std_9<= (others => '0');
        suma_una_std_8_reg <=(others => '0');
        suma_una_std_9_reg <= (others => '0');
        
        bias_reg <= (others => '0');
        suma_total_reg <= (others => '0');
        resultado_total_reg <= (others => '0');
        c_resultado_total_reg <= (others => '0');
        
        in_sum1_reg <= (others => '0');
        in_sum2_reg <= (others => '0');
        resultado_total_12_signed_reg <= to_signed(0,(7+ Division_valores +2));
        resultado_total_12_std_reg <=(others => '0');
     elsif CLK'event and CLK='1' then
                suma_una_std_8_reg<=suma_una_std_8_next;
                suma_una_std_9_reg<=suma_una_std_9_next;
                suma_entradas_reg<=suma_entradas_next;
                
                bias_reg<=bias_next;
                suma_total_reg<=suma_total_next;
                resultado_total_reg <= resultado_total_next;
                c_resultado_total_reg <= c_resultado_total_next;
                
                in_sum1_reg <= in_sum1;
                in_sum2_reg <= in_sum2;
                --anado
                resultado_total_12_signed_reg <= resultado_total_12_signed_next;
                resultado_total_12_std_reg <= resultado_total_12_std_next;
                Bias_Correcto_reg <=Bias_Correcto_next;
                r_XNOR <= x_sc XNOR w_sc;
                if (r_XNOR='1') then
                        suma_una_reg <= suma_una_reg + 1;
                 else
                        suma_una_reg <= suma_una_reg;
                 end if;
                  
                
                 if (Finalizado_entradas='1') then
                    
                   -- if (suma_entradas_reg> "001111111") then
                    --                    resultado_total<="11111111";
                    --                elsif( suma_entradas_reg< "11000000") then
                    --                    resultado_total<="00000000";
                    --                else
                    --                    c_resultado_total<= std_logic_vector(suma_entradas_reg(7 downto 0));
                    --                    resultado_total<= not(c_resultado_total(7)) & c_resultado_total(6 downto 0);
                    -- end if;
                     r_suma<= resultado_total_next;        
                     suma_una_reg<= (others => '0');
                     suma_entradas_reg<= to_signed(0,(7+ Division_valores +2));
        
                -- elsif (entrada_complete='1') then
                           -- suma_una_std_8<= std_logic_vector(suma_una_reg); --DUDA
                            --suma_una_std_8<= not(suma_una_std_8(7)) & suma_una_std_8(6 downto 0); --negamos el bit MSB para restar 128
                            --suma_una_std_9<= (suma_una_std_8(7)) & suma_una_std_8; --prolongamos bit de signo
                            --suma_entradas_reg<= suma_entradas_reg + to_signed(1,8);-- + signed(suma_una_std_8);
                     --        suma_entradas_reg<=suma_entradas_next;
                 elsif(start='1') then
                        suma_una_reg<= (others => '0'); 
                          
                          --suma_una_reg<= suma_una_next;
                 end if;
     end if;
end process;
/*
BIAS_ADECUADO : process(Bias_Correcto_reg,cambio_filtro,Bias_1_Filtro,Bias_2_Filtro)
BEGIN
Bias_Correcto_next <=Bias_Correcto_reg;
        if (cambio_filtro='0') then
            Bias_Correcto_next <= Bias_1_Filtro;
           
         else 
             Bias_Correcto_next <=Bias_2_Filtro;
        end if;
 end process;*/
Bias_Correcto_next <= ROM_BIAS(to_integer(unsigned(filtro)));
out_sum <= in_sum1 + in_sum2;

end Behavioral;
