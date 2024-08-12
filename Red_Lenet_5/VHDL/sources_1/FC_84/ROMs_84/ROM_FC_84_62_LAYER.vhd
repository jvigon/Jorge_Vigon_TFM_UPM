use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_62_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_62_LAYER;

architecture Behavioral of ROM_FC_84_62_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_84_62: ROM_ARRAY_PESOS_FC_84 := (
"10101101", 
"10001000", 
"00111011", 
"10001000", 
"01101000", 
"10001001", 
"10000110", 
"01000110", 
"01111100", 
"10100000", 
"01100110", 
"01011100", 
"00110011", 
"10010011", 
"11001001", 
"01111011", 
"01110110", 
"01010111", 
"10000011", 
"10010001", 
"01100010", 
"10110011", 
"10001010", 
"01110001", 
"10010011", 
"10001000", 
"01001010", 
"10100111", 
"10000001", 
"01011011", 
"01111111", 
"01000100", 
"01110111", 
"01111110", 
"01100110", 
"01001101", 
"01100100", 
"01110110", 
"01100001", 
"01110101", 
"01111100", 
"10100000", 
"01100100", 
"10001101", 
"01010101", 
"10000010", 
"01101000", 
"10010101", 
"01110101", 
"10001110", 
"01101011", 
"10111001", 
"10001011", 
"10011101", 
"10001101", 
"10001101", 
"01101111", 
"10011111", 
"01100111", 
"10001000", 
"01101010", 
"10001111", 
"01111100", 
"01100101", 
"01110000", 
"01010100", 
"10100110", 
"01101000", 
"10010110", 
"01110010", 
"01110001", 
"01100111", 
"10001000", 
"01110111", 
"01101111", 
"01101010", 
"10000100", 
"01101001", 
"01101101", 
"01110111", 
"01011000", 
"01101111", 
"10001101", 
"10011011", 
"01101101", 
"10011000", 
"01100101", 
"01101001", 
"10000100", 
"00100110", 
"10100001", 
"10011101", 
"01111001", 
"01111101", 
"01010010", 
"10110010", 
"10011011", 
"10001101", 
"10001011", 
"01111110", 
"10010000", 
"01111100", 
"01110100", 
"01111000", 
"01110010", 
"01101001", 
"10100000", 
"01100111", 
"01100000", 
"10100100", 
"01111100", 
"10000001", 
"01110011", 
"10000111", 
"01110010", 
"01100000", 
"01101001", 
"10010010", 
"10001110", 
"10100100"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_62 : signal is "block";
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
    douta_pool_2<= ROM_FC_84_62(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
