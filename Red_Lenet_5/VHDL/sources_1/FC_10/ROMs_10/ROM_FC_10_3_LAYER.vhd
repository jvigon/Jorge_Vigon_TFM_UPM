use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_3_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_3_LAYER;

architecture Behavioral of ROM_FC_10_3_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_3: ROM_ARRAY_PESOS_FC_10 := (
"01110111", 
"01110010", 
"10001011", 
"10000110", 
"01110010", 
"01101100", 
"10001010", 
"01010010", 
"01110000", 
"01100010", 
"01100001", 
"00111010", 
"10001100", 
"10001100", 
"01111101", 
"10100000", 
"01110100", 
"01101110", 
"10000111", 
"10001101", 
"10010000", 
"10010100", 
"10100111", 
"01100101", 
"01101111", 
"10010101", 
"01100011", 
"01111011", 
"01111101", 
"01011000", 
"10011110", 
"01100101", 
"10000101", 
"10000110", 
"01111111", 
"01111100", 
"01101001", 
"01110101", 
"10011000", 
"01101110", 
"10000000", 
"01010110", 
"01101001", 
"10000001", 
"10000010", 
"10010011", 
"01100101", 
"10100011", 
"01111000", 
"10001010", 
"10011011", 
"01110011", 
"10010001", 
"01101101", 
"10000010", 
"01110001", 
"10001101", 
"01101010", 
"10100101", 
"10100011", 
"01110010", 
"10001001", 
"01101111", 
"01110000", 
"10000110", 
"01111100", 
"01111011", 
"01111000", 
"10001111", 
"10010000", 
"01100011", 
"10001101", 
"01110110", 
"10001101", 
"01110100", 
"10000001", 
"01101001", 
"10010101", 
"01100010", 
"10100001", 
"10010011", 
"01101000", 
"01100010", 
"10000111"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_3 : signal is "block";
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
    douta_pool_2<= ROM_FC_10_3(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
