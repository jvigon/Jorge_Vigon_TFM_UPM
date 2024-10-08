use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_83_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_83_LAYER;

architecture Behavioral of ROM_FC_84_83_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_84_83: ROM_ARRAY_PESOS_FC_84 := (
"01110001", 
"01110010", 
"01111110", 
"01100010", 
"10011101", 
"01110101", 
"10000101", 
"01011100", 
"01010001", 
"01111111", 
"01111000", 
"01101111", 
"10010100", 
"01111101", 
"01111101", 
"01110000", 
"01100100", 
"01101001", 
"01110010", 
"01110000", 
"01111100", 
"10101001", 
"01110010", 
"10000011", 
"01110100", 
"01010000", 
"10000000", 
"01100111", 
"01100000", 
"10001101", 
"10000110", 
"01101000", 
"10001001", 
"01111110", 
"01110111", 
"10000010", 
"10010000", 
"01111110", 
"01100101", 
"01111011", 
"01110000", 
"01101110", 
"01110110", 
"01111101", 
"01111000", 
"01010011", 
"01110011", 
"10010100", 
"01111011", 
"01111100", 
"01110011", 
"01100101", 
"01110001", 
"10000011", 
"01111001", 
"01110101", 
"01111011", 
"01111001", 
"01100110", 
"10001000", 
"01101110", 
"10000011", 
"01110010", 
"01110101", 
"01110011", 
"01010110", 
"10010010", 
"01110000", 
"01101100", 
"01101010", 
"01101100", 
"01100110", 
"10000101", 
"10000011", 
"01111000", 
"01111100", 
"10010100", 
"10000100", 
"01101100", 
"01011110", 
"01100110", 
"10001100", 
"01110111", 
"01011001", 
"10001100", 
"01101110", 
"10000100", 
"10010011", 
"10011000", 
"01111000", 
"01111101", 
"01100001", 
"01111001", 
"01110101", 
"01101010", 
"10000100", 
"01110010", 
"10000000", 
"01011100", 
"10001011", 
"01110010", 
"01101011", 
"01110010", 
"01101111", 
"01011011", 
"10000011", 
"10010110", 
"10010101", 
"10000010", 
"01100001", 
"10000011", 
"01111011", 
"10010011", 
"01101101", 
"01101100", 
"01110000", 
"01110100", 
"10000101", 
"10000101", 
"01110010"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_83: signal is "block";
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
    douta_pool_2<= ROM_FC_84_83(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
