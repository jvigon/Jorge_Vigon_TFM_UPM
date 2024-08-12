use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_46_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_46_LAYER;

architecture Behavioral of ROM_FC_84_46_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_46: ROM_ARRAY_PESOS_FC_84 := (
"01110100", 
"10110000", 
"10100000", 
"10000001", 
"10000000", 
"10010111", 
"10000110", 
"01100001", 
"10001000", 
"01110000", 
"10001111", 
"01000100", 
"10000110", 
"10010000", 
"10000001", 
"01110111", 
"01101111", 
"01110000", 
"01110100", 
"01000110", 
"01100111", 
"01101110", 
"01110010", 
"10010111", 
"10001011", 
"10101000", 
"01101110", 
"10010010", 
"10000011", 
"10010010", 
"01110111", 
"10011100", 
"01100101", 
"10000010", 
"01110100", 
"10010000", 
"01100111", 
"01110101", 
"01101010", 
"01001100", 
"01111000", 
"01101100", 
"01111011", 
"01111011", 
"01011110", 
"10101010", 
"10011111", 
"10010110", 
"01010011", 
"01100111", 
"10000011", 
"01111010", 
"10000011", 
"01101011", 
"01111011", 
"10000001", 
"01101111", 
"10000011", 
"10001111", 
"10111010", 
"01111001", 
"01111100", 
"01110010", 
"01011011", 
"01111100", 
"10111001", 
"10000000", 
"10011100", 
"10010110", 
"10110010", 
"10001101", 
"01010000", 
"10100101", 
"01011010", 
"01111000", 
"10001011", 
"01101010", 
"01111111", 
"10000001", 
"01111011", 
"10011011", 
"01001111", 
"01100010", 
"10011001", 
"01100010", 
"01100100", 
"01100110", 
"01101110", 
"10000010", 
"01010101", 
"01110011", 
"10000011", 
"10001111", 
"01010111", 
"10001011", 
"10010101", 
"01100011", 
"01111011", 
"10011100", 
"10001000", 
"01111100", 
"10100001", 
"01000000", 
"01100111", 
"01101001", 
"10010111", 
"01100101", 
"01111110", 
"10000010", 
"10101000", 
"10001100", 
"01111010", 
"10010101", 
"01100101", 
"10000100", 
"10000110", 
"10101010", 
"01001111", 
"01110011", 
"01101001"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_46: signal is "block";
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
    douta_pool_2<= ROM_FC_84_46(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
