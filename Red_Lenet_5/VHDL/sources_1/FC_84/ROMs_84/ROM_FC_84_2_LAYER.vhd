use work.Package_FC_84.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_84_2_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_84)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_84_2_LAYER;

architecture Behavioral of ROM_FC_84_2_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_84 is Array (0 to (Dim_pesos_FC_84-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_84_2: ROM_ARRAY_PESOS_FC_84 := (
"10000110", 
"01100001", 
"01011100", 
"01111000", 
"01110100", 
"10011000", 
"10011000", 
"01100001", 
"10000011", 
"10000000", 
"10000100", 
"10000000", 
"01011000", 
"10100100", 
"01110001", 
"01010100", 
"01000101", 
"10100101", 
"01110011", 
"01100001", 
"10001010", 
"01010001", 
"01111101", 
"01111100", 
"10010011", 
"10100100", 
"10000000", 
"01011101", 
"01010101", 
"01100101", 
"10010100", 
"10001101", 
"10001001", 
"10100100", 
"01011110", 
"10100100", 
"01011001", 
"01011001", 
"01110101", 
"01111101", 
"01110011", 
"01000110", 
"10010001", 
"10000000", 
"10000101", 
"01010001", 
"10000101", 
"01101100", 
"01011100", 
"01101110", 
"10000000", 
"10000010", 
"01111011", 
"10010010", 
"01111101", 
"10000000", 
"01101111", 
"01110000", 
"01110001", 
"01111101", 
"01100110", 
"01001100", 
"10000010", 
"01110110", 
"10011100", 
"01110000", 
"01100010", 
"10011110", 
"10010100", 
"01011011", 
"10000111", 
"01001000", 
"01011110", 
"01011100", 
"01101100", 
"10000001", 
"01010100", 
"01110100", 
"10011011", 
"01011110", 
"10011000", 
"10000001", 
"01100000", 
"01111000", 
"01011100", 
"10001111", 
"01001001", 
"01111001", 
"10000010", 
"10101110", 
"01000001", 
"10100100", 
"01110111", 
"01011101", 
"10010101", 
"01111110", 
"10000111", 
"01101110", 
"01011001", 
"01101100", 
"10001010", 
"01111011", 
"01110111", 
"10001001", 
"01110110", 
"10010100", 
"10001100", 
"10010011", 
"01011001", 
"01111010", 
"01001011", 
"01101110", 
"10000010", 
"01101111", 
"01111101", 
"10000100", 
"10000110", 
"01100111", 
"10010011", 
"01010001"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_84_2 : signal is "block";
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
    douta_pool_2<= ROM_FC_84_2(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
