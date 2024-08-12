use work.Package_FC_120.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_120_48_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_120_48_LAYER;

architecture Behavioral of ROM_FC_120_48_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_120 is Array (0 to (Dim_pesos_FC-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_120_48: ROM_ARRAY_PESOS_FC_120 := (
"01101101", 
"10111001", 
"01110101", 
"01110000", 
"01000111", 
"01001111", 
"10011001", 
"10000010", 
"01111111", 
"01100111", 
"01101011", 
"01110000", 
"01110011", 
"01011011", 
"10101000", 
"01100011", 
"01110000", 
"10000100", 
"10000111", 
"01001111", 
"01110010", 
"01110111", 
"10010010", 
"10001111", 
"10011111", 
"01101100", 
"10110101", 
"10000111", 
"10011100", 
"10101000", 
"10110000", 
"10001001", 
"10111011", 
"10000010", 
"10010100", 
"01101010", 
"01100011", 
"10000011", 
"01011110", 
"01111110", 
"10010001", 
"10001001", 
"10001110", 
"01000011", 
"10001001", 
"10000000", 
"10010011", 
"01111000", 
"01110000", 
"01000010", 
"01110000", 
"01110100", 
"01101001", 
"01101000", 
"01110101", 
"10000101", 
"01101000", 
"01111101", 
"10010111", 
"01100110", 
"10100011", 
"01000101", 
"01110011", 
"01110010", 
"01101000", 
"10001000", 
"01111000", 
"01000010", 
"01100111", 
"01000111", 
"10000000", 
"10010101", 
"01100100", 
"01110000", 
"10000100", 
"10011100", 
"01010110", 
"10111100", 
"01101011", 
"10000100", 
"01111000", 
"10101001", 
"10011100", 
"01100001", 
"01110111", 
"10001111", 
"10001111", 
"10000110", 
"10010110", 
"10010000", 
"10111011", 
"10100011", 
"10001001", 
"10011101", 
"01100101", 
"01111101", 
"01010111", 
"01101111", 
"10011001", 
"10000111", 
"01111111", 
"01101011", 
"01100001", 
"01011011", 
"10101011", 
"10111110", 
"10100001", 
"01110111", 
"01111110", 
"10101100", 
"01111001", 
"01110110", 
"01000101", 
"01101100", 
"10000010", 
"10000110", 
"10001001", 
"10000010", 
"00011110", 
"01010101", 
"10100100", 
"11001000", 
"01111010", 
"10001000", 
"01110110", 
"10101011", 
"01110011", 
"01110011", 
"10001110", 
"01101100", 
"01110011", 
"10010011", 
"01001011", 
"10001001", 
"01111111", 
"10110100", 
"10111101", 
"10000011", 
"10011011", 
"01011000", 
"01110001", 
"11001110", 
"10010000", 
"01110010", 
"01010111", 
"01011001", 
"01100110", 
"01110101", 
"01110110", 
"01111111", 
"10010111", 
"10110100", 
"10100101", 
"01111101", 
"10000111", 
"01111000", 
"01000110", 
"11001101", 
"01101000", 
"10000110", 
"01100001", 
"01101111", 
"01111101", 
"01001010", 
"01110000", 
"01111001", 
"10100000", 
"01100111", 
"10110000", 
"01101000", 
"10001111", 
"10011000", 
"01100011", 
"01110001", 
"11001111", 
"10001011", 
"10000011", 
"10101100", 
"01110010", 
"00110010", 
"01110101", 
"10010110", 
"01101001", 
"01011111", 
"01111110", 
"00100000", 
"01011000", 
"10111110", 
"10011001", 
"10110010", 
"01101011", 
"01110111", 
"01101011", 
"01111000", 
"01111101", 
"10011001", 
"01111101", 
"01110100", 
"10010101", 
"10011100", 
"10001110", 
"01100110", 
"10101011", 
"01000110", 
"01111011", 
"10001110", 
"01010000", 
"10001111", 
"01110111", 
"01011010", 
"01110111", 
"10000101", 
"01001010", 
"01110010", 
"10101101", 
"10101100", 
"10110001", 
"01111111", 
"10000011", 
"01110110", 
"01101111", 
"10100011", 
"01100000", 
"10010101", 
"10000001", 
"01010001", 
"10011011", 
"10010100", 
"01101000", 
"01101111", 
"11010110", 
"01101010", 
"10000100", 
"01110000", 
"01011111", 
"10010011", 
"01111101", 
"01100100", 
"01110000", 
"10001010", 
"10100110", 
"10001111", 
"01101110", 
"00010100", 
"10010111", 
"10000011", 
"01100000", 
"10010000", 
"10101001", 
"01101100", 
"01100100", 
"10100111", 
"10001010", 
"00100010", 
"01110101", 
"01111110"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_120_48: signal is "block";
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
    douta_pool_2<= ROM_FC_120_48(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
