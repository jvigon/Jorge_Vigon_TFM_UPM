
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.CNN_Package.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sistema_Completo is
generic (W: integer := 8;
         DBIT : integer := 8; -- # data bits 
         SB_TICK: integer := 16 -- # ticks for stop bits 
); 
port( 
--    clk, reset: in std_logic; 
--    rx: in std_logic; 
--    an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--    seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
--    switches: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--    --address_uart_sal : out STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 downto 0);
--    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--    dina_ram_sal : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    clk, reset: in std_logic; 
    rx: in std_logic; 
    finish : out std_logic;
    an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    resultado_final : out std_logic_vector((10) downto 0);
    en_riscv : OUT STD_LOGIC;
    y : OUT STD_LOGIC
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
component CNN_AVION_RANA is
--    Port (clk : in STD_LOGIC;
--          rst : in STD_LOGIC;
--          an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--          seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
--          wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--          ena : IN STD_LOGIC;
--          dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
--          douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
--          switches: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--          address_uart : in STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 downto 0);
--          start : in std_logic
--          );
    Port (clk : in STD_LOGIC;
          rst : in STD_LOGIC;
          an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
          seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
          y : OUT STD_LOGIC;
          wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          ena : IN STD_LOGIC;
          dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
          en_riscv : OUT STD_LOGIC;
          address_uart : in STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 downto 0);
          resultado_final : out std_logic_vector((7+log2c(Rango_Normalizacion_FC)+1) downto 0);
          start : in std_logic;
          finish_neural_detect : out std_logic);
end component;
component receiver_interface 
Port (clk : in STD_LOGIC;
      reset : in STD_LOGIC;
      dato_ready : in std_logic;
      address : out std_logic_vector(log2c(number_of_inputs) - 1 downto 0);
      en_ram : out std_logic;
      we_ram : out STD_LOGIC_VECTOR(0 DOWNTO 0);
      clr_flag : out std_logic;
      start : out std_logic);
end component;
signal clr_flag, ena, dato_ready, start: std_logic :='0';
signal wea : std_logic_vector(0 downto 0);
signal dout_ram : std_logic_vector(7 downto 0);
--signal address  :STD_LOGIC_VECTOR(9 DOWNTO 0);    IRENE TIENE ESTO DA ERROR
signal address  : STD_LOGIC_VECTOR(log2c(number_of_inputs) - 1 downto 0);

--YO
-- signal Reset  :   std_logic;   
  signal Start_g, clk_50  :   std_logic;  
  signal pulsacion: std_logic; 
  signal y_final: std_logic; 
  

--NUEVO CNN
--signal s_finalizado_global_filtro: std_logic; 
signal s_valor_final_pool: STD_LOGIC_VECTOR (7 downto 0); 
signal s_Pool_bloque_ready_4 : STD_LOGIC;
signal s_Flatten_ready : STD_LOGIC;

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
U2 : CNN_AVION_RANA
Port map (
--     clk => clk_50,
--     rst => reset,
--     wea => wea,
--     ena => ena,
--     dina =>dout_ram,
--     douta => douta,
--     address_uart => address,
--     switches => switches,
--     start =>start,
--     an => an,
--     seg => seg
     clk => clk_50,
     rst => reset,
     wea => wea,
     ena => ena,
     dina =>dout_ram,
     address_uart => address,
     start =>start,
     an => an,
     seg => seg,
     finish_neural_detect => finish,
     en_riscv => en_riscv,
     resultado_final =>resultado_final,
     y => y
     );

--Interface with a flag FF and buffer
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


