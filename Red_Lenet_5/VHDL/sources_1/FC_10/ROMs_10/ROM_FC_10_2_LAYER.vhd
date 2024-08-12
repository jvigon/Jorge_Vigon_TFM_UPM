use work.Package_FC_10.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM_FC_10_2_LAYER is
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
end ROM_FC_10_2_LAYER;

architecture Behavioral of ROM_FC_10_2_LAYER is
--SIGNAL W_next, W_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE ROM_ARRAY_PESOS_FC_10 is Array (0 to (Dim_pesos_FC_10-1)) of STD_LOGIC_VECTOR(7 downto 0);--2400 16 filtros de 5x5x6
signal ROM_FC_10_2: ROM_ARRAY_PESOS_FC_10 := (
"10100100", 
"10010110", 
"01110101", 
"01011111", 
"10010111", 
"10011000", 
"00111110", 
"01110010", 
"01110101", 
"01100010", 
"10000010", 
"01110100", 
"01101111", 
"01101010", 
"10010101", 
"01111011", 
"10000001", 
"01110100", 
"10011011", 
"10100101", 
"01110010", 
"10010101", 
"10011010", 
"01100111", 
"01000001", 
"01011100", 
"01000110", 
"01100101", 
"01100111", 
"10010110", 
"10000011", 
"01001001", 
"10000000", 
"10000110", 
"10001000", 
"01101110", 
"10000001", 
"01101001", 
"01101000", 
"01100000", 
"10011011", 
"01101110", 
"10010110", 
"01101000", 
"10000001", 
"10000101", 
"01111001", 
"01101000", 
"10010100", 
"01100100", 
"01111011", 
"01100100", 
"01101001", 
"10001100", 
"01001100", 
"01111110", 
"10000010", 
"10001001", 
"01101101", 
"10010110", 
"10010101", 
"10001011", 
"10011001", 
"10001010", 
"01110011", 
"01111100", 
"01100100", 
"10001000", 
"01111010", 
"01100011", 
"01101111", 
"01110001", 
"01101000", 
"10001000", 
"10000111", 
"01111110", 
"10010000", 
"01110100", 
"10000101", 
"01110101", 
"10010001", 
"10001101", 
"01011110", 
"10000010"
);
attribute rom_style : string;
attribute rom_style of ROM_FC_10_2 : signal is "block";
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
    douta_pool_2<= ROM_FC_10_2(conv_integer(addra_pool_2));
end if;
end process;
end Behavioral;
