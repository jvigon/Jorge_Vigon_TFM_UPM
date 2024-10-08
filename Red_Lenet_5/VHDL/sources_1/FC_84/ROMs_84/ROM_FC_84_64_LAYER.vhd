use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_64_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_64_LAYER;

architecture Behavioral of ROM_FC_84_64_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_84_64: ROM_ARRAY_PESOS_FC_84 := (
"01011011", 
"01110100", 
"01101001", 
"01101001", 
"10101011", 
"10100101", 
"01101110", 
"01101000", 
"10110011", 
"01101101", 
"01111010", 
"10000111", 
"01110010", 
"10000011", 
"10000001", 
"01011011", 
"10000000", 
"01101100", 
"01110011", 
"01110101", 
"01110111", 
"10001001", 
"01100010", 
"10000101", 
"10000010", 
"11000011", 
"01111110", 
"10010110", 
"10011010", 
"01110000", 
"10010001", 
"10100011", 
"10011111", 
"10011010", 
"01001110", 
"01100001", 
"01111001", 
"01011011", 
"10000101", 
"10110000", 
"10000001", 
"01100000", 
"10011110", 
"10010000", 
"01010000", 
"01001111", 
"10001101", 
"01110001", 
"11000000", 
"01111000", 
"10110001", 
"10001001", 
"10001111", 
"10110110", 
"10001011", 
"10010110", 
"10000101", 
"01101001", 
"10000000", 
"01111011", 
"01101100", 
"10001101", 
"10001000", 
"10011010", 
"01100000", 
"01101110", 
"10000000", 
"01101110", 
"01110000", 
"01001100", 
"10110100", 
"01101101", 
"10110110", 
"01110000", 
"10011001", 
"01111001", 
"01011111", 
"01111001", 
"01110111", 
"10010010", 
"10010010", 
"10011000", 
"01101101", 
"01001100", 
"01100001", 
"10010111", 
"10100001", 
"01111100", 
"01110101", 
"10101001", 
"00110000", 
"11000110", 
"01110100", 
"01000100", 
"10010100", 
"10010011", 
"01100011", 
"10011111", 
"01111100", 
"01111111", 
"01111001", 
"10010000", 
"01000001", 
"01000100", 
"10010010", 
"10000110", 
"10010010", 
"10000101", 
"01111001", 
"01101001", 
"01110001", 
"10010001", 
"01110001", 
"01111011", 
"01111001", 
"10001100", 
"01100001", 
"10011000", 
"10001001", 
"01001110"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_64 : signal is "block";
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
    douta_pool_2<= ROM_FC_84_64(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
