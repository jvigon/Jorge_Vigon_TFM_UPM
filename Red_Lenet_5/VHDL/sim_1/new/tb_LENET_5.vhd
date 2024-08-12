
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test_sistema is
--  Port ( );
end test_sistema;

architecture Behavioral of test_sistema is

component sistema_completo 
port( 
    clk, reset: in std_logic; 
    rx: in std_logic; 
    finish : out std_logic;
    an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    number_det_output : out std_logic_vector(3 downto 0);
    en_riscv : OUT STD_LOGIC
    );
end component;


signal clk, reset, rx,finish,en_riscv: std_logic;
signal an :  STD_LOGIC_VECTOR(7 downto 0);
signal seg :  STD_LOGIC_VECTOR(6 downto 0);
--signal address_uart_sal : STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 downto 0);
--signal dina_ram_sal, douta : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal number_det_output : STD_LOGIC_VECTOR(3 DOWNTO 0);
constant T : time := 10 ns;
begin
U1 : sistema_completo
port map(    
             clk => clk,
             reset => reset,
             rx => rx,
             finish=>finish,
             an => an,
             seg => seg,
             --address_uart_sal=>address_uart_sal,
             number_det_output=>number_det_output,
             en_riscv=>en_riscv
             );

reset <= '0', '1' after 200 ns, '1' after 10050 ns;
--strat_process: process
-- begin 
--    switches <= "000000000000";
--    wait for T*10;
--    switches <= "000000000001";
--    wait for T*10;
--    switches <= "000000000010";
--    wait for T*10;
--    switches <= "000000000011";
--    wait for T*10;
--    switches <= "000000000100";
--    wait for T*10;
--    switches <= "000000000101";
--    wait for T*10;
--    switches <= "101111111111";
--    wait for T*10;
--    switches <= "110000000000";
--    wait for T*10;
--end process;
clk100megas_process : process
 begin 
   clk <= '0';
   wait for T/2;
   clk <= '1';
   wait for T/2;
end process;
rx_process : process
    begin
    rx <= '0' ;
    wait for T * 2;
    rx <= '1' ;
    wait for T * 3;
    rx <= '0' ;
    wait for T;
    rx <= '1' ;
    wait for T * 4;
end process;

--BTNC <= '0', '1' after 50000 ns, '0' after 50050 ns;
--BTNU <= '0', '1' after 200 ns, '0' after 20050 ns;
end Behavioral;
