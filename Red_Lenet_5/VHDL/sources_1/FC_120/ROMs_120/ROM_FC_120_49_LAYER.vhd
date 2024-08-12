use work.Package_FC_120.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_120_49_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_120_49_LAYER;

architecture Behavioral of ROM_FC_120_49_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_120 is Array (0 to (Dim_pesos_FC-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_120_49: ROM_ARRAY_PESOS_FC_120 := (
"01111111", 
"10001001", 
"01110010", 
"01110010", 
"01111110", 
"01100110", 
"10000000", 
"01101101", 
"01110101", 
"10000000", 
"10001000", 
"01110110", 
"01100111", 
"10000101", 
"01101111", 
"01111101", 
"01110000", 
"10000010", 
"01101110", 
"10000100", 
"01110101", 
"10000111", 
"01011101", 
"01101100", 
"01110100", 
"01110011", 
"01011101", 
"01101111", 
"01111001", 
"01111101", 
"01110100", 
"01101110", 
"01100100", 
"01110010", 
"01100100", 
"01111010", 
"10001001", 
"01111011", 
"01101001", 
"01110000", 
"10001100", 
"10001000", 
"10000100", 
"10000011", 
"10001011", 
"01110101", 
"10001110", 
"10001001", 
"01101110", 
"01110100", 
"10000000", 
"01110001", 
"01111001", 
"01110100", 
"01111110", 
"01111010", 
"01100110", 
"01111011", 
"01110100", 
"10001111", 
"01111101", 
"01101111", 
"01111001", 
"01110001", 
"01111101", 
"10000101", 
"01101100", 
"01101001", 
"01101001", 
"01101010", 
"01100101", 
"01110011", 
"10000011", 
"01110100", 
"01111110", 
"01111011", 
"01111111", 
"10001000", 
"01110100", 
"01101101", 
"01101010", 
"01110110", 
"01110001", 
"01100111", 
"01100111", 
"01100100", 
"01011110", 
"01100001", 
"10001111", 
"10000100", 
"01111101", 
"01111010", 
"01101111", 
"01101111", 
"01111011", 
"10001110", 
"01101111", 
"10000001", 
"01100111", 
"01010000", 
"10001001", 
"10000110", 
"01011111", 
"10000011", 
"01111010", 
"10000110", 
"01101000", 
"01111000", 
"01110110", 
"01111101", 
"10001010", 
"10000001", 
"01110001", 
"01110011", 
"10000010", 
"01110101", 
"01110001", 
"01110100", 
"01111010", 
"01111111", 
"10000010", 
"01101011", 
"01111111", 
"01110111", 
"01101011", 
"10001010", 
"01110001", 
"01111010", 
"01101000", 
"01101100", 
"01111011", 
"10000010", 
"01101111", 
"10000100", 
"01111110", 
"01111000", 
"10000000", 
"01100110", 
"10000010", 
"01100100", 
"01110101", 
"10000011", 
"01101010", 
"10010001", 
"01111111", 
"01110000", 
"01100001", 
"01101111", 
"01110011", 
"10000101", 
"01101001", 
"10000011", 
"01101111", 
"01111100", 
"10000110", 
"01110110", 
"10010000", 
"01111101", 
"01101010", 
"01111111", 
"01110011", 
"10001010", 
"01111001", 
"10000010", 
"01110100", 
"01101011", 
"10000001", 
"01111001", 
"01101001", 
"01100001", 
"10000100", 
"01101101", 
"10010110", 
"10000011", 
"10000001", 
"01111101", 
"10000110", 
"01110010", 
"01100111", 
"01111010", 
"01111010", 
"01101011", 
"10000111", 
"10000110", 
"10000011", 
"01111000", 
"01111100", 
"10010100", 
"10000001", 
"10000100", 
"01111011", 
"10000011", 
"10000000", 
"01101110", 
"01111111", 
"01100100", 
"01110111", 
"01101001", 
"01010100", 
"10000010", 
"01110011", 
"10000101", 
"01110010", 
"10001010", 
"01101001", 
"01110100", 
"01110100", 
"01110111", 
"10000011", 
"01111010", 
"01100000", 
"01101101", 
"01101011", 
"01101110", 
"01100110", 
"10000100", 
"01110111", 
"10011010", 
"01110100", 
"01111101", 
"10000000", 
"01110100", 
"10000000", 
"10001001", 
"01111011", 
"01101010", 
"10000010", 
"01110100", 
"01101100", 
"10000010", 
"10001000", 
"01101110", 
"01110111", 
"01111111", 
"01110011", 
"10001000", 
"01100011", 
"10001110", 
"01111011", 
"01111010", 
"01111111", 
"01110000", 
"01101101", 
"01001101", 
"10000101", 
"01100110", 
"10001011", 
"01110001", 
"10000001", 
"10000001", 
"01100100", 
"10001000", 
"10000110", 
"01101111", 
"10010001", 
"10001000"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_120_49: signal is "block";
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
    douta_pool_2<= ROM_FC_120_49(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
