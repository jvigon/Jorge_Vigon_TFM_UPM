use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_77_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_77_LAYER;

architecture Behavioral of ROM_FC_84_77_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_84_77: ROM_ARRAY_PESOS_FC_84 := (
"01101000", 
"10100011", 
"10011010", 
"10010000", 
"10010010", 
"01111101", 
"10000011", 
"01100110", 
"01010101", 
"10001011", 
"10000001", 
"01110100", 
"01100010", 
"01110001", 
"10010110", 
"01101111", 
"10000010", 
"01111010", 
"01001011", 
"00101101", 
"10010001", 
"01111011", 
"10000100", 
"01110101", 
"01100001", 
"10011001", 
"10010010", 
"01111100", 
"01110001", 
"01010010", 
"10001110", 
"01010110", 
"10100010", 
"10001001", 
"01110111", 
"10001011", 
"10000100", 
"01001001", 
"01000111", 
"01010100", 
"01111111", 
"01110000", 
"00111110", 
"01010111", 
"00110101", 
"01111001", 
"10001011", 
"01100001", 
"01100010", 
"10000111", 
"10010010", 
"01011111", 
"01110100", 
"01110011", 
"01101010", 
"01100110", 
"01111111", 
"10010001", 
"10011000", 
"01110110", 
"01101110", 
"10001000", 
"01101010", 
"01111011", 
"01100001", 
"10000100", 
"01010100", 
"01111111", 
"01011111", 
"10001001", 
"10000011", 
"01101110", 
"10001010", 
"01101000", 
"01110001", 
"01110010", 
"10000111", 
"10001100", 
"01101111", 
"10000101", 
"10011010", 
"01111011", 
"01110101", 
"01001000", 
"10001100", 
"01110100", 
"01100100", 
"10011111", 
"10010100", 
"01001111", 
"10010000", 
"01101011", 
"10010011", 
"00101110", 
"10000101", 
"10001110", 
"01111100", 
"10011000", 
"10000100", 
"01100000", 
"01110011", 
"01100001", 
"00110000", 
"01110000", 
"00110111", 
"10010100", 
"10001010", 
"01110000", 
"00101110", 
"01110111", 
"01100010", 
"01011011", 
"10010110", 
"10100010", 
"01111110", 
"10000111", 
"01110110", 
"10001000", 
"01110000", 
"10000101"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_77: signal is "block";
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
    douta_pool_2<= ROM_FC_84_77(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
