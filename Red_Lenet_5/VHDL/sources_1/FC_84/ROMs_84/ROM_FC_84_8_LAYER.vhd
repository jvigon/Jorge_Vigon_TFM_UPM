use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_8_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_8_LAYER;

architecture Behavioral of ROM_FC_84_8_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_8: ROM_ARRAY_PESOS_FC_84 := (
"01100101", 
"10000000", 
"01101101", 
"10000111", 
"01110011", 
"10001110", 
"01100110", 
"01111110", 
"01100011", 
"01111100", 
"01101110", 
"01010110", 
"01101001", 
"01100001", 
"10000011", 
"01111100", 
"01100000", 
"01101010", 
"01110111", 
"10000100", 
"01011101", 
"10011000", 
"01111100", 
"01111011", 
"01110101", 
"10010000", 
"01011111", 
"10000100", 
"01011000", 
"01111000", 
"01100011", 
"01111100", 
"01101100", 
"10010010", 
"01111011", 
"01101111", 
"01111001", 
"01011110", 
"01101000", 
"10101110", 
"10000111", 
"10000010", 
"10001000", 
"10001111", 
"01101111", 
"01011111", 
"01101000", 
"10001111", 
"01110001", 
"01101100", 
"01011111", 
"01101001", 
"10000110", 
"10000001", 
"10001000", 
"01110100", 
"01101011", 
"01101011", 
"01111111", 
"01110110", 
"01110010", 
"01111110", 
"01101111", 
"01011101", 
"01101100", 
"01111001", 
"01011000", 
"10001110", 
"10010100", 
"01100101", 
"01110101", 
"01110001", 
"01111101", 
"01100001", 
"01100110", 
"10010000", 
"01101000", 
"01111100", 
"10001011", 
"01110101", 
"10000000", 
"01100000", 
"01010101", 
"01010010", 
"01100110", 
"10000000", 
"01011111", 
"10011001", 
"10001111", 
"10010100", 
"10011011", 
"10010101", 
"01101111", 
"01100100", 
"01011111", 
"01111111", 
"01011111", 
"01110010", 
"10001010", 
"10010001", 
"10001110", 
"01111010", 
"00101011", 
"10010010", 
"01100011", 
"01110011", 
"01100001", 
"10010010", 
"01100000", 
"10001000", 
"10001111", 
"01111111", 
"10010101", 
"10001100", 
"01101111", 
"01101100", 
"01110001", 
"01110011", 
"10010110", 
"01001100"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_8 : signal is "block";
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
    douta_pool_2<= ROM_FC_84_8(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
