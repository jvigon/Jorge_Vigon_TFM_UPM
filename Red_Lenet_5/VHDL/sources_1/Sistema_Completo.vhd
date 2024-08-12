--JORGE VIGON
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.CNN_Package_First_Convolution.all;

entity Sistema_Completo is
generic (W: integer := 8;
         DBIT : integer := 8; -- # data bits 
         SB_TICK: integer := 16 -- # ticks for stop bits 
); 
port( 
    clk, reset: in std_logic; 
    rx: in std_logic; 
    finish : out std_logic;
    an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    number_det_output : out std_logic_vector(3 downto 0);
    en_riscv : OUT STD_LOGIC
    );
end Sistema_Completo;

architecture Behavioral of Sistema_Completo is
component UART_system 
PORT (
    clk, reset: in std_logic; 
    rx: in std_logic; 
    clr_flag : in std_logic;
    dout : out std_logic_vector (W-1 downto 0) ; 
    flag: out std_logic); 
end component;
component clk50
PORT (
    clk_in1, resetn: in std_logic; 
    clk_out1: out std_logic); 
end component;
component LENET_5_CNN_MNSIT is

        Port ( CLK : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in std_logic;
           Sol_Display     : out std_logic_vector(6 downto 0);   
           ndisplay     : out std_logic_vector(7 downto 0);
           number_det_output: out std_logic_vector(3 downto 0);
           finish_mnsit : out std_logic;
           --RAM
           address_uart : in STD_LOGIC_VECTOR(log2c(Dim_total_Entrada) - 1 downto 0);--Dim_total_Entrada=784
           wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
           ena : IN STD_LOGIC;
           dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
           en_riscv : OUT STD_LOGIC
           ); 

end component;
component receiver_interface 
Port (clk : in STD_LOGIC;
      reset : in STD_LOGIC;
      dato_ready : in std_logic;
      address : out std_logic_vector(log2c(Dim_total_Entrada) - 1 downto 0);
      en_ram : out std_logic;
      we_ram : out STD_LOGIC_VECTOR(0 DOWNTO 0);
      clr_flag : out std_logic;
      start : out std_logic);
end component;
signal clr_flag, ena, dato_ready, start: std_logic :='0';
signal wea : std_logic_vector(0 downto 0);
signal dout_ram : std_logic_vector(7 downto 0);
signal address  : STD_LOGIC_VECTOR(log2c(Dim_total_Entrada) - 1 downto 0);
   
  signal clk_50  :   std_logic;  

  


begin
--reset <= not(BTNU); 
U1 : UART_system
Port map (
    clk => clk_50,
    reset => reset,
    rx => rx,
    clr_flag => clr_flag,
    dout => dout_ram,
    flag => dato_ready);
U2 : LENET_5_CNN_MNSIT
Port map (
     clk => clk_50,
     reset => reset,
     wea => wea,
     ena => ena,
     dina =>dout_ram,
     address_uart => address,
     start =>start,
     ndisplay => an,
     Sol_Display => seg,
     finish_mnsit => finish,
     en_riscv => en_riscv,
     number_det_output =>number_det_output
     );


 U3 : receiver_interface
Port map ( clk => clk_50,
           reset => reset,
           dato_ready => dato_ready,
           address => address,
           en_ram => ena,
           we_ram => wea,
           clr_flag => clr_flag,
           start => start);
--address_uart_sal<= address;
U4 : clk50
Port map (

    clk_in1 => clk,
    resetn => reset, 
    clk_out1 => clk_50
);
--dina_ram_sal<=dout_ram;
end Behavioral;


