use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_0_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_0_LAYER;

architecture Behavioral of ROM_FC_10_0_LAYER is

TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_0: ROM_ARRAY_PESOS_FC_10 := (
"01110010", 
"10010110", 
"10011000", 
"10000100", 
"01010000", 
"01111100", 
"01110001", 
"01111001", 
"01110110", 
"10001010", 
"10010110", 
"10001100", 
"01110011", 
"10000011", 
"01010100", 
"01110110", 
"10011101", 
"01110111", 
"10001110", 
"01100111", 
"01101001", 
"10011000", 
"01100101", 
"10011001", 
"01111000", 
"10011001", 
"10001010", 
"01101100", 
"10001111", 
"10010100", 
"10001110", 
"01101010", 
"10010100", 
"01100110", 
"01010000", 
"10001100", 
"01110001", 
"10000100", 
"00100011", 
"10001101", 
"10000000", 
"01010001", 
"01101110", 
"01101110", 
"10001001", 
"01110000", 
"01101100", 
"01100100", 
"01100101", 
"01111100", 
"01101010", 
"10000001", 
"01111111", 
"01101000", 
"01010000", 
"01101111", 
"10000100", 
"10001101", 
"01011001", 
"10001011", 
"01101110", 
"10001010", 
"01100010", 
"10001111", 
"10010110", 
"10011011", 
"01111000", 
"01101100", 
"10011100", 
"01101011", 
"01101001", 
"01101100", 
"01110010", 
"10000110", 
"10000001", 
"01111110", 
"10000101", 
"01100000", 
"10000100", 
"01111111", 
"01111110", 
"01101110", 
"10010111", 
"01111101"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_0 : signal is "block";
begin

process(clk)
begin
if rising_edge(clk) then
    douta_pool_2<= ROM_FC_10_0(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
