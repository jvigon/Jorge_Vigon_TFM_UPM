use work.Package_FC_120.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_120_86_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_120_86_LAYER;

architecture Behavioral of ROM_FC_120_86_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_120 is Array (0 to (Dim_pesos_FC-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_120_86: ROM_ARRAY_PESOS_FC_120 := (
"10101110", 
"10000101", 
"10000010", 
"01100101", 
"01010111", 
"10010011", 
"01011011", 
"01110000", 
"10000010", 
"10011111", 
"01010111", 
"01010111", 
"01110101", 
"10111111", 
"01101111", 
"01111001", 
"10001011", 
"01110001", 
"10001101", 
"01001011", 
"10011001", 
"01110110", 
"10000010", 
"01011011", 
"01111010", 
"10001111", 
"01101110", 
"10001101", 
"01010011", 
"10001001", 
"01110010", 
"10010101", 
"01000100", 
"10001000", 
"10001001", 
"01001011", 
"01111111", 
"01101011", 
"01101011", 
"00101011", 
"01110100", 
"01111111", 
"10011010", 
"10000010", 
"10001101", 
"01110111", 
"10001111", 
"10010100", 
"01100100", 
"10100001", 
"10010110", 
"01110001", 
"01111100", 
"01100110", 
"01101110", 
"00010101", 
"10000101", 
"01111000", 
"01101011", 
"11001000", 
"10001101", 
"01000000", 
"01110010", 
"10010010", 
"10010000", 
"10100000", 
"01111101", 
"00111011", 
"01111110", 
"10010101", 
"01110100", 
"01100100", 
"01101110", 
"01011101", 
"11000011", 
"01101110", 
"10011100", 
"00110110", 
"10001000", 
"01101101", 
"10110010", 
"10010011", 
"01010010", 
"00011010", 
"10010100", 
"01001000", 
"01101110", 
"10001000", 
"10001011", 
"01111001", 
"01010000", 
"10000100", 
"10001100", 
"01111100", 
"01101111", 
"10000111", 
"10000001", 
"01110001", 
"01110101", 
"01000000", 
"01110101", 
"01100010", 
"01101111", 
"10010010", 
"10001010", 
"10010001", 
"10001001", 
"11000010", 
"01010000", 
"10011011", 
"10011110", 
"10000100", 
"01010001", 
"10011100", 
"01010001", 
"01011100", 
"10001100", 
"01010110", 
"10011010", 
"01011101", 
"01010111", 
"01110110", 
"01100110", 
"11100010", 
"01110100", 
"00110111", 
"01111110", 
"01110101", 
"10000011", 
"10001100", 
"10100010", 
"10010111", 
"10101100", 
"10011000", 
"01101010", 
"01111010", 
"01110111", 
"01010111", 
"10001100", 
"01010010", 
"01011010", 
"01110000", 
"10000101", 
"01110110", 
"10011011", 
"01001111", 
"01101101", 
"10000101", 
"01110001", 
"01110101", 
"01100010", 
"10000110", 
"10001001", 
"01011111", 
"01100110", 
"01110011", 
"01101111", 
"10011011", 
"01111101", 
"01110011", 
"01111110", 
"00111101", 
"10001101", 
"10000001", 
"01101101", 
"01101110", 
"01101111", 
"10001100", 
"01101110", 
"01101101", 
"01011001", 
"10101010", 
"10100101", 
"01111101", 
"01101110", 
"01111010", 
"10000011", 
"01110010", 
"10010101", 
"00100011", 
"01111011", 
"10000010", 
"10100000", 
"10000000", 
"10000111", 
"10010011", 
"01001010", 
"11000000", 
"10001000", 
"01110011", 
"01110010", 
"01110100", 
"10001000", 
"10010111", 
"01111010", 
"11001001", 
"01110011", 
"10110010", 
"10100000", 
"10001100", 
"01110000", 
"01111011", 
"10101100", 
"01101000", 
"01100111", 
"01110110", 
"10001000", 
"10000011", 
"10000011", 
"10000000", 
"01110110", 
"10001010", 
"10000011", 
"01101110", 
"10000111", 
"10001011", 
"10001001", 
"01111101", 
"01010011", 
"10011001", 
"10000111", 
"10110111", 
"01110111", 
"01111001", 
"01011111", 
"01010110", 
"01010100", 
"01001101", 
"01100101", 
"00110111", 
"10000011", 
"10101110", 
"01111111", 
"10011000", 
"10001000", 
"01110000", 
"10100001", 
"01001001", 
"01110111", 
"01111010", 
"01101111", 
"01101110", 
"01000111", 
"00011000", 
"01110010", 
"01000110", 
"01101110", 
"10111101", 
"01110101", 
"10101101", 
"01100110", 
"01111001", 
"01011110", 
"01001110", 
"10001101", 
"10001001"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_120_86: signal is "block";
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
    douta_pool_2<= ROM_FC_120_86(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
