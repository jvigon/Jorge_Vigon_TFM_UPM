use work.Package_FC_120.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_120_90_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_120_90_LAYER;

architecture Behavioral of ROM_FC_120_90_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_120 is Array (0 to (Dim_pesos_FC-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_120_90: ROM_ARRAY_PESOS_FC_120 := (
"01011100", 
"01011100", 
"01010100", 
"00111111", 
"10010101", 
"01000010", 
"01110101", 
"01110101", 
"01011111", 
"01100111", 
"10000101", 
"10000110", 
"01101101", 
"01110001", 
"10001001", 
"01101001", 
"01011001", 
"01110000", 
"10000100", 
"01100110", 
"10100110", 
"00000110", 
"10001001", 
"01101001", 
"01110101", 
"10001000", 
"01101100", 
"10010011", 
"10100101", 
"00000000", 
"01011000", 
"10001010", 
"00111101", 
"01101111", 
"10100110", 
"10000101", 
"01111000", 
"01010110", 
"01011010", 
"10001000", 
"01111010", 
"10010111", 
"01011001", 
"10010010", 
"10000100", 
"10001011", 
"01111010", 
"01011001", 
"01100110", 
"10001110", 
"01001001", 
"10000110", 
"01100010", 
"01010011", 
"00011111", 
"10010111", 
"01100100", 
"10011000", 
"10000000", 
"10011010", 
"01010001", 
"01101010", 
"10010001", 
"00110111", 
"10011000", 
"01001101", 
"01001111", 
"01110101", 
"10100001", 
"10001011", 
"10011011", 
"01100111", 
"01111110", 
"01111110", 
"01111000", 
"01101001", 
"00001000", 
"10111010", 
"01110111", 
"10010111", 
"10001011", 
"01001110", 
"10000000", 
"10000111", 
"01110000", 
"01011111", 
"11000111", 
"10010001", 
"01101001", 
"10000000", 
"01010100", 
"10001000", 
"10000010", 
"00110110", 
"10000011", 
"01110010", 
"01110001", 
"10000010", 
"01110001", 
"01100000", 
"01011101", 
"10000010", 
"10000111", 
"01110011", 
"01110110", 
"01010110", 
"01110000", 
"10000111", 
"11001011", 
"01010101", 
"01001110", 
"01111110", 
"10011110", 
"10100101", 
"01001011", 
"01101000", 
"01101111", 
"10010000", 
"01110101", 
"10011011", 
"01100110", 
"01010100", 
"01110000", 
"01000111", 
"01100110", 
"01001011", 
"10010010", 
"01101110", 
"10010111", 
"01000111", 
"01111000", 
"11000010", 
"00101110", 
"10000101", 
"00101011", 
"00101101", 
"01110111", 
"01110001", 
"01011010", 
"10001101", 
"01000001", 
"10010000", 
"10001010", 
"01110001", 
"00111010", 
"01011111", 
"10000101", 
"11000011", 
"10001000", 
"01110000", 
"01110000", 
"00110011", 
"01101010", 
"10010100", 
"10000011", 
"10011000", 
"01110010", 
"00111101", 
"01110100", 
"01101111", 
"01110110", 
"10001001", 
"01111010", 
"10010111", 
"01100011", 
"11000110", 
"01111000", 
"10010100", 
"01101100", 
"01101010", 
"10000010", 
"01001101", 
"01011100", 
"01111011", 
"10010100", 
"10010011", 
"01100111", 
"01111010", 
"01101011", 
"01110100", 
"01101000", 
"10001101", 
"01110001", 
"01100100", 
"01110010", 
"01011110", 
"01111111", 
"01011101", 
"01001100", 
"01111010", 
"10100001", 
"01111100", 
"10011011", 
"01110111", 
"01110011", 
"10011010", 
"01100110", 
"01001111", 
"10001101", 
"10000000", 
"01101011", 
"10001000", 
"10011111", 
"10000000", 
"01110110", 
"10010111", 
"01111000", 
"01111010", 
"01111101", 
"01100011", 
"01011101", 
"01011011", 
"01110001", 
"10000110", 
"01111101", 
"01100111", 
"01100100", 
"01111010", 
"00101001", 
"10010111", 
"10100000", 
"00111001", 
"10110011", 
"01110110", 
"10110100", 
"10011010", 
"00111101", 
"01000110", 
"01110000", 
"10011100", 
"01010011", 
"01110111", 
"10001110", 
"00111111", 
"01111111", 
"01110010", 
"01100011", 
"10000111", 
"10011011", 
"10010010", 
"10101100", 
"10000010", 
"10000010", 
"01101111", 
"01111101", 
"10100010", 
"10011011", 
"10001101", 
"10000100", 
"00100101", 
"10000010", 
"01000111", 
"00001001", 
"10001110", 
"01110111", 
"10001001"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_120_90: signal is "block";
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
    douta_pool_2<= ROM_FC_120_90(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
