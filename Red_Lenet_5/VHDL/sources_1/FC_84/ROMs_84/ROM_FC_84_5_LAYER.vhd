use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_5_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_5_LAYER;

architecture Behavioral of ROM_FC_84_5_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_84_5: ROM_ARRAY_PESOS_FC_84 := (
"01100001", 
"01110001", 
"10001110", 
"01111001", 
"01100101", 
"10001100", 
"10010101", 
"10010000", 
"10000010", 
"01101001", 
"10010010", 
"10000001", 
"01011000", 
"10101101", 
"01000111", 
"10011001", 
"01111001", 
"10000001", 
"01110000", 
"10100000", 
"01111101", 
"10111110", 
"10000011", 
"10010001", 
"10001000", 
"01011011", 
"01100010", 
"10100000", 
"10000110", 
"10000110", 
"10000111", 
"10011001", 
"10000000", 
"01110111", 
"01100101", 
"01001111", 
"01001110", 
"01111111", 
"10010100", 
"01110110", 
"10000001", 
"10001001", 
"01010001", 
"01110001", 
"10011110", 
"01110101", 
"00101100", 
"01111100", 
"01000100", 
"01110111", 
"01110110", 
"10100100", 
"01100011", 
"10000100", 
"10101010", 
"10110011", 
"01111011", 
"10000100", 
"10000000", 
"10101011", 
"01111111", 
"10010100", 
"10000111", 
"10000111", 
"10001001", 
"01100000", 
"01110000", 
"10001000", 
"01111010", 
"10001101", 
"10001110", 
"01110011", 
"01111100", 
"10010010", 
"01110110", 
"10001110", 
"01010011", 
"10000100", 
"01101001", 
"01011100", 
"01110100", 
"01101100", 
"10001110", 
"10001110", 
"10000000", 
"01100110", 
"01111101", 
"01010111", 
"10001000", 
"01111001", 
"01011010", 
"01101101", 
"01111010", 
"01101011", 
"01110010", 
"10011010", 
"01110110", 
"10010011", 
"01110100", 
"10001100", 
"01101011", 
"10011011", 
"01010011", 
"01111001", 
"01111110", 
"01100110", 
"01111000", 
"01111111", 
"10110000", 
"10010011", 
"10000110", 
"10010111", 
"10000000", 
"10001000", 
"10001010", 
"10000011", 
"01110101", 
"10010111", 
"01111100", 
"10011100"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_5 : signal is "block";
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
    douta_pool_2<= ROM_FC_84_5(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
