use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_33_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_33_LAYER;

architecture Behavioral of ROM_FC_84_33_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_33: ROM_ARRAY_PESOS_FC_84 := (
"01101001", 
"01100111", 
"10000100", 
"01101001", 
"10001110", 
"01110000", 
"01101011", 
"10100001", 
"10100110", 
"01100010", 
"01100001", 
"10010010", 
"01101111", 
"01111101", 
"10001000", 
"10010001", 
"01111000", 
"01110111", 
"01011110", 
"01011101", 
"10100000", 
"01100010", 
"10110011", 
"01101100", 
"10001011", 
"10011101", 
"01110001", 
"01100001", 
"01111001", 
"10001100", 
"01110100", 
"01001101", 
"01110110", 
"01011010", 
"01111110", 
"01101011", 
"10011001", 
"10001111", 
"01001010", 
"10000000", 
"01110001", 
"01101011", 
"01011111", 
"01111110", 
"10001010", 
"01011011", 
"01010110", 
"01111010", 
"01100110", 
"10001011", 
"01110111", 
"10000101", 
"01101010", 
"01011100", 
"01110000", 
"10011110", 
"10000001", 
"10011001", 
"10000000", 
"01000101", 
"01100110", 
"10000011", 
"01100001", 
"10001011", 
"01101111", 
"10000100", 
"01000000", 
"01100101", 
"10000011", 
"01011011", 
"01100010", 
"01100011", 
"01001001", 
"10000010", 
"10000110", 
"01101010", 
"01110000", 
"01110100", 
"01110001", 
"01111011", 
"01110011", 
"10001000", 
"01100111", 
"10000100", 
"01111111", 
"01110100", 
"01110001", 
"01101101", 
"10001000", 
"01010111", 
"10100001", 
"01100110", 
"10000111", 
"01101000", 
"01111100", 
"01101101", 
"10010101", 
"01111001", 
"10001000", 
"10010100", 
"01101110", 
"01110011", 
"01111001", 
"01100101", 
"01101110", 
"01101100", 
"10010001", 
"10000001", 
"01001010", 
"01101010", 
"10001110", 
"10001000", 
"10001111", 
"01111101", 
"10001100", 
"01111011", 
"10010100", 
"01100110", 
"10010100", 
"10010011"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_33 : signal is "block";
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
    douta_pool_2<= ROM_FC_84_33(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
