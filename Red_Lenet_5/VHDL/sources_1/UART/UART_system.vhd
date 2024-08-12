
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity UART_system is
generic (W: integer := 8;
         DBIT : integer := 8; -- # data bits 
         SB_TICK: integer := 16 -- # ticks for stop bits 
); 
port( 
    clk, reset: in std_logic; 
    rx: in std_logic; 
    clr_flag : in std_logic;
    dout : out std_logic_vector (W-1 downto 0) ; 
    flag: out std_logic); 
end UART_system;
architecture Behavioral of UART_system is
component baud_rate_generator 
Port (clk, reset: in std_logic; 
      max_tick: out std_logic);
end component;
component UART_receiver 
port ( clk, reset: in std_logic; 
       rx: in std_logic; 
       s_tick: in std_logic; 
       rx_done_tick: out std_logic; 
       dout: out std_logic_vector (7 downto 0)); 
end component;
component FF_buff 
Port (clk, reset: in std_logic; 
      clr_flag, set_flag : in std_logic; 
      din: in std_logic_vector (W-1 downto 0) ; 
      dout : out std_logic_vector (W-1 downto 0) ; 
      flag: out std_logic);
end component;
signal flag_ready, flag_aux, tick_aux : std_logic := '0';
signal din_aux : std_logic_vector (W-1 downto 0) := (others => '0');
signal flag_reg, flag_next : std_logic; 
begin
U1 : baud_rate_generator
Port map (
    clk => clk,
    reset => reset,
    max_tick => tick_aux);
U2 : UART_receiver
Port map (
     clk => clk,
     reset => reset,
     rx => rx,
     s_tick => tick_aux,
     dout =>din_aux,
     rx_done_tick => flag_aux);
--Interface with a flag FF and buffer
 U3 : FF_buff
Port map ( clk => clk,
           reset => reset,
           din => din_aux,
           dout => dout,
           flag => flag,
           clr_flag => clr_flag,
           set_flag => flag_aux);

end Behavioral;