use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_52_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_52_LAYER;

architecture Behavioral of ROM_FC_84_52_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_52: ROM_ARRAY_PESOS_FC_84 := (
"01110011", 
"01010111", 
"01110110", 
"01101011", 
"10010001", 
"01110111", 
"01110100", 
"10000100", 
"10000001", 
"01101001", 
"01111010", 
"01100011", 
"01010111", 
"01101010", 
"01101010", 
"01101011", 
"01110011", 
"10000110", 
"01111011", 
"01110100", 
"01111110", 
"10010011", 
"10110100", 
"01111110", 
"10000001", 
"10010110", 
"10000000", 
"10001011", 
"01101000", 
"01110101", 
"10000001", 
"01011010", 
"01110001", 
"10001111", 
"01100100", 
"10000001", 
"10000001", 
"01011101", 
"01111100", 
"01110111", 
"01010101", 
"10000100", 
"01101111", 
"10010001", 
"01111000", 
"10000100", 
"10010111", 
"01111110", 
"01101100", 
"10000010", 
"10000010", 
"10001000", 
"01100010", 
"01111100", 
"01101111", 
"10000001", 
"10001000", 
"01110110", 
"01111001", 
"01011000", 
"10001000", 
"01011101", 
"10000001", 
"01101001", 
"01100000", 
"01100110", 
"10001110", 
"01110100", 
"10010010", 
"01110101", 
"10001110", 
"01110011", 
"01101000", 
"01101001", 
"01111110", 
"10001100", 
"10001001", 
"10001100", 
"01110110", 
"01100100", 
"01111100", 
"01100110", 
"01101100", 
"01111111", 
"01011010", 
"01011100", 
"10000001", 
"01111111", 
"10001010", 
"10000100", 
"01101010", 
"01111101", 
"10001001", 
"10001100", 
"01111000", 
"10001011", 
"01111010", 
"01100111", 
"10000011", 
"01111101", 
"10001010", 
"10001001", 
"01101110", 
"01111001", 
"01111000", 
"10000101", 
"10001010", 
"10001001", 
"01111111", 
"01100100", 
"01100010", 
"01110011", 
"10011010", 
"01100000", 
"01101010", 
"10001001", 
"10010010", 
"10000000", 
"01111000", 
"01011100"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_52: signal is "block";
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
    douta_pool_2<= ROM_FC_84_52(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
