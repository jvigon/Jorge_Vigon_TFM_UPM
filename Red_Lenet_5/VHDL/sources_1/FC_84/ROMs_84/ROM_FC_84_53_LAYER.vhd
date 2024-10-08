use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_53_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_53_LAYER;

architecture Behavioral of ROM_FC_84_53_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_53: ROM_ARRAY_PESOS_FC_84 := (
"10101000", 
"10100011", 
"10000001", 
"10001111", 
"01111101", 
"10000010", 
"10010010", 
"01011000", 
"10000011", 
"01111011", 
"10000011", 
"00101001", 
"10101011", 
"10011101", 
"10101111", 
"10001101", 
"10000001", 
"10000001", 
"10011011", 
"10000010", 
"10011100", 
"01010011", 
"01010101", 
"01101010", 
"10011010", 
"01100111", 
"10011011", 
"01101110", 
"01110000", 
"10010110", 
"10011010", 
"10001010", 
"10100000", 
"01010101", 
"01111000", 
"01100100", 
"01011101", 
"01100000", 
"00100101", 
"01110110", 
"01110000", 
"10000010", 
"10100001", 
"01000001", 
"10000111", 
"10110101", 
"01000010", 
"01111000", 
"01100101", 
"10001000", 
"10100101", 
"01110001", 
"10011000", 
"01110101", 
"01101111", 
"10001011", 
"01101011", 
"01111101", 
"10010011", 
"01001110", 
"10100110", 
"01110010", 
"10100000", 
"10001011", 
"01011110", 
"10010010", 
"10011000", 
"10000110", 
"01111111", 
"10011000", 
"01111001", 
"01010010", 
"01001111", 
"01011001", 
"10000011", 
"10010011", 
"10011101", 
"01100100", 
"01111010", 
"01100001", 
"10000101", 
"00111101", 
"01110100", 
"10101011", 
"01100000", 
"10000101", 
"01111010", 
"01111001", 
"10010111", 
"00101000", 
"01011001", 
"10001001", 
"01101000", 
"01111011", 
"01101000", 
"10011010", 
"10011111", 
"10000101", 
"10001100", 
"10010110", 
"10011110", 
"10001111", 
"01101101", 
"00010100", 
"01111110", 
"10001001", 
"01101011", 
"01110000", 
"10000110", 
"10001000", 
"01101010", 
"01110100", 
"10010111", 
"10000100", 
"10011010", 
"01111011", 
"01011010", 
"01111110", 
"01110011", 
"01011101"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_53: signal is "block";
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
    douta_pool_2<= ROM_FC_84_53(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
