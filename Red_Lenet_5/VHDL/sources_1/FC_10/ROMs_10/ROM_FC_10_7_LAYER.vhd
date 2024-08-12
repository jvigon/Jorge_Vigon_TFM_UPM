use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_7_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_7_LAYER;

architecture Behavioral of ROM_FC_10_7_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_7: ROM_ARRAY_PESOS_FC_10 := (
"01100111", 
"01111110", 
"10000100", 
"10000001", 
"01101100", 
"10001100", 
"10000011", 
"01101000", 
"01110010", 
"01011111", 
"01110001", 
"01110101", 
"01111001", 
"10001101", 
"10010101", 
"01110111", 
"01001110", 
"00110100", 
"01101010", 
"10000001", 
"01011100", 
"01100101", 
"10010111", 
"01100111", 
"01100001", 
"01111000", 
"01101001", 
"10000011", 
"10001111", 
"10000100", 
"10010001", 
"01111010", 
"10000100", 
"01110000", 
"10010101", 
"10010001", 
"10011000", 
"10001110", 
"01111000", 
"10010100", 
"00111100", 
"01100110", 
"10100010", 
"10011101", 
"10011010", 
"01101010", 
"10011001", 
"01011010", 
"10001001", 
"01100111", 
"01111100", 
"10000000", 
"10001011", 
"10001000", 
"10011000", 
"10000110", 
"01100100", 
"10000100", 
"01111000", 
"10000011", 
"01111111", 
"10001101", 
"01111000", 
"01101110", 
"10011010", 
"01101001", 
"01010110", 
"01111110", 
"01101100", 
"10010101", 
"10001111", 
"01111111", 
"10000000", 
"10001010", 
"10000010", 
"10000001", 
"10010101", 
"10001011", 
"10000000", 
"01010010", 
"10001011", 
"10001100", 
"01110111", 
"01110000"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_7 : signal is "block";
begin
   -- W_next <= ROM_FC_120_0(to_integer(unsigned(addra_pool_2)));
    --douta_pool_2 <= W_reg;

--    PROCESS (clk, reset)
--    BEGIN
--        IF reset = '0' THEN
--            W_reg <= (others => '0');
--        ELSIF CLK'event and CLK = '1' THEN
--            W_reg <= W_next;
--        END IF;
--    end process;

process(clk)
begin
if rising_edge(clk) then
    douta_pool_2<= ROM_FC_10_7(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
