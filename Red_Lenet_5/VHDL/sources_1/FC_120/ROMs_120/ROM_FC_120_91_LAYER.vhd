use work.Package_FC_120.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_120_91_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_120_91_LAYER;

architecture Behavioral of ROM_FC_120_91_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_120 is Array (0 to (Dim_pesos_FC-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_120_91: ROM_ARRAY_PESOS_FC_120 := (
"01111011", 
"01001111", 
"01000111", 
"01100101", 
"01101100", 
"01101001", 
"01010010", 
"01110000", 
"01110011", 
"01000111", 
"01110001", 
"01001111", 
"01011101", 
"10000011", 
"01110110", 
"01110101", 
"01110001", 
"01100000", 
"01101010", 
"10000101", 
"01110110", 
"01011101", 
"01010010", 
"10000100", 
"01110011", 
"01100100", 
"01100011", 
"11000010", 
"00110111", 
"01110100", 
"10001001", 
"10000011", 
"01111100", 
"01001001", 
"01111001", 
"01011000", 
"01111010", 
"01111001", 
"10000011", 
"01110001", 
"01110110", 
"01011010", 
"01101000", 
"10010111", 
"01100011", 
"01100000", 
"01111000", 
"01110001", 
"01110111", 
"10000000", 
"10010010", 
"01110101", 
"01110010", 
"01101111", 
"01101000", 
"01011010", 
"10001110", 
"01110100", 
"01111001", 
"01101110", 
"01001011", 
"01010101", 
"10001111", 
"01110001", 
"01011011", 
"01100001", 
"01110110", 
"01101101", 
"10000011", 
"01110101", 
"01111001", 
"01111110", 
"10001111", 
"01011101", 
"01111011", 
"01011100", 
"01000011", 
"10001100", 
"10000011", 
"10000100", 
"01111000", 
"01001011", 
"01101111", 
"01011101", 
"01111101", 
"01100010", 
"10000001", 
"10001001", 
"10000000", 
"01110011", 
"01111001", 
"01110100", 
"01010111", 
"01111101", 
"01101111", 
"10010011", 
"01111111", 
"01101000", 
"01100010", 
"01010111", 
"01110110", 
"10011011", 
"10000110", 
"10001000", 
"01101101", 
"01110100", 
"01100111", 
"01011011", 
"01011100", 
"01110100", 
"01111011", 
"10000011", 
"01011011", 
"01011111", 
"01110101", 
"01101000", 
"01110011", 
"01110000", 
"01010110", 
"01101101", 
"01101001", 
"01101000", 
"01111111", 
"10000000", 
"01101111", 
"01110111", 
"10000000", 
"01111001", 
"01101110", 
"01101001", 
"01101001", 
"01010100", 
"10000011", 
"01111001", 
"01101110", 
"01110011", 
"01111010", 
"01101100", 
"01111000", 
"01100101", 
"01010011", 
"01011100", 
"01101111", 
"10001100", 
"10000101", 
"01101010", 
"10000100", 
"01011110", 
"01101010", 
"01111100", 
"01001011", 
"01101011", 
"01111101", 
"01100011", 
"01111001", 
"01010001", 
"01101111", 
"01100100", 
"10001100", 
"01110000", 
"10000001", 
"01101010", 
"01011000", 
"01010111", 
"01111011", 
"01001110", 
"01110110", 
"01100010", 
"10001000", 
"01110101", 
"01101011", 
"01111011", 
"10001000", 
"01001111", 
"01101011", 
"10001001", 
"01100110", 
"01111000", 
"01101010", 
"01111100", 
"01110101", 
"01100101", 
"01011000", 
"01100001", 
"01101010", 
"01101101", 
"01101010", 
"01011011", 
"01110110", 
"01011100", 
"01110100", 
"10000100", 
"01100110", 
"10000101", 
"01110010", 
"10000101", 
"10000011", 
"01101001", 
"00110110", 
"01101001", 
"01111110", 
"10000000", 
"10000101", 
"01101001", 
"01110001", 
"01101101", 
"01110010", 
"01110110", 
"01101110", 
"01111100", 
"01100100", 
"01111101", 
"01111001", 
"10111000", 
"01101111", 
"01111000", 
"01101111", 
"10000110", 
"10010001", 
"01111101", 
"01010111", 
"01110000", 
"01110010", 
"10001000", 
"01101011", 
"01001010", 
"01011100", 
"10011100", 
"01110100", 
"01010011", 
"01111100", 
"10000001", 
"01111001", 
"01101010", 
"01100010", 
"01111100", 
"01101101", 
"01110110", 
"10000011", 
"10000111", 
"01110101", 
"01001101", 
"01011111", 
"10000111", 
"10000001", 
"10001100", 
"10111100", 
"01110010", 
"01101101", 
"01101000", 
"01111001", 
"10000101", 
"10100010", 
"01100011", 
"10000110", 
"10001000"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_120_91: signal is "block";
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
    douta_pool_2<= ROM_FC_120_91(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
