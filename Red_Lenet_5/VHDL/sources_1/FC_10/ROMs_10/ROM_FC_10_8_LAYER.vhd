use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_8_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_8_LAYER;

architecture Behavioral of ROM_FC_10_8_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_8: ROM_ARRAY_PESOS_FC_10 := (
"10011101", 
"10010100", 
"01110100", 
"10001000", 
"01010111", 
"01100111", 
"01101101", 
"10001011", 
"01111110", 
"10010011", 
"01111010", 
"00011101", 
"01111101", 
"10000100", 
"10000011", 
"01100100", 
"10001010", 
"01111110", 
"10000011", 
"01110011", 
"10001101", 
"10001101", 
"10100001", 
"10001001", 
"01111110", 
"10001010", 
"01111111", 
"01011011", 
"01111100", 
"01100110", 
"10010001", 
"10010010", 
"10001010", 
"10001100", 
"10001010", 
"10000010", 
"01111111", 
"01100000", 
"01100000", 
"10001011", 
"01100011", 
"10000100", 
"01010001", 
"01010011", 
"10001001", 
"01111011", 
"10010110", 
"01111011", 
"10001111", 
"10000001", 
"10000110", 
"01110111", 
"01111010", 
"10000101", 
"01001101", 
"01111000", 
"10010100", 
"10000010", 
"10101000", 
"01110010", 
"01111111", 
"01100000", 
"01111001", 
"01110100", 
"10100100", 
"10000110", 
"10010000", 
"10000100", 
"01110011", 
"10000110", 
"01111001", 
"10000001", 
"00111111", 
"01111111", 
"10000101", 
"01100010", 
"10001000", 
"10011100", 
"01100010", 
"10100011", 
"01100000", 
"01111000", 
"01100000", 
"10000011"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_8 : signal is "block";
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
    douta_pool_2<= ROM_FC_10_8(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
