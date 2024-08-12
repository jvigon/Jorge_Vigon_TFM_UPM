use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_15_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_15_LAYER;

architecture Behavioral of ROM_FC_84_15_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_15: ROM_ARRAY_PESOS_FC_84 := (
"01011011", 
"01011111", 
"01111000", 
"01100100", 
"10101011", 
"10000111", 
"01101011", 
"10100011", 
"01111110", 
"10011001", 
"10011111", 
"01100001", 
"10001111", 
"01011011", 
"10000010", 
"01110000", 
"01001110", 
"10000110", 
"01101010", 
"10000011", 
"01001000", 
"10010111", 
"10000110", 
"01001001", 
"10010101", 
"10001100", 
"01010101", 
"10000010", 
"01100111", 
"01010000", 
"01111111", 
"10000100", 
"01110110", 
"10001100", 
"10100110", 
"01010110", 
"10101100", 
"10000010", 
"01110100", 
"01110110", 
"01010100", 
"10110111", 
"10001100", 
"10001101", 
"01101110", 
"01101100", 
"10010101", 
"10001111", 
"10010111", 
"10010000", 
"01111110", 
"10100000", 
"10000011", 
"01001011", 
"01100000", 
"01101001", 
"10001000", 
"01101101", 
"01110001", 
"01110000", 
"01101010", 
"01110000", 
"01110110", 
"01100101", 
"01111000", 
"01010011", 
"10000111", 
"10010011", 
"10010000", 
"10000100", 
"01101101", 
"10001001", 
"01110110", 
"01110001", 
"10011011", 
"10010000", 
"10100101", 
"10010111", 
"01010110", 
"10000001", 
"01111101", 
"01001110", 
"01100010", 
"01001101", 
"01101110", 
"01101001", 
"10001110", 
"10000001", 
"10010101", 
"01001011", 
"01110001", 
"10010111", 
"10001010", 
"10000010", 
"01001111", 
"10001001", 
"01100000", 
"10001000", 
"01101010", 
"10001001", 
"10011000", 
"01110000", 
"01100110", 
"10001001", 
"01100100", 
"10010010", 
"10001000", 
"01111000", 
"01111010", 
"01111010", 
"01110000", 
"10000000", 
"01111011", 
"01100111", 
"01111000", 
"01110110", 
"01110111", 
"01111000", 
"01100001", 
"01110000"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_15 : signal is "block";
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
    douta_pool_2<= ROM_FC_84_15(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
