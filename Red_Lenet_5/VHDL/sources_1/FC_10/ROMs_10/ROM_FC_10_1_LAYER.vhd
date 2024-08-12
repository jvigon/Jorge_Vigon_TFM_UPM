use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_1_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_1_LAYER;

architecture Behavioral of ROM_FC_10_1_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_1: ROM_ARRAY_PESOS_FC_10 := (
"01110000", 
"01001100", 
"10010000", 
"10000001", 
"10000110", 
"10100100", 
"10001000", 
"01100010", 
"10010111", 
"10000101", 
"01101000", 
"01001001", 
"10011001", 
"10011101", 
"10010000", 
"01101100", 
"01100010", 
"10001000", 
"01011011", 
"10000111", 
"01011000", 
"01100111", 
"01110111", 
"01001100", 
"01101110", 
"10001010", 
"10001011", 
"01110111", 
"01010000", 
"01100100", 
"10001101", 
"01001111", 
"10001011", 
"10000101", 
"10001101", 
"10100010", 
"10001111", 
"01110011", 
"01110110", 
"10011010", 
"10001001", 
"10001110", 
"01110110", 
"10001110", 
"10000011", 
"01100100", 
"10001111", 
"01010000", 
"10001111", 
"01101001", 
"10001110", 
"01100001", 
"10010101", 
"01101001", 
"01101010", 
"10000111", 
"10011101", 
"10000011", 
"10000101", 
"01111101", 
"10010100", 
"01011111", 
"10000000", 
"10010011", 
"01110011", 
"01110111", 
"10011001", 
"01101101", 
"01111011", 
"01100100", 
"10001000", 
"01110110", 
"01010111", 
"10000100", 
"01100101", 
"01100000", 
"10010110", 
"01111110", 
"10011100", 
"01111110", 
"01011110", 
"10010100", 
"01011000", 
"10011010"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_1 : signal is "block";
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
    douta_pool_2<= ROM_FC_10_1(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
