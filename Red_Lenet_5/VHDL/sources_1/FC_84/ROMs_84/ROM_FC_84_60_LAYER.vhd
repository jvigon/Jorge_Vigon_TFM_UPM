use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_60_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_60_LAYER;

architecture Behavioral of ROM_FC_84_60_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_84_60: ROM_ARRAY_PESOS_FC_84 := (
"01101101", 
"10111011", 
"01100111", 
"10000111", 
"01000001", 
"10010010", 
"01110010", 
"01011010", 
"01010011", 
"11000101", 
"01011100", 
"01000100", 
"01111010", 
"00111111", 
"01110100", 
"01111100", 
"01011101", 
"10100100", 
"01101001", 
"10001001", 
"10000101", 
"10001000", 
"01100111", 
"01111110", 
"10010001", 
"01111100", 
"01011100", 
"01101010", 
"01110000", 
"01011010", 
"01111111", 
"10000111", 
"10001000", 
"01110110", 
"10100111", 
"01000100", 
"10000111", 
"01100110", 
"01011100", 
"01100101", 
"01011111", 
"00110101", 
"10100100", 
"01101010", 
"01110100", 
"01011010", 
"01111000", 
"01011001", 
"01101000", 
"10010011", 
"10001100", 
"01110100", 
"01110101", 
"00110001", 
"01101011", 
"01001001", 
"10001101", 
"10001011", 
"01011111", 
"01111101", 
"01110111", 
"01010001", 
"10010010", 
"01001000", 
"10000101", 
"01010111", 
"10110110", 
"10000111", 
"01111000", 
"10010110", 
"01011100", 
"01100010", 
"10000010", 
"10011100", 
"10010110", 
"01110110", 
"10001001", 
"10000010", 
"01011011", 
"01101100", 
"10001110", 
"00111110", 
"10001100", 
"10101101", 
"00110010", 
"01110101", 
"01111010", 
"00111100", 
"10000100", 
"10000101", 
"10010110", 
"11010111", 
"10101010", 
"01011010", 
"01110010", 
"10000111", 
"01111101", 
"01101111", 
"00110110", 
"01011010", 
"10001001", 
"10011011", 
"01110111", 
"01100111", 
"01101110", 
"01111100", 
"10010110", 
"10010010", 
"10000111", 
"01101010", 
"01111000", 
"10011000", 
"01110100", 
"01011000", 
"01110110", 
"10101010", 
"10001100", 
"01010000", 
"01100101", 
"01110001"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_60 : signal is "block";
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
    douta_pool_2<= ROM_FC_84_60(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
