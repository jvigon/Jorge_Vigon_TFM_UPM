use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_9_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_9_LAYER;

architecture Behavioral of ROM_FC_10_9_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_9: ROM_ARRAY_PESOS_FC_10 := (
"01110001", 
"10010011", 
"10000111", 
"10010011", 
"01000101", 
"10001000", 
"10001111", 
"01110010", 
"10001110", 
"10011001", 
"01011010", 
"10001001", 
"01111110", 
"01100110", 
"10101110", 
"01011111", 
"01011101", 
"01111110", 
"10011001", 
"01111101", 
"10011111", 
"01111000", 
"01100010", 
"01101010", 
"10001101", 
"10001111", 
"10010010", 
"01111101", 
"01111101", 
"10010011", 
"10100111", 
"01110110", 
"01101110", 
"10010000", 
"10100110", 
"10011010", 
"10001110", 
"10000010", 
"10001011", 
"10100101", 
"10000001", 
"10001100", 
"01101111", 
"01011110", 
"10010101", 
"10000110", 
"01101011", 
"10101100", 
"01110000", 
"01100100", 
"01100001", 
"01111110", 
"10001011", 
"01111100", 
"10010000", 
"01101001", 
"10001011", 
"01101100", 
"10000101", 
"10001001", 
"01101100", 
"10001111", 
"10011010", 
"10001011", 
"01100011", 
"01111100", 
"01010101", 
"10000101", 
"10001101", 
"10001111", 
"10000100", 
"01101010", 
"10100110", 
"01010111", 
"10010000", 
"01101000", 
"01100001", 
"01101011", 
"01110100", 
"01110111", 
"01110101", 
"10000101", 
"10000000", 
"10011100"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_9 : signal is "block";
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
    douta_pool_2<= ROM_FC_10_9(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
