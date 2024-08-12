use work.Package_FC_120.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_120_113_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_120_113_LAYER;

architecture Behavioral of ROM_FC_120_113_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_120 is Array (0 to (Dim_pesos_FC-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_120_113: ROM_ARRAY_PESOS_FC_120 := (
"01100011", 
"10001011", 
"01101001", 
"01011100", 
"10000000", 
"01011101", 
"01111011", 
"10011100", 
"10001101", 
"10000110", 
"01100101", 
"10100101", 
"10011101", 
"00101000", 
"10001101", 
"10000010", 
"10001111", 
"01100010", 
"01001100", 
"01011010", 
"01110010", 
"10010110", 
"01011101", 
"10100110", 
"01110100", 
"01101111", 
"01010110", 
"10001010", 
"10010111", 
"01011110", 
"10001110", 
"01101111", 
"10110101", 
"00111001", 
"01000000", 
"01001110", 
"10000100", 
"10000101", 
"01000111", 
"10110011", 
"10000110", 
"10000110", 
"00111001", 
"10010010", 
"01101001", 
"01001000", 
"10000000", 
"01110000", 
"10001110", 
"00111010", 
"01101011", 
"01010000", 
"01110101", 
"00110110", 
"01000010", 
"11010010", 
"01110000", 
"10000111", 
"01111001", 
"01011100", 
"01000111", 
"01010010", 
"01110010", 
"01101011", 
"01111000", 
"00111001", 
"01100010", 
"01101100", 
"01110000", 
"01000100", 
"01101000", 
"10010001", 
"01101101", 
"01100001", 
"10001011", 
"10000010", 
"10010000", 
"01101100", 
"01111001", 
"01110101", 
"10100101", 
"01101000", 
"01111001", 
"01001110", 
"10100001", 
"10011111", 
"10010100", 
"10100101", 
"01111011", 
"01111000", 
"01101001", 
"01001000", 
"01101110", 
"01010110", 
"10000100", 
"01101001", 
"10011000", 
"01010101", 
"10000101", 
"10010101", 
"01101011", 
"01100011", 
"01111110", 
"10100101", 
"01111010", 
"01000101", 
"01111111", 
"01001010", 
"01111100", 
"00101001", 
"01110110", 
"10000110", 
"00111001", 
"01110010", 
"01111011", 
"10100011", 
"01101010", 
"00111011", 
"00100100", 
"10101100", 
"01111000", 
"00110000", 
"01001111", 
"01100010", 
"01111011", 
"10010001", 
"10000110", 
"10001010", 
"01100100", 
"01110011", 
"10111011", 
"10100000", 
"01110011", 
"01100101", 
"01111001", 
"01011101", 
"01111001", 
"01100001", 
"10101101", 
"10011101", 
"10010110", 
"01101001", 
"01110011", 
"01101011", 
"01100111", 
"01100000", 
"10001010", 
"10001111", 
"10010011", 
"10001000", 
"10001010", 
"01111010", 
"10011000", 
"01100100", 
"01110010", 
"10000100", 
"10001110", 
"01000011", 
"01110010", 
"10001110", 
"01011001", 
"01110011", 
"10010000", 
"01111111", 
"01101011", 
"01111100", 
"10001101", 
"01101000", 
"01110110", 
"10011110", 
"01110000", 
"01101000", 
"01011000", 
"01111000", 
"01111100", 
"01101110", 
"00110010", 
"10101001", 
"10100100", 
"01001010", 
"01111100", 
"10010010", 
"01000111", 
"01101110", 
"10000001", 
"10001001", 
"01110010", 
"10010110", 
"10110100", 
"10010111", 
"10000011", 
"01110101", 
"01101011", 
"01000100", 
"10011011", 
"01110101", 
"01101000", 
"10001111", 
"01011100", 
"01100111", 
"10000110", 
"10011101", 
"10010000", 
"00101111", 
"01010010", 
"01110000", 
"10000110", 
"01101100", 
"10001110", 
"00110101", 
"10001011", 
"10001110", 
"01111011", 
"01101100", 
"01010100", 
"01100001", 
"01111010", 
"01111001", 
"10001111", 
"01101100", 
"01011011", 
"10011101", 
"01110100", 
"10001111", 
"01101010", 
"01111100", 
"10001100", 
"01010110", 
"10001101", 
"01001110", 
"01011100", 
"10000001", 
"01111110", 
"01101111", 
"01111101", 
"10111010", 
"10101010", 
"01100000", 
"01110100", 
"10000101", 
"01001101", 
"10011111", 
"10000000", 
"01010111", 
"01111110", 
"01011110", 
"01110000", 
"01110111", 
"01101101", 
"10001100", 
"01101111", 
"10111111", 
"11001110", 
"01000111", 
"01111011", 
"10001000"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_120_113 : signal is "block";
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
    douta_pool_2<= ROM_FC_120_113(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
