use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_6_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_6_LAYER;

architecture Behavioral of ROM_FC_10_6_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_6: ROM_ARRAY_PESOS_FC_10 := (
"01110001", 
"10010000", 
"01111100", 
"10000100", 
"10010100", 
"10000100", 
"01010101", 
"10011000", 
"10011101", 
"10100000", 
"10011000", 
"10001011", 
"01011110", 
"01100010", 
"01100110", 
"01110011", 
"10010011", 
"10110101", 
"01110011", 
"10000111", 
"01111010", 
"10010010", 
"01111100", 
"01011111", 
"10010001", 
"10000100", 
"10011100", 
"01111111", 
"10000001", 
"10001011", 
"10000011", 
"01111011", 
"01101011", 
"01110101", 
"01010000", 
"10010001", 
"10000110", 
"01000111", 
"01110010", 
"01100101", 
"01111000", 
"01101011", 
"01011110", 
"10000111", 
"01010001", 
"10011000", 
"01110001", 
"01001110", 
"10110000", 
"01110101", 
"01100110", 
"01110110", 
"01111000", 
"10000110", 
"00100110", 
"10000101", 
"01110010", 
"10001101", 
"10000010", 
"10001010", 
"10100001", 
"01101110", 
"10100000", 
"01111100", 
"10001110", 
"10011001", 
"10001111", 
"10010010", 
"10011001", 
"10011101", 
"10001100", 
"01110101", 
"01101001", 
"10001111", 
"01010011", 
"01010100", 
"01111011", 
"01110100", 
"01101110", 
"10100110", 
"10000011", 
"10000101", 
"01101100", 
"01111010"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_6 : signal is "block";
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
    douta_pool_2<= ROM_FC_10_6(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
