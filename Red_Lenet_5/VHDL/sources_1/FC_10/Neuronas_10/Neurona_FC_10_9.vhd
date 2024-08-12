

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Package_FC_10.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Neurona_FC_10_9 is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_10: out std_logic_vector(7 downto 0)
           );
end Neurona_FC_10_9;

architecture Behavioral of Neurona_FC_10_9 is

 component Complete_Conexions_FC_10
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start_g: in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           New_value: out STD_LOGIC;
           complete_cycle: out STD_LOGIC;
           Finalizado: out STD_LOGIC;
           --act_next_layer_ADD: out STD_LOGIC;
           X_sc : out STD_LOGIC;
           W_sc : out STD_LOGIC;
                       --bram
            Direccion_pesos_fc_10 : out STD_LOGIC_VECTOR ((log2c(Dim_pesos_FC_10)-1)  downto 0);
            valor_peso_fc_10: in STD_LOGIC_VECTOR (7  downto 0)
           );
         end component;

     
      component ADD_Multiplication_FC_10
        Port ( CLK : in STD_LOGIC;
                   Reset : in STD_LOGIC;
                   x_sc : in STD_LOGIC;
                   w_sc : in STD_LOGIC;
                   Start : in STD_LOGIC;
                   entrada_complete : in STD_LOGIC;
                   Finalizado_entradas : in STD_LOGIC;
                   r_suma : out STD_LOGIC_VECTOR (7 downto 0);
                   Bias_Neurona  : in STD_LOGIC_VECTOR ( 7  downto 0)
                   );
       end component;
       
       
 component ROM_FC_10_9_LAYER
        Port ( CLK : in STD_LOGIC;
           addra_pool_2 : IN STD_LOGIC_VECTOR((log2c(Dim_pesos_FC_10)-1) downto 0);
           douta_pool_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
           );
         end component;     
signal output_LFSR_X  :   std_logic; 
signal output_LFSR_W  :   std_logic; 
--signal entradas_complete  :   std_logic; 
signal Nuevo_Dato : std_logic;
signal complete_cycle_X  :   std_logic;
--signal complete_cycle_W  :   std_logic;
signal Suma_Finalizada : std_logic;


signal no_use_X: STD_LOGIC;
signal no_use_W: STD_LOGIC;

--signal r_suma  :   std_logic_vector (7 downto 0); 

signal s_address_pesos_fc_10 : STD_LOGIC_VECTOR ((log2c(Dim_pesos_FC_10)-1)  downto 0);
signal s_valor_pesos_fc_10: STD_LOGIC_VECTOR (7 downto 0);

begin

First_LFSDRs: Complete_Conexions_FC_10
    port map (
        Reset => Reset,
        Clk => Clk,
        Start_g => Start_g,
        X_anterior_capa_procesar => X_anterior_capa_procesar,
        New_value => Nuevo_Dato,
        complete_cycle => complete_cycle_X,
        Finalizado => Suma_Finalizada,
        x_sc => output_LFSR_X,
        w_sc => output_LFSR_W,
        Direccion_pesos_fc_10=>s_address_pesos_fc_10,
        valor_peso_fc_10=>s_valor_pesos_fc_10
        );


        
    ADD_MUL: Add_Multiplication_FC_10
   port map (
        Reset => Reset,
        Clk => Clk,
        x_sc => output_LFSR_X,
        w_sc => output_LFSR_W,
        Start => Nuevo_Dato,
        entrada_complete => complete_cycle_X,
        Finalizado_entradas=> Suma_Finalizada,
        --r_suma=> r_suma,
        r_suma=>resultado_neurona_fc_10,--directamente a la salida para ver maxima, no relu
         Bias_Neurona =>Bias_Neurona
         );
         
 ROM_PESOS_FC_10_9_LAYER: ROM_FC_10_9_LAYER
   PORT MAP(
           clk => clk,
           addra_pool_2 => s_address_pesos_fc_10,
           douta_pool_2 => s_valor_pesos_fc_10
           );

end Behavioral;