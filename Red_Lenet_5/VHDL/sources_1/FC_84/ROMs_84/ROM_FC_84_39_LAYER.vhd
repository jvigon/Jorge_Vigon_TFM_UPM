use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_39_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_39_LAYER;

architecture Behavioral of ROM_FC_84_39_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_39: ROM_ARRAY_PESOS_FC_84 := (
"10100001", 
"01100011", 
"10001110", 
"01111001", 
"10011000", 
"01111010", 
"10010100", 
"01101110", 
"01111011", 
"10010001", 
"10001001", 
"10001001", 
"10100000", 
"01110100", 
"10011010", 
"01100111", 
"01111111", 
"01111100", 
"01101111", 
"01011011", 
"01110001", 
"10000011", 
"01011101", 
"10010111", 
"10010100", 
"10011001", 
"10000100", 
"01001101", 
"01101000", 
"10010110", 
"10001010", 
"10100100", 
"10000101", 
"01110010", 
"01010100", 
"10000101", 
"10100001", 
"01011111", 
"10001110", 
"10010010", 
"01101110", 
"10100110", 
"01110000", 
"10001101", 
"10011001", 
"01011010", 
"01110111", 
"01110000", 
"01101101", 
"01101000", 
"01111110", 
"10100111", 
"10011000", 
"01101010", 
"01110100", 
"01101111", 
"01110110", 
"01101001", 
"10000111", 
"10001110", 
"01111011", 
"01111110", 
"01101010", 
"01011100", 
"10000100", 
"01101101", 
"01111111", 
"10001001", 
"01110111", 
"01110101", 
"10010110", 
"01101100", 
"01001010", 
"01000000", 
"01110010", 
"10000001", 
"01110100", 
"01111100", 
"10010101", 
"10001101", 
"10000101", 
"10100001", 
"10000001", 
"10001101", 
"01011111", 
"01101100", 
"01101110", 
"01010111", 
"10001111", 
"10000001", 
"01110110", 
"10100011", 
"01110101", 
"01111011", 
"01001000", 
"10001110", 
"01101101", 
"01111010", 
"10010011", 
"01111111", 
"10001001", 
"10100000", 
"01101001", 
"01100101", 
"01111010", 
"01111100", 
"10010100", 
"10000111", 
"10000110", 
"10000111", 
"10010111", 
"01111100", 
"01111111", 
"01100000", 
"10011100", 
"01101000", 
"01110001", 
"00100001", 
"10010100", 
"01010110"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_39: signal is "block";
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
    douta_pool_2<= ROM_FC_84_39(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
