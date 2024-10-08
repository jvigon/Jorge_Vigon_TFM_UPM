use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_7_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_7_LAYER;

architecture Behavioral of ROM_FC_84_7_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_7: ROM_ARRAY_PESOS_FC_84 := (
"01011011", 
"01010010", 
"01001011", 
"01101111", 
"01101111", 
"01110111", 
"01101011", 
"01100011", 
"01110011", 
"10001010", 
"01100000", 
"01100001", 
"01111011", 
"01111011", 
"01110101", 
"01011100", 
"01011110", 
"01111100", 
"01010001", 
"01100010", 
"01100001", 
"10010100", 
"10000010", 
"01011001", 
"01111110", 
"01110001", 
"01100011", 
"01101100", 
"01110110", 
"10000110", 
"10000001", 
"10000011", 
"01110011", 
"01100111", 
"01101000", 
"01110011", 
"10000110", 
"01110100", 
"01101110", 
"01111011", 
"01001100", 
"10001100", 
"01111111", 
"01011100", 
"01111101", 
"10001001", 
"01100110", 
"01110011", 
"01011001", 
"10010101", 
"10001001", 
"01110110", 
"01111000", 
"01110111", 
"01100110", 
"01101111", 
"01101001", 
"10001000", 
"01101110", 
"01101001", 
"10000101", 
"01100101", 
"10001100", 
"01101111", 
"01100000", 
"01111111", 
"10010010", 
"01110101", 
"01101111", 
"01101101", 
"10010110", 
"01101111", 
"01101101", 
"10001010", 
"10010101", 
"10000100", 
"01011111", 
"10000111", 
"01110011", 
"01011011", 
"01100101", 
"01001010", 
"01000101", 
"01110110", 
"01110110", 
"01110110", 
"01101001", 
"01100011", 
"01110000", 
"01101000", 
"01111000", 
"01101010", 
"10001111", 
"01110010", 
"01010111", 
"10010111", 
"01110110", 
"01111111", 
"01100101", 
"01101000", 
"01110000", 
"01100011", 
"01100101", 
"01111100", 
"01111001", 
"01111001", 
"01101100", 
"10001001", 
"01101011", 
"01100100", 
"01111100", 
"10010000", 
"01100100", 
"10010101", 
"01110101", 
"01111110", 
"01101001", 
"01110011", 
"10000010", 
"01111001"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_7 : signal is "block";
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
    douta_pool_2<= ROM_FC_84_7(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
