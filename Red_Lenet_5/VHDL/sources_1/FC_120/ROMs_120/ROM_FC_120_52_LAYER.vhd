use work.Package_FC_120.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_120_52_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_120_52_LAYER;

architecture Behavioral of ROM_FC_120_52_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_120 is Array (0 to (Dim_pesos_FC-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_120_52: ROM_ARRAY_PESOS_FC_120 := (
"01101001", 
"10000100", 
"01110001", 
"01111111", 
"01110101", 
"01101111", 
"01110110", 
"01101001", 
"01110001", 
"01111110", 
"01111100", 
"01011111", 
"10001101", 
"01101001", 
"10000100", 
"01110001", 
"10000001", 
"01011111", 
"01110000", 
"01101100", 
"10000001", 
"01101110", 
"10001101", 
"01111011", 
"01111111", 
"01111000", 
"10000010", 
"01110010", 
"10000100", 
"01110100", 
"10001111", 
"01111100", 
"01100111", 
"01101111", 
"10000000", 
"01111110", 
"01110001", 
"01101110", 
"01100011", 
"10000000", 
"01101101", 
"01111100", 
"01110010", 
"01111010", 
"01100000", 
"10001011", 
"01101101", 
"01111110", 
"10001000", 
"01111101", 
"01110110", 
"01110011", 
"10001100", 
"01111000", 
"01110101", 
"01101011", 
"10000001", 
"10001010", 
"01101010", 
"01110001", 
"01011010", 
"01101011", 
"01111111", 
"01111010", 
"10001010", 
"01100111", 
"01101011", 
"01110000", 
"01111100", 
"01101101", 
"01110111", 
"01111010", 
"10000011", 
"01101110", 
"01111110", 
"01011010", 
"01111011", 
"01101000", 
"01101010", 
"01111101", 
"01101010", 
"01110110", 
"10000110", 
"10001000", 
"01101100", 
"01111001", 
"01110110", 
"01101111", 
"01110111", 
"01110111", 
"01110011", 
"01111110", 
"10001110", 
"10000011", 
"01111100", 
"01101110", 
"10001010", 
"10000011", 
"10000111", 
"01101101", 
"01110010", 
"01101000", 
"10001000", 
"01110101", 
"01111001", 
"01100001", 
"01110010", 
"10000000", 
"01111011", 
"01101000", 
"01111000", 
"10010100", 
"10001010", 
"10001000", 
"01110111", 
"10000011", 
"10001000", 
"01111101", 
"01101101", 
"01101101", 
"01111000", 
"10000011", 
"01110000", 
"10000000", 
"01110010", 
"10000101", 
"10000111", 
"01110100", 
"01111111", 
"10000100", 
"10001011", 
"10001001", 
"01101110", 
"10000110", 
"01111010", 
"01101101", 
"10000001", 
"01110011", 
"01100111", 
"01111000", 
"01111100", 
"01110110", 
"01111101", 
"10000101", 
"10000100", 
"01101001", 
"01111001", 
"01111100", 
"10001011", 
"01110110", 
"10000111", 
"01101011", 
"10000111", 
"10001001", 
"01110110", 
"10000000", 
"10000000", 
"01111100", 
"01101100", 
"10001000", 
"10000101", 
"01111010", 
"01101100", 
"01101000", 
"01111101", 
"01101110", 
"01111100", 
"01111110", 
"10001110", 
"01111101", 
"01111001", 
"01110011", 
"01111101", 
"01111000", 
"10000011", 
"01100101", 
"01101101", 
"01100111", 
"01111010", 
"10001100", 
"10000111", 
"01110000", 
"01101011", 
"01100100", 
"01110010", 
"10000101", 
"01101011", 
"01110001", 
"01110110", 
"10000001", 
"10010001", 
"10000001", 
"10000101", 
"01111101", 
"10000000", 
"01011111", 
"10000001", 
"10000110", 
"01100110", 
"01110111", 
"01101000", 
"01110010", 
"01101011", 
"01101110", 
"01100011", 
"01101010", 
"10000101", 
"01111100", 
"10000001", 
"01111111", 
"01111100", 
"01101011", 
"10000111", 
"01110010", 
"01111001", 
"10001100", 
"10000101", 
"10000100", 
"10000111", 
"01100111", 
"10000101", 
"10000101", 
"01111100", 
"01111111", 
"01100110", 
"10000100", 
"01101100", 
"10000111", 
"01110101", 
"01110110", 
"01110001", 
"01110011", 
"01101111", 
"10000010", 
"01111010", 
"01111101", 
"10000111", 
"10000010", 
"10001010", 
"01111100", 
"01101110", 
"10001010", 
"10000011", 
"01111001", 
"01110110", 
"01101100", 
"01110010", 
"01110000", 
"10001011", 
"01111101", 
"01111010", 
"01111101", 
"10000001", 
"01111111", 
"01101010", 
"10001110"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_120_52: signal is "block";
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
    douta_pool_2<= ROM_FC_120_52(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
