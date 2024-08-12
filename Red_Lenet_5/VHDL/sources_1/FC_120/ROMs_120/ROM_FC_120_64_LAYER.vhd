use work.Package_FC_120.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_120_64_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_120_64_LAYER;

architecture Behavioral of ROM_FC_120_64_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_120 is Array (0 to (Dim_pesos_FC-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_120_64: ROM_ARRAY_PESOS_FC_120 := (
"01110010", 
"01110011", 
"01010001", 
"10011110", 
"01101010", 
"10011000", 
"10100011", 
"11010001", 
"10010011", 
"01110110", 
"10010001", 
"01010100", 
"01100011", 
"01001000", 
"01111000", 
"10000100", 
"10101111", 
"01110101", 
"10100000", 
"01000101", 
"01101100", 
"01100011", 
"10110100", 
"10001101", 
"10000100", 
"10001110", 
"10011100", 
"01000000", 
"01110011", 
"01000001", 
"10001101", 
"10000010", 
"10011110", 
"10001000", 
"10101000", 
"01100011", 
"10000011", 
"01110000", 
"01110110", 
"00110000", 
"10001101", 
"01101011", 
"10001100", 
"01111100", 
"01101010", 
"10011100", 
"01100011", 
"10000001", 
"01011010", 
"10010111", 
"10000011", 
"10000001", 
"01111111", 
"01101000", 
"10101100", 
"01100100", 
"01111001", 
"10001011", 
"10001010", 
"01110100", 
"00111010", 
"10100111", 
"01110001", 
"10000001", 
"01111001", 
"00011001", 
"01100000", 
"01100111", 
"10000000", 
"11001001", 
"01101110", 
"10010010", 
"01111000", 
"01001110", 
"01110011", 
"00000000", 
"01101001", 
"01010110", 
"01111111", 
"01110010", 
"10111010", 
"01010110", 
"10000001", 
"10001111", 
"10000001", 
"10011010", 
"01010001", 
"01101111", 
"01100111", 
"01100101", 
"10100101", 
"01001100", 
"01101101", 
"10010101", 
"01111101", 
"01110110", 
"01011101", 
"01010111", 
"01000001", 
"01110100", 
"01110110", 
"01011010", 
"01011110", 
"01100011", 
"10011111", 
"01101011", 
"01011101", 
"01100111", 
"01110111", 
"01101010", 
"01111001", 
"01110100", 
"01000001", 
"10000000", 
"01010000", 
"00101110", 
"01111111", 
"01111000", 
"10010100", 
"01100010", 
"01110101", 
"01111010", 
"01011001", 
"10000100", 
"10001011", 
"10000110", 
"10000010", 
"10000101", 
"01111110", 
"01010111", 
"01100110", 
"01010100", 
"01001111", 
"10111001", 
"00111100", 
"01011101", 
"10001101", 
"01011100", 
"10010011", 
"01100000", 
"01111111", 
"01111111", 
"01110010", 
"01110100", 
"01101101", 
"01010110", 
"10010010", 
"01110110", 
"10001001", 
"01110101", 
"01001000", 
"01010010", 
"10000110", 
"01100100", 
"10101011", 
"01001111", 
"10011001", 
"10100110", 
"01101011", 
"01100101", 
"10010001", 
"01111111", 
"10001100", 
"01011001", 
"01110100", 
"01100001", 
"10101101", 
"01010000", 
"10100101", 
"01110010", 
"01100110", 
"01100010", 
"10000001", 
"10001011", 
"10000001", 
"10000101", 
"10000101", 
"01111011", 
"01100101", 
"00110000", 
"01111111", 
"01111001", 
"10110100", 
"01100111", 
"10000100", 
"01101001", 
"01010000", 
"01110110", 
"01111100", 
"10011001", 
"10000111", 
"10001011", 
"10011111", 
"01001000", 
"01100001", 
"01100100", 
"10001100", 
"10101100", 
"10001001", 
"01111011", 
"10000001", 
"01000101", 
"10100000", 
"01010001", 
"00110100", 
"01110010", 
"01111011", 
"10000000", 
"01010010", 
"00100010", 
"01111000", 
"01111010", 
"01101111", 
"00111100", 
"10110011", 
"10011011", 
"10010110", 
"00111010", 
"10011101", 
"01101110", 
"01001110", 
"01111100", 
"10001101", 
"01111100", 
"01100011", 
"01001110", 
"10001110", 
"10110000", 
"10001001", 
"01111110", 
"10100111", 
"01010001", 
"10001110", 
"01011000", 
"01000100", 
"01011100", 
"10000111", 
"10110101", 
"01101000", 
"10000101", 
"10010000", 
"10001011", 
"10011011", 
"01010100", 
"01101001", 
"10000000", 
"10011111", 
"01001110", 
"10001011", 
"01111001", 
"01111001", 
"01011011", 
"10100000", 
"01100001", 
"10000011", 
"01101000"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_120_64: signal is "block";
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
    douta_pool_2<= ROM_FC_120_64(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
