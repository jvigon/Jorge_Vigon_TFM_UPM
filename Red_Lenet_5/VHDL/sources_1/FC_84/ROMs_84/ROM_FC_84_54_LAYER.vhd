use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_54_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_54_LAYER;

architecture Behavioral of ROM_FC_84_54_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_54: ROM_ARRAY_PESOS_FC_84 := (
"01100011", 
"10001101", 
"01100001", 
"01110100", 
"10011101", 
"10011011", 
"01101110", 
"10010111", 
"10000001", 
"10001101", 
"01010111", 
"10001111", 
"10100011", 
"01101000", 
"10101000", 
"10101100", 
"10000110", 
"10000010", 
"10000010", 
"01010001", 
"10001110", 
"01110100", 
"01011001", 
"01100001", 
"01101001", 
"10111101", 
"01111101", 
"10000011", 
"01000111", 
"01110010", 
"01110101", 
"01001010", 
"10001000", 
"01100001", 
"01111110", 
"01101011", 
"10111010", 
"10001101", 
"01111101", 
"10011010", 
"10100100", 
"01101111", 
"01001001", 
"10100011", 
"10010000", 
"10010000", 
"01100110", 
"01100010", 
"10011001", 
"10001000", 
"10010111", 
"10101101", 
"01100010", 
"01111011", 
"10000000", 
"10000000", 
"10010010", 
"10000100", 
"10110010", 
"10001000", 
"10100011", 
"01111001", 
"01110110", 
"10110100", 
"01100001", 
"01101000", 
"10001001", 
"01101101", 
"01011100", 
"10110000", 
"10100011", 
"10101001", 
"00111001", 
"01010101", 
"10011100", 
"10001100", 
"10100110", 
"01111000", 
"01100111", 
"01111111", 
"10100110", 
"10011100", 
"01101001", 
"01111001", 
"10011100", 
"10000111", 
"10001100", 
"01110011", 
"10000011", 
"10001000", 
"10001011", 
"01100001", 
"10110010", 
"01011100", 
"10000111", 
"10001110", 
"10000001", 
"01110101", 
"01101110", 
"10001100", 
"01101111", 
"01110010", 
"10101111", 
"10001000", 
"01010001", 
"01110001", 
"01100010", 
"01100110", 
"01010000", 
"01101001", 
"10010100", 
"01100110", 
"10010100", 
"01010111", 
"01111001", 
"01110101", 
"10011001", 
"10010100", 
"10000101", 
"01011010"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_54: signal is "block";
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
    douta_pool_2<= ROM_FC_84_54(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
