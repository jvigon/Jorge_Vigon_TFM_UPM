use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_4_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_4_LAYER;

architecture Behavioral of ROM_FC_10_4_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_4: ROM_ARRAY_PESOS_FC_10 := (
"01100000", 
"01101010", 
"00111000", 
"10010101", 
"01001001", 
"01111010", 
"01101111", 
"10000000", 
"01101101", 
"10010101", 
"01010101", 
"01100001", 
"01011111", 
"01101010", 
"10011111", 
"01100100", 
"10000111", 
"10010011", 
"01101011", 
"10101011", 
"10011111", 
"01110010", 
"01101100", 
"00110010", 
"10000100", 
"01111010", 
"10010010", 
"01101111", 
"10000100", 
"10011010", 
"01110010", 
"01110010", 
"01011111", 
"10000110", 
"10100000", 
"01100001", 
"10000010", 
"01111010", 
"01101001", 
"10011110", 
"10001000", 
"10011000", 
"10000010", 
"10001010", 
"01100101", 
"01111101", 
"10011011", 
"10010010", 
"01001011", 
"01100011", 
"00110011", 
"01010000", 
"01111010", 
"10101110", 
"10001101", 
"00110010", 
"10010000", 
"01110010", 
"01110110", 
"01010100", 
"10100000", 
"10000000", 
"10011111", 
"01100100", 
"00111110", 
"01111001", 
"01111000", 
"01111011", 
"10000011", 
"01110000", 
"10100000", 
"01110010", 
"10001110", 
"10010010", 
"01101111", 
"01110000", 
"10001111", 
"01111000", 
"01110000", 
"01100111", 
"01100101", 
"10100011", 
"10001000", 
"01111101"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_4 : signal is "block";
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
    douta_pool_2<= ROM_FC_10_4(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
