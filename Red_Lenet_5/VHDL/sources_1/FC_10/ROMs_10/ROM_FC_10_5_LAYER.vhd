use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_5_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_5_LAYER;

architecture Behavioral of ROM_FC_10_5_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_5: ROM_ARRAY_PESOS_FC_10 := (
"01010111", 
"01110111", 
"01101100", 
"10000010", 
"01111100", 
"10001011", 
"01110011", 
"10000001", 
"01101110", 
"01110100", 
"01111110", 
"10010111", 
"10001010", 
"01100100", 
"01011010", 
"10010110", 
"10000111", 
"10100010", 
"10100011", 
"01110111", 
"01111111", 
"10010100", 
"01110111", 
"01011000", 
"01110111", 
"10000011", 
"10001000", 
"01110010", 
"01110010", 
"10010100", 
"10001011", 
"10010010", 
"01111010", 
"10000110", 
"01000100", 
"10001001", 
"01111011", 
"01101010", 
"01111101", 
"01111001", 
"10000011", 
"01011010", 
"01010011", 
"10000011", 
"01011110", 
"01111110", 
"01100111", 
"10001010", 
"10000001", 
"10011111", 
"10001000", 
"10011000", 
"10010100", 
"10001011", 
"10001010", 
"10000010", 
"01011101", 
"01101101", 
"10001111", 
"01101100", 
"10011011", 
"01111010", 
"01111101", 
"10000110", 
"10010001", 
"01111000", 
"10000001", 
"01101010", 
"01110011", 
"00110001", 
"01111010", 
"01011001", 
"01111111", 
"10000110", 
"01100001", 
"10000001", 
"10000011", 
"10010101", 
"01000111", 
"10010101", 
"10010010", 
"01110010", 
"01100010", 
"01111111"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_5 : signal is "block";
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
    douta_pool_2<= ROM_FC_10_5(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
