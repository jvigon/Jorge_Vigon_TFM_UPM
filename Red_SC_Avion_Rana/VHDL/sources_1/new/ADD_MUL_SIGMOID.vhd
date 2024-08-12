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
use work.FC_Package.all;
entity Add_Multiplication_Sigmoid is
        Port ( CLK : in STD_LOGIC;
                   Reset : in STD_LOGIC;
                   x_sc : in STD_LOGIC;
                   w_sc : in STD_LOGIC;
                   Start : in STD_LOGIC;
                   entrada_complete : in STD_LOGIC;
                   Finalizado_entradas : in STD_LOGIC;
                   resultado_total: out std_logic_vector((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
                   y : out STD_LOGIC
                   );
end Add_Multiplication_Sigmoid;

architecture Behavioral of Add_Multiplication_Sigmoid is
signal r_XNOR: std_logic;
signal suma_una_reg: unsigned( 7 downto 0);
signal suma_una_std_8_next,suma_una_std_8_reg : std_logic_vector(7 downto 0);
signal suma_una_std_9_next,suma_una_std_9_reg : std_logic_vector(8 downto 0);
signal suma_entradas_next,suma_entradas_reg: signed( 9 downto 0);--estos tres se quedan con estas dimensiones

signal c_resultado_total_next,c_resultado_total_reg : std_logic_vector(7 downto 0);

signal s_activacion_e_1,s_activacion_e_2,s_activacion_f_1,s_activacion_f_2, s_activacion_start : std_logic :='0';
signal do_suma_entrada_s, do_suma_entrada_c : std_logic :='0';
signal valor_suma: unsigned( 7 downto 0);



signal inicio_global : std_logic :='1';
signal Finalizado_suma: std_logic;

signal mult_suma_next,mult_suma_reg: std_logic_vector((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
signal mult_signed_next,mult_signed_reg: signed((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
signal bias_signed_next,bias_signed_reg: signed(7 downto 0);
signal c_sumar_mitad_next,c_sumar_mitad_reg,sumar_mitad_next,sumar_mitad_reg: std_logic_vector( 7 downto 0);
--signal c_mult_suma_next, c_mult_suma_reg : std_logic_vector(10 downto 0);
signal bias_next,bias_reg: std_logic_vector( 7 downto 0);
signal suma_final_next, suma_final_reg : signed((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
signal resultado_total_next,resultado_total_reg : std_logic_vector((7+log2c(Rango_Normalizacion_FC)+1) downto 0);

--borro sigmoid
signal y_next,y_reg: STD_LOGIC;

--lo pongo yo se suman muchos errores y te la lia
signal suma_total_next_sin_norm,suma_total_next_sin_norm_reg : std_logic_vector(7 downto 0);
signal suma_total_next_norm_unsigned,suma_total_next_norm_unsigned_reg : unsigned (7 downto 0);

signal suma_una_norm_next,suma_una_norm_reg: unsigned( 7 downto 0);
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
COMB_ENTRADA_COMPLETA: process(do_suma_entrada_s,do_suma_entrada_c, suma_una_std_8_next,suma_una_std_9_next,suma_una_std_8_reg,suma_una_std_9_reg, valor_suma, suma_entradas_reg,suma_una_norm_next,suma_una_norm_reg)
begin      
suma_una_std_8_next <= suma_una_std_8_reg;
suma_una_std_9_next<=suma_una_std_9_reg;
suma_entradas_next <= suma_entradas_reg;
suma_una_norm_next<=suma_una_norm_reg;
         if (do_suma_entrada_s='1' or do_suma_entrada_c='1') then
                            if (valor_suma>=128 and valor_suma<131) then
                                        suma_una_norm_next<=to_unsigned(128,8);
                                 else
                                        suma_una_norm_next<=valor_suma;
                            end if;
                            suma_una_std_8_next<= std_logic_vector(suma_una_norm_next); --DUDA
                            --suma_una_std_8_changed<= not(suma_una_std_8(7)) & suma_una_std_8(6 downto 0); --negamos el bit MSB para restar 128
                            suma_una_std_9_next<= not(suma_una_std_8_next(7)) & not(suma_una_std_8_next(7)) & suma_una_std_8_next(6 downto 0); --prolongamos bit de signo y restamos 128
                            suma_entradas_next <= suma_entradas_reg + signed(suma_una_std_9_next);
                            
              
        end if; 
end process;

COMB_FINAL: process(all)
begin 
resultado_total_next <= resultado_total_reg;
c_resultado_total_next <= c_resultado_total_reg;
y_next <= y_reg;

sumar_mitad_next <= sumar_mitad_reg;
c_sumar_mitad_next<=c_sumar_mitad_reg;
mult_suma_next<= mult_suma_reg;
bias_next <= bias_reg;
mult_signed_next<=mult_signed_reg;
bias_signed_next<=bias_signed_reg;

suma_final_next <= suma_final_reg;
c_resultado_total_next<= c_resultado_total_reg;
resultado_total_next <= resultado_total_reg;

suma_total_next_sin_norm<=suma_total_next_sin_norm_reg;
suma_total_next_norm_unsigned<=suma_total_next_norm_unsigned_reg;
 if (Finalizado_suma='1') then
           if (suma_entradas_reg> "01111111") then --127
                     sumar_mitad_next<="11111111";
           elsif( suma_entradas_reg< "10000000") then--128
                     sumar_mitad_next<="00000000";
           else
                       c_resultado_total_next<= std_logic_vector(suma_entradas_reg(7 downto 0));
                       sumar_mitad_next<= not(c_resultado_total_next(7)) & c_resultado_total_next(6 downto 0);
                       suma_total_next_sin_norm<= not(c_resultado_total_next(7)) & c_resultado_total_next(6 downto 0);
                       if ((unsigned(suma_total_next_sin_norm)>128) and unsigned(suma_total_next_sin_norm)<(255-Factor_De_Correction)) then
                               suma_total_next_norm_unsigned<= unsigned(suma_total_next_sin_norm) + to_unsigned(Factor_De_Correction,log2c(Factor_De_Correction));
                               sumar_mitad_next<= std_logic_vector(suma_total_next_norm_unsigned);
                       elsif ((unsigned(suma_total_next_sin_norm)>(255-Factor_De_Correction))) then
                       --else
                               suma_total_next_norm_unsigned<= to_unsigned(255,8); 
                               sumar_mitad_next<= std_logic_vector(suma_total_next_norm_unsigned);
                       else
                              sumar_mitad_next<= not(c_resultado_total_next(7)) & c_resultado_total_next(6 downto 0);
                      end if;
            end if;
            
            mult_suma_next <= '0' & std_logic_vector(sumar_mitad_next) & std_logic_vector(to_unsigned(0, log2c(Rango_Normalizacion_FC)));--AHORA ES MULTIPLICAR POR 2, maximo 255*2=510,512 si 256
            --c_mult_suma_next<=  not(mult_suma_next(10)) & mult_suma_next(9 downto 0);--para restar la mitad mitad sera 255, de -255 a 255
            bias_next <= not(BIAS_FC(7))& BIAS_FC(6 downto 0);
            mult_signed_next<=signed(mult_suma_next);
            bias_signed_next<=signed(bias_next);
            suma_final_next <=mult_signed_next + bias_signed_next;
            --suma_final_next <=signed(mult_suma_next) + signed(bias_next);
            /*
            if (suma_final_next> "01111111") then --127
                                        resultado_total_next<="11111111";
                                    elsif( suma_final_next< "10000000") then--128
                                        resultado_total_next<="00000000";
                                    else
                                        c_resultado_total_next<= std_logic_vector(suma_entradas_reg(7 downto 0));
                                        resultado_total_next<= not(c_resultado_total_next(7)) & c_resultado_total_next(6 downto 0);
            end if;*/
             resultado_total_next<= std_logic_vector(suma_final_next);
            if(unsigned(resultado_total_next)>Umbral_Sigmoid) then --la mitad e ¡s 128*2
                            y_next<='1';
               else
                            y_next<='0';
             end if;
     end if;
end process;
--process(CLK, Reset, Finalizado_entradas)             
process(CLK, Reset) 
begin
    if reset='0' then
        suma_una_reg<= (others => '0');
        suma_entradas_reg<= to_signed(0,10);
        --suma_una_std_9<= (others => '0');
        suma_una_std_8_reg <=(others => '0');
        suma_una_std_9_reg <= (others => '0');
        resultado_total_reg <= (others => '0');
        c_resultado_total_reg <= (others => '0');
        inicio_global<='1';
         y_reg<='0';
     elsif CLK'event and CLK='1' then
                suma_una_std_8_reg<=suma_una_std_8_next;
                suma_una_std_9_reg<=suma_una_std_9_next;
                suma_entradas_reg<=suma_entradas_next;
                
                resultado_total_reg <= resultado_total_next;
                c_resultado_total_reg <= c_resultado_total_next;
                
                suma_una_norm_reg<=suma_una_norm_next;
                
                y_reg<=y_next;
                sumar_mitad_reg<=sumar_mitad_next;
                c_sumar_mitad_reg<=c_sumar_mitad_next;
                mult_suma_reg<= mult_suma_next;
                suma_final_reg <= suma_final_next;
                c_resultado_total_reg<= c_resultado_total_next;
                resultado_total_reg <= resultado_total_next;
                bias_reg <= bias_next;
                bias_signed_reg <=bias_signed_next;
                mult_signed_reg <=mult_signed_next;
                
                suma_total_next_sin_norm_reg<=suma_total_next_sin_norm;
                suma_total_next_norm_unsigned_reg<=suma_total_next_norm_unsigned;
                r_XNOR <= x_sc XNOR w_sc;
                if (r_XNOR='1') then
                        suma_una_reg <= suma_una_reg + 1;
                 else
                        suma_una_reg <= suma_una_reg;
                 end if;
                 
                s_activacion_start<='0';  
                if (start='1') then --adetrasar 2 ciclos
                    s_activacion_start<='1'; 
                    if (inicio_global='1') then
                            valor_suma<= (others => '0'); --para la primera de todas
                            inicio_global<='0';
                     end if;                 
                 elsif (start='0' and s_activacion_start='1') then-- DETECTAR FLANCO DE BAJADA START
                     s_activacion_start<='0';
                     suma_una_reg<= (others => '0');
                  else 
                     s_activacion_start<='0';
                  end if; 

                 do_suma_entrada_c<='0';
                 s_activacion_e_2<='0';
                  if (entrada_complete='1') then --adetrasar 3 ciclos para que pille correctamente la última de xnor
                    s_activacion_e_1<='1';                  
                  elsif (entrada_complete='0' and s_activacion_e_1='1') then-- DETECTAR FLANCO DE BAJADA START
                     s_activacion_e_1<='0';
                     s_activacion_e_2<='1';
                  elsif (entrada_complete='0' and s_activacion_e_2='1') then-- DETECTAR FLANCO DE BAJADA START
                     do_suma_entrada_c<='1';
                     s_activacion_e_2<='0';
                     valor_suma <=suma_una_reg;
                     suma_una_reg<= (others => '0');
                  else 
                     s_activacion_e_1<='0';
                     do_suma_entrada_c<='0';
                     s_activacion_e_2<='0';
                  end if;
                  
                 s_activacion_f_1<='0';
                 Finalizado_suma <='0';
                 s_activacion_f_2<='0';
                  if (Finalizado_entradas='1') then --adetrasar 3 ciclos para que pille correctamente la última de xnor
                    s_activacion_f_1<='1';                  
                  elsif (Finalizado_entradas='0' and s_activacion_f_1='1') then-- DETECTAR FLANCO DE BAJADA START
                     s_activacion_f_1<='0';
                     s_activacion_f_2<='1';
                  elsif (entrada_complete='0' and s_activacion_f_2='1') then-- DETECTAR FLANCO DE BAJADA START
                     Finalizado_suma <='1';
                     s_activacion_f_2<='0';
                     
                  else 
                     s_activacion_f_1<='0';
                     Finalizado_suma <='0';
                     s_activacion_f_2<='0';
                  end if;

               
                 --Finalizado_suma <='0';  
                  --f (Finalizado_entradas='1') then --adetrasar un ciclo
                 --       Finalizado_suma<='1';
                  --end if;
               
                 if (Finalizado_suma='1') then     
                     suma_una_reg<= (others => '0');
                     suma_entradas_reg<= to_signed(0,10);
                end if;

               
     end if;
end process;
y<= y_reg;
resultado_total<=resultado_total_reg;
end Behavioral;
