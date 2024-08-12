LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
use work.CNN_Package.all;
ENTITY LED IS
      PORT (
        clk : IN STD_LOGIC;
        resultado_total : IN STD_LOGIC_VECTOR((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
        --address_uart_ver_led : in STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 downto 0);
        an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
      );
--    PORT (
--        clk : IN STD_LOGIC;
--      resultado_total : IN STD_LOGIC_VECTOR((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
       
--        an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--        seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
--    );
END LED;

ARCHITECTURE Behavioral OF LED IS
    signal an_buff : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal seg_buff : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL seg1, seg2, seg3, seg4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    signal decimal_value : INTEGER := 0;
    signal millares, centenas, decenas, unidades : INTEGER := 0;
    SIGNAL c_reg, c_next : unsigned(11 DOWNTO 0) := (OTHERS => '0');
    --signal resultado_total : STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 downto 0);
    
attribute keep : boolean;       

--attribute keep of resultado_total : signal is true;
attribute keep of unidades,decenas,millares,centenas : signal is true;
attribute keep of seg_buff,seg : signal is true;
attribute keep of an : signal is true;

BEGIN
--resultado_total<= address_uart_ver_led;
-- Registro de estado
process(clk)
begin
    if(clk'event and clk='1') then 
       c_reg <= c_next;
    end if;
end process;

-- Lógica de siguiente estado
c_next <= c_reg + 1;

-- Conversión del valor de entrada a decimal y descomposición en millares, centenas, decenas y unidades
process(resultado_total,decimal_value)
begin
    decimal_value <= to_integer(unsigned(resultado_total));

    millares <= decimal_value / 1000;
    centenas <= (decimal_value / 100) mod 10;
    decenas <= (decimal_value / 10) mod 10;
    unidades <= decimal_value mod 10;
end process;

-- Mapeo de los números a los segmentos de 7 segmentos
WITH millares SELECT
    seg4 <= "1000000" WHEN 0,  -- 0
             "1111001" WHEN 1,  -- 1
             "0100100" WHEN 2,  -- 2
             "0110000" WHEN 3,  -- 3
             "0011001" WHEN 4,  -- 4
             "0010010" WHEN 5,  -- 5
             "0000010" WHEN 6,  -- 6
             "1111000" WHEN 7,  -- 7
             "0000000" WHEN 8,  -- 8
             "0010000" WHEN 9,  -- 9
             "0111111" WHEN OTHERS;

WITH centenas SELECT
    seg3 <= "1000000" WHEN 0,
             "1111001" WHEN 1,
             "0100100" WHEN 2,
             "0110000" WHEN 3,
             "0011001" WHEN 4,
             "0010010" WHEN 5,
             "0000010" WHEN 6,
             "1111000" WHEN 7,
             "0000000" WHEN 8,
             "0010000" WHEN 9,
             "0111111" WHEN OTHERS;

WITH decenas SELECT
    seg2 <= "1000000" WHEN 0,
             "1111001" WHEN 1,
             "0100100" WHEN 2,
             "0110000" WHEN 3,
             "0011001" WHEN 4,
             "0010010" WHEN 5,
             "0000010" WHEN 6,
             "1111000" WHEN 7,
             "0000000" WHEN 8,
             "0010000" WHEN 9,
             "0111111" WHEN OTHERS;

WITH unidades SELECT
    seg1 <= "1000000" WHEN 0,
             "1111001" WHEN 1,
             "0100100" WHEN 2,
             "0110000" WHEN 3,
             "0011001" WHEN 4,
             "0010010" WHEN 5,
             "0000010" WHEN 6,
             "1111000" WHEN 7,
             "0000000" WHEN 8,
             "0010000" WHEN 9,
             "0111111" WHEN OTHERS;

-- Selección del display activo
process(an_buff, seg_buff, seg1, seg2, seg3, seg4, c_reg)
begin
    case c_reg(11 downto 10) is
        when "11" =>--millares
            an_buff <= "01111111";
            seg_buff <= seg4;
        when "10" =>
            an_buff <= "10111111";
            seg_buff <= seg3;
        when "01" =>
            an_buff <= "11011111";
            seg_buff <= seg2;
        when others =>--unidades
            an_buff <= "11101111";
            seg_buff <= seg1;
    end case;
end process;

an <= an_buff;
seg <= seg_buff;

END Behavioral;
