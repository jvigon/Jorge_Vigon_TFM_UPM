
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;


use work.Package_FC_10.all;

entity Add_Multiplication_FC_10 is
     Port ( CLK : in STD_LOGIC;
                   Reset : in STD_LOGIC;
                   x_sc : in STD_LOGIC;
                   w_sc : in STD_LOGIC;
                   Start : in STD_LOGIC;
                   entrada_complete : in STD_LOGIC;
                   Finalizado_entradas : in STD_LOGIC;
                   r_suma : out STD_LOGIC_VECTOR (7 downto 0);
                   Bias_Neurona  : in STD_LOGIC_VECTOR ( 7  downto 0)
                   );
end Add_Multiplication_FC_10;

architecture Behavioral of Add_Multiplication_FC_10 is
signal r_XNOR: std_logic;
signal suma_una_next,suma_una_reg: unsigned( 7 downto 0);
signal suma_una_std_8_next,suma_una_std_8_reg : std_logic_vector(7 downto 0);
signal suma_una_std_9_next,suma_una_std_9_reg : std_logic_vector(8 downto 0);
signal suma_entradas_next,suma_entradas_reg: signed((7+ Max_rango +1) downto 0);


signal bias_next,bias_reg: std_logic_vector( 8 downto 0);--esto dejarlo siempre como 9

signal suma_total_next,suma_total_reg : signed((7+ Division_valores +1 -log2c(Division_valores)) downto 0);
signal resultado_total_next,resultado_total_reg : std_logic_vector(7 downto 0);
signal c_resultado_total_next,c_resultado_total_reg  : std_logic_vector(7 downto 0);


signal in_sum1,in_sum1_reg : signed((7+ Max_rango +1) downto 0); 
signal in_sum2,in_sum2_reg: signed(8 downto 0); 
signal out_sum : signed((7+ Max_rango +1) downto 0); 


--modifico 
signal Bias_Correcto_next, Bias_Correcto_reg : STD_LOGIC_VECTOR (7 downto 0);
signal resultado_total_12_std_next,resultado_total_12_std_reg: std_logic_vector((7+ Max_rango +1) downto 0); --se tiene que dividir por 2
signal resultado_total_12_signed_next,resultado_total_12_signed_reg: signed((7+ Max_rango +1) downto 0); --se tiene que dividir por 2

--lo pongo yo se suman muchos errores y te la lia
signal suma_total_next_sin_norm,suma_total_next_sin_norm_reg : std_logic_vector(7 downto 0);
signal suma_total_next_norm_unsigned,suma_total_next_norm_unsigned_reg : unsigned (7 downto 0);

signal suma_una_norm_next,suma_una_norm_reg: unsigned( 7 downto 0);
begin


COMB_ENTRADA_COMPLETA: process(all)
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

--por lo de la preciosion:
suma_total_next_sin_norm<=suma_total_next_sin_norm_reg;
suma_total_next_norm_unsigned<=suma_total_next_norm_unsigned_reg;
suma_una_norm_next<=suma_una_norm_reg;
         if (entrada_complete='1' and Finalizado_entradas='0') then
                            if (suma_una_reg>=125 and suma_una_reg<129) then
                                    suma_una_norm_next<=to_unsigned(128,8);
                            else
                                    suma_una_norm_next<=suma_una_reg;
                             end if;
                            suma_una_std_8_next<= std_logic_vector(suma_una_norm_next); --DUDA

                            suma_una_std_9_next<= not(suma_una_std_8_next(7)) & not(suma_una_std_8_next(7)) & suma_una_std_8_next(6 downto 0); --prolongamos bit de signo y restamos 128

                            in_sum1<= suma_entradas_reg;--para utilizar mismo sumador
                            in_sum2<= signed(suma_una_std_9_next);
                            suma_entradas_next<= out_sum;
        elsif (Finalizado_entradas='1') then
                           
                            bias_next <= not(Bias_Correcto_next(7)) & not(Bias_Correcto_next(7)) & Bias_Correcto_next(6 downto 0);

                            in_sum1<=suma_entradas_reg;
                            in_sum2<=signed(bias_next);

                            resultado_total_12_signed_next <= out_sum;
                            resultado_total_12_std_next <=std_logic_vector(resultado_total_12_signed_next);

                            suma_total_next<=  (resultado_total_12_signed_next((7+ Division_valores +1) downto (log2c(Division_valores))));

                                   if (suma_total_next> "01111111") then --127
                                           resultado_total_next<="11111111";

                                   elsif( suma_total_next< "10000000") then-- -128
                                           resultado_total_next<="00000000";
                                  else
                                            c_resultado_total_next<= std_logic_vector(suma_total_next(7 downto 0));
                                            resultado_total_next<= not(c_resultado_total_next(7)) & c_resultado_total_next(6 downto 0);
                                            suma_total_next_sin_norm<= not(c_resultado_total_next(7)) & c_resultado_total_next(6 downto 0);
                                            resultado_total_next<=suma_total_next_sin_norm;

                                   end if;
                                                 
          end if; 
end process;

process(CLK, Reset, Finalizado_entradas) 
begin
    if reset='0' then
        suma_una_reg<= (others => '0');
        suma_entradas_reg<= to_signed(0,(7+ Max_rango +2));
        --suma_una_std_9<= (others => '0');
        suma_una_std_8_reg <=(others => '0');
        suma_una_std_9_reg <= (others => '0');
        
        bias_reg <= (others => '0');
        suma_total_reg <= (others => '0');
        resultado_total_reg <= (others => '0');
        c_resultado_total_reg <= (others => '0');
        
        in_sum1_reg <= (others => '0');
        in_sum2_reg <= (others => '0');
        resultado_total_12_signed_reg <= to_signed(0,(7+ Max_rango +2));
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
                
                suma_una_norm_reg<=suma_una_norm_next;
                r_XNOR <= x_sc XNOR w_sc;
                if (r_XNOR='1') then
                        suma_una_reg <= suma_una_reg + 1;
                 else
                        suma_una_reg <= suma_una_reg;
                 end if;
                  
                
                 if (Finalizado_entradas='1') then

                     r_suma<= resultado_total_next;        
                     suma_una_reg<= (others => '0');

                 elsif(start='1') then
                        suma_una_reg<= (others => '0'); 
                          
                          --suma_una_reg<= suma_una_next;
                 end if;
     end if;
end process;

Bias_Correcto_next <=Bias_Neurona;
out_sum <= in_sum1 + in_sum2;

end Behavioral;
