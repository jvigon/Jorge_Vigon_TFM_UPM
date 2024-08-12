use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_50_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_50_LAYER;

architecture Behavioral of ROM_FC_84_50_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);
signal ROM_FC_84_50: ROM_ARRAY_PESOS_FC_84 := (
"01011110", 
"01100011", 
"10100001", 
"01110111", 
"01100100", 
"10101000", 
"01111110", 
"10110000", 
"10000101", 
"01110101", 
"01101101", 
"01101100", 
"01101100", 
"10010010", 
"01101011", 
"01110100", 
"01110101", 
"10011001", 
"01000111", 
"01010100", 
"10001101", 
"10111001", 
"01111010", 
"10011101", 
"01110010", 
"10011111", 
"10010100", 
"10101000", 
"01111110", 
"10000110", 
"10010100", 
"10000100", 
"10000001", 
"01111101", 
"11000011", 
"01010100", 
"10101110", 
"10100001", 
"10000001", 
"01110101", 
"01100010", 
"10000000", 
"01111101", 
"01111000", 
"01110000", 
"01100001", 
"10110010", 
"10110011", 
"10001011", 
"10010100", 
"10010101", 
"10011001", 
"01111101", 
"01010101", 
"10111101", 
"01001111", 
"10010000", 
"01101111", 
"01111000", 
"01111001", 
"01100010", 
"10000001", 
"01101101", 
"10010011", 
"01010001", 
"01101101", 
"10010010", 
"10010100", 
"01111011", 
"01111111", 
"01101000", 
"10010010", 
"10001111", 
"01110010", 
"10010001", 
"10000101", 
"10100010", 
"10011100", 
"10101101", 
"01011001", 
"10110001", 
"01111110", 
"10001000", 
"10000000", 
"01111010", 
"10010010", 
"01100101", 
"10110101", 
"10000110", 
"01111001", 
"10101000", 
"10001010", 
"01110111", 
"01000011", 
"10100100", 
"01100001", 
"10001100", 
"10000011", 
"01101110", 
"01111101", 
"10100001", 
"10001001", 
"00101111", 
"10001110", 
"01110011", 
"01111000", 
"01110011", 
"10011011", 
"01100101", 
"10010000", 
"00100000", 
"01111110", 
"01100010", 
"10001000", 
"10000010", 
"01100100", 
"01111000", 
"01011111", 
"01101111", 
"10001100"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_50: signal is "block";
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
    douta_pool_2<= ROM_FC_84_50(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
