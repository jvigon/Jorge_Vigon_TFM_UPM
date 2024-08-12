
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
use work.Package_FC_84.all;


entity FC_84_top is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           sol_from_10: in STD_LOGIC;
           act_layer_next_top_84 : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           resultado_fc_84: out std_logic_vector(7 downto 0)
           );
end FC_84_top;

architecture Behavioral of FC_84_top is
 component Neurona_FC_84_0
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           act_layer_next : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;
  component Neurona_FC_84_1
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_2
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_3
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
   component Neurona_FC_84_4
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_5
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_6
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
    component Neurona_FC_84_7
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_8
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_9
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component; 
    component Neurona_FC_84_10
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;           
   component Neurona_FC_84_11
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_12
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_13
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
   component Neurona_FC_84_14
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_15
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_16
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
    component Neurona_FC_84_17
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_18
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_19
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
     component Neurona_FC_84_20
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;           
   component Neurona_FC_84_21
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_22
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_23
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
   component Neurona_FC_84_24
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_25
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_26
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
    component Neurona_FC_84_27
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_28
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_29
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;   
     component Neurona_FC_84_30
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;           
   component Neurona_FC_84_31
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_32
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_33
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
   component Neurona_FC_84_34
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_35
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_36
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
    component Neurona_FC_84_37
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_38
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_39
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;     
     component Neurona_FC_84_40
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;           
   component Neurona_FC_84_41
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_42
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_43
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
   component Neurona_FC_84_44
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_45
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_46
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
    component Neurona_FC_84_47
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_48
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_49
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
component Neurona_FC_84_50
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;           
   component Neurona_FC_84_51
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_52
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_53
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
   component Neurona_FC_84_54
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_55
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
                                                                                                 
  component Neurona_FC_84_56
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
    component Neurona_FC_84_57
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_58
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_59
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
                              
 component Neurona_FC_84_60
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;
   component Neurona_FC_84_61
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_62
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_63
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
   component Neurona_FC_84_64
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_65
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
                                                                                                 
  component Neurona_FC_84_66
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
    component Neurona_FC_84_67
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_68
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_69
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
 component Neurona_FC_84_70
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;
   component Neurona_FC_84_71
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_72
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_73
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;    
   component Neurona_FC_84_74
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_75
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
                                                                                                 
  component Neurona_FC_84_76
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
    component Neurona_FC_84_77
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_78
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_79
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_84_80
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;
   component Neurona_FC_84_81
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_82
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;  
   component Neurona_FC_84_83
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_84: out std_logic_vector(7 downto 0)
           );
           end component;                                           
signal act_neurons_84: std_logic;
          
signal s_resultado_neurona_fc_84_0,s_resultado_neurona_fc_84_1,s_resultado_neurona_fc_84_2,s_resultado_neurona_fc_84_3,s_resultado_neurona_fc_84_4,s_resultado_neurona_fc_84_5,s_resultado_neurona_fc_84_6,s_resultado_neurona_fc_84_7,s_resultado_neurona_fc_84_8,s_resultado_neurona_fc_84_9: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_84_10,s_resultado_neurona_fc_84_11,s_resultado_neurona_fc_84_12,s_resultado_neurona_fc_84_13,s_resultado_neurona_fc_84_14,s_resultado_neurona_fc_84_15,s_resultado_neurona_fc_84_16,s_resultado_neurona_fc_84_17,s_resultado_neurona_fc_84_18,s_resultado_neurona_fc_84_19: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_84_20,s_resultado_neurona_fc_84_21,s_resultado_neurona_fc_84_22,s_resultado_neurona_fc_84_23,s_resultado_neurona_fc_84_24,s_resultado_neurona_fc_84_25,s_resultado_neurona_fc_84_26,s_resultado_neurona_fc_84_27,s_resultado_neurona_fc_84_28,s_resultado_neurona_fc_84_29: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_84_30,s_resultado_neurona_fc_84_31,s_resultado_neurona_fc_84_32,s_resultado_neurona_fc_84_33,s_resultado_neurona_fc_84_34,s_resultado_neurona_fc_84_35,s_resultado_neurona_fc_84_36,s_resultado_neurona_fc_84_37,s_resultado_neurona_fc_84_38,s_resultado_neurona_fc_84_39: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_84_40,s_resultado_neurona_fc_84_41,s_resultado_neurona_fc_84_42,s_resultado_neurona_fc_84_43,s_resultado_neurona_fc_84_44,s_resultado_neurona_fc_84_45,s_resultado_neurona_fc_84_46,s_resultado_neurona_fc_84_47,s_resultado_neurona_fc_84_48,s_resultado_neurona_fc_84_49: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_84_50,s_resultado_neurona_fc_84_51,s_resultado_neurona_fc_84_52,s_resultado_neurona_fc_84_53,s_resultado_neurona_fc_84_54,s_resultado_neurona_fc_84_55,s_resultado_neurona_fc_84_56,s_resultado_neurona_fc_84_57,s_resultado_neurona_fc_84_58,s_resultado_neurona_fc_84_59: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_84_60,s_resultado_neurona_fc_84_61,s_resultado_neurona_fc_84_62,s_resultado_neurona_fc_84_63,s_resultado_neurona_fc_84_64,s_resultado_neurona_fc_84_65,s_resultado_neurona_fc_84_66,s_resultado_neurona_fc_84_67,s_resultado_neurona_fc_84_68,s_resultado_neurona_fc_84_69: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_84_70,s_resultado_neurona_fc_84_71,s_resultado_neurona_fc_84_72,s_resultado_neurona_fc_84_73,s_resultado_neurona_fc_84_74,s_resultado_neurona_fc_84_75,s_resultado_neurona_fc_84_76,s_resultado_neurona_fc_84_77,s_resultado_neurona_fc_84_78,s_resultado_neurona_fc_84_79: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_84_80,s_resultado_neurona_fc_84_81,s_resultado_neurona_fc_84_82,s_resultado_neurona_fc_84_83: std_logic_vector(7 downto 0);

--ESPERAR ACTIVACION
signal salida_act_84, wait_cycle_84 : std_logic;
signal cont_act_84 : unsigned (3 downto 0);

--CONTADOR NEURONAS
signal cont_neuronas_84 : unsigned ((log2c(Numero_Neuronas_FC_84)-1) downto 0);--hasta 
 

begin
NEURONA_FC_84_0_Nueron: Neurona_FC_84_0
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_0,
        Solicitud_nuevo_valor_pooling => Solicitud_nuevo_valor_pooling,
        act_layer_next => act_neurons_84,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_0
        );
NEURONA_FC_84_1_Nueron: Neurona_FC_84_1
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_1,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_1
        );   
NEURONA_FC_84_2_Nueron: Neurona_FC_84_2
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_2,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_2
        ); 
 NEURONA_FC_84_3_Nueron: Neurona_FC_84_3
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_3,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_3
        );   
NEURONA_FC_84_4_Nueron: Neurona_FC_84_4
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_4,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_4
        ); 
 NEURONA_FC_84_5_Nueron: Neurona_FC_84_5
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_5,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_5
        );  
NEURONA_FC_84_6_Nueron: Neurona_FC_84_6
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_6,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_6
        ); 
 NEURONA_FC_84_7_Nueron: Neurona_FC_84_7
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_7,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_7
        );      
NEURONA_FC_84_8_Nueron: Neurona_FC_84_8
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_8,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_8
        ); 
 NEURONA_FC_84_9_Nueron: Neurona_FC_84_9
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_9,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_9
        );       
 NEURONA_FC_84_10_Nueron: Neurona_FC_84_10
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_10,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_10
        );  
 NEURONA_FC_84_11_Nueron: Neurona_FC_84_11
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_11,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_11
        ); 
 NEURONA_FC_84_12_Nueron: Neurona_FC_84_12
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_12,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_12
        );  
 NEURONA_FC_84_13_Nueron: Neurona_FC_84_13
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_13,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_13
        );        
 NEURONA_FC_84_14_Nueron: Neurona_FC_84_14
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_14,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_14
        );  
 NEURONA_FC_84_15_Nueron: Neurona_FC_84_15
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_15,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_15
        );  
 NEURONA_FC_84_16_Nueron: Neurona_FC_84_16
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_16,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_16
        );  
 NEURONA_FC_84_17_Nueron: Neurona_FC_84_17
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_17,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_17
        );
 NEURONA_FC_84_18_Nueron: Neurona_FC_84_18
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_18,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_18
        );  
 NEURONA_FC_84_19_Nueron: Neurona_FC_84_19
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_19,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_19
        );  
 NEURONA_FC_84_20_Nueron: Neurona_FC_84_20
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_20,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_20
        ); 
 NEURONA_FC_84_21_Nueron: Neurona_FC_84_21
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_21,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_21
        );     
 NEURONA_FC_84_22_Nueron: Neurona_FC_84_22
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_22,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_22
        ); 
 NEURONA_FC_84_23_Nueron: Neurona_FC_84_23
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_23,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_23
        );    
 NEURONA_FC_84_24_Nueron: Neurona_FC_84_24
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_24,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_24
        ); 
 NEURONA_FC_84_25_Nueron: Neurona_FC_84_25
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_25,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_25
        );      
 NEURONA_FC_84_26_Nueron: Neurona_FC_84_26
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_26,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_26
        ); 
 NEURONA_FC_84_27_Nueron: Neurona_FC_84_27
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_27,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_27
        ); 
 NEURONA_FC_84_28_Nueron: Neurona_FC_84_28
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_28,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_28
        ); 
 NEURONA_FC_84_29_Nueron: Neurona_FC_84_29
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_29,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_29
        );  
 NEURONA_FC_84_30_Nueron: Neurona_FC_84_30
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_30,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_30
        );  
 NEURONA_FC_84_31_Nueron: Neurona_FC_84_31
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_31,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_31
        ); 
 NEURONA_FC_84_32_Nueron: Neurona_FC_84_32
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_32,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_32
        );  
 NEURONA_FC_84_33_Nueron: Neurona_FC_84_33
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_33,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_33
        );    
 NEURONA_FC_84_34_Nueron: Neurona_FC_84_34
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_34,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_34
        );  
 NEURONA_FC_84_35_Nueron: Neurona_FC_84_35
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_35,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_35
        );  
 NEURONA_FC_84_36_Nueron: Neurona_FC_84_36
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_36,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_36
        );  
 NEURONA_FC_84_37_Nueron: Neurona_FC_84_37
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_37,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_37
        ); 
 NEURONA_FC_84_38_Nueron: Neurona_FC_84_38
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_38,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_38
        );  
 NEURONA_FC_84_39_Nueron: Neurona_FC_84_39
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_39,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_39
        );
 NEURONA_FC_84_40_Nueron: Neurona_FC_84_40
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_40,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_40
        );  
 NEURONA_FC_84_41_Nueron: Neurona_FC_84_41
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_41,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_41
        );  
 NEURONA_FC_84_42_Nueron: Neurona_FC_84_42
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_42,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_42
        );  
 NEURONA_FC_84_43_Nueron: Neurona_FC_84_43
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_43,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_43
        ); 
 NEURONA_FC_84_44_Nueron: Neurona_FC_84_44
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_44,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_44
        );  
 NEURONA_FC_84_45_Nueron: Neurona_FC_84_45
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_45,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_45
        );          
 NEURONA_FC_84_46_Nueron: Neurona_FC_84_46
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_46,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_46
        );  
 NEURONA_FC_84_47_Nueron: Neurona_FC_84_47
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_47,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_47
        ); 
 NEURONA_FC_84_48_Nueron: Neurona_FC_84_48
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_48,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_48
        );  
 NEURONA_FC_84_49_Nueron: Neurona_FC_84_49
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_49,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_49
        );   
 NEURONA_FC_84_50_Nueron: Neurona_FC_84_50
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_50,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_50
        );          
 NEURONA_FC_84_51_Nueron: Neurona_FC_84_51
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_51,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_51
        );
 NEURONA_FC_84_52_Nueron: Neurona_FC_84_52
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_52,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_52
        );          
 NEURONA_FC_84_53_Nueron: Neurona_FC_84_53
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_53,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_53
        );        
 NEURONA_FC_84_54_Nueron: Neurona_FC_84_54
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_54,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_54
        );          
 NEURONA_FC_84_55_Nueron: Neurona_FC_84_55
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_55,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_55
        );                                                                                                                                                                                           
NEURONA_FC_84_56_Nueron: Neurona_FC_84_56
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_56,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_56
        );                                                                                                                                                                                          
NEURONA_FC_84_57_Nueron: Neurona_FC_84_57
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_57,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_57
        );
 NEURONA_FC_84_58_Nueron: Neurona_FC_84_58
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_58,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_58
        );    
 NEURONA_FC_84_59_Nueron: Neurona_FC_84_59
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_59,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_59
        );                     
NEURONA_FC_84_60_Nueron: Neurona_FC_84_60
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_60,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_60
        );   
NEURONA_FC_84_61_Nueron: Neurona_FC_84_61
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_61,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_61
        ); 
NEURONA_FC_84_62_Nueron: Neurona_FC_84_62
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_62,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_62
        );   
NEURONA_FC_84_63_Nueron: Neurona_FC_84_63
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_63,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_63
        );    
NEURONA_FC_84_64_Nueron: Neurona_FC_84_64
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_64,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_64
        );   
NEURONA_FC_84_65_Nueron: Neurona_FC_84_65
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_65,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_65
        );       
NEURONA_FC_84_66_Nueron: Neurona_FC_84_66
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_66,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_66
        );   
NEURONA_FC_84_67_Nueron: Neurona_FC_84_67
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_67,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_67
        );  
NEURONA_FC_84_68_Nueron: Neurona_FC_84_68
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_68,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_68
        );   
NEURONA_FC_84_69_Nueron: Neurona_FC_84_69
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_69,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_69
        );  
NEURONA_FC_84_70_Nueron: Neurona_FC_84_70
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_70,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_70
        );  
NEURONA_FC_84_71_Nueron: Neurona_FC_84_71
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_71,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_71
        );    
NEURONA_FC_84_72_Nueron: Neurona_FC_84_72
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_72,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_72
        );  
NEURONA_FC_84_73_Nueron: Neurona_FC_84_73
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_73,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_73
        );
NEURONA_FC_84_74_Nueron: Neurona_FC_84_74
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_74,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_74
        );  
NEURONA_FC_84_75_Nueron: Neurona_FC_84_75
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_75,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_75
        ); 
NEURONA_FC_84_76_Nueron: Neurona_FC_84_76
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_76,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_76
        );  
NEURONA_FC_84_77_Nueron: Neurona_FC_84_77
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_77,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_77
        );   
NEURONA_FC_84_78_Nueron: Neurona_FC_84_78
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_78,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_78
        );  
NEURONA_FC_84_79_Nueron: Neurona_FC_84_79
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_79,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_79
        ); 
NEURONA_FC_84_80_Nueron: Neurona_FC_84_80
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_80,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_80
        );
NEURONA_FC_84_81_Nueron: Neurona_FC_84_81
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_81,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_81
        );  
NEURONA_FC_84_82_Nueron: Neurona_FC_84_82
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_82,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_82
        );
NEURONA_FC_84_83_Nueron: Neurona_FC_84_83
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_84_NEURON_83,
        resultado_neurona_fc_84 => s_resultado_neurona_fc_84_83
        );                                                                                                     
ESPERAR_ACTIVATION :process (clk, reset)
    begin
        if reset = '0' then
            cont_act_84 <= (others => '0');
            salida_act_84 <= '0';
            wait_cycle_84 <= '0';
        elsif rising_edge(clk) then
            -- Detect edge of act_neurons
            if act_neurons_84 = '1' and wait_cycle_84 = '0' then
                wait_cycle_84 <= '1';
                cont_act_84 <=(others => '0');
            end if;
            if wait_cycle_84 = '1' then
                if cont_act_84 = 10 then
                    salida_act_84 <= '1';
                    wait_cycle_84 <= '0';
                    cont_act_84<=(others => '0');
                else
                    salida_act_84 <= '0';
                    cont_act_84 <= cont_act_84 + 1;
                end if;
            else
                salida_act_84 <= '0';
            end if;
        end if;
    end process;
act_layer_next_top_84<=salida_act_84;
      
 CONTADOR_SALIDAS_84:  process (clk, reset)
    begin
        if reset = '0' then
            cont_neuronas_84 <= (others => '0'); -- Reiniciar el contador a 0
        elsif rising_edge(clk) then
            if sol_from_10 = '1' then
                if cont_neuronas_84 < 119 then
                    cont_neuronas_84 <= cont_neuronas_84 + 1;
                else
                    cont_neuronas_84 <= (others => '0'); 
                end if;
            end if;
        end if;
    end process;
resultado_fc_84 <= s_resultado_neurona_fc_84_0 when cont_neuronas_84=0 else 
                s_resultado_neurona_fc_84_1 when cont_neuronas_84=1 else 
                s_resultado_neurona_fc_84_2 when cont_neuronas_84=2 else 
                s_resultado_neurona_fc_84_3 when cont_neuronas_84=3 else 
                s_resultado_neurona_fc_84_4 when cont_neuronas_84=4 else 
                s_resultado_neurona_fc_84_5 when cont_neuronas_84=5 else 
                s_resultado_neurona_fc_84_6 when cont_neuronas_84=6 else 
                s_resultado_neurona_fc_84_7 when cont_neuronas_84=7 else 
                s_resultado_neurona_fc_84_8 when cont_neuronas_84=8 else 
                s_resultado_neurona_fc_84_9 when cont_neuronas_84=9 else 
                s_resultado_neurona_fc_84_10 when cont_neuronas_84=10 else 
                s_resultado_neurona_fc_84_11 when cont_neuronas_84=11 else 
                s_resultado_neurona_fc_84_12 when cont_neuronas_84=12 else 
                s_resultado_neurona_fc_84_13 when cont_neuronas_84=13 else 
                s_resultado_neurona_fc_84_14 when cont_neuronas_84=14 else 
                s_resultado_neurona_fc_84_15 when cont_neuronas_84=15 else 
                s_resultado_neurona_fc_84_16 when cont_neuronas_84=16 else 
                s_resultado_neurona_fc_84_17 when cont_neuronas_84=17 else 
                s_resultado_neurona_fc_84_18 when cont_neuronas_84=18 else 
                s_resultado_neurona_fc_84_19 when cont_neuronas_84=19 else 
                s_resultado_neurona_fc_84_20 when cont_neuronas_84=20 else 
                s_resultado_neurona_fc_84_21 when cont_neuronas_84=21 else 
                s_resultado_neurona_fc_84_22 when cont_neuronas_84=22 else 
                s_resultado_neurona_fc_84_23 when cont_neuronas_84=23 else 
                s_resultado_neurona_fc_84_24 when cont_neuronas_84=24 else 
                s_resultado_neurona_fc_84_25 when cont_neuronas_84=25 else 
                s_resultado_neurona_fc_84_26 when cont_neuronas_84=26 else 
                s_resultado_neurona_fc_84_27 when cont_neuronas_84=27 else 
                s_resultado_neurona_fc_84_28 when cont_neuronas_84=28 else 
                s_resultado_neurona_fc_84_29 when cont_neuronas_84=29 else 
                s_resultado_neurona_fc_84_30 when cont_neuronas_84=30 else 
                s_resultado_neurona_fc_84_31 when cont_neuronas_84=31 else 
                s_resultado_neurona_fc_84_32 when cont_neuronas_84=32 else 
                s_resultado_neurona_fc_84_33 when cont_neuronas_84=33 else 
                s_resultado_neurona_fc_84_34 when cont_neuronas_84=34 else 
                s_resultado_neurona_fc_84_35 when cont_neuronas_84=35 else 
                s_resultado_neurona_fc_84_36 when cont_neuronas_84=36 else 
                s_resultado_neurona_fc_84_37 when cont_neuronas_84=37 else 
                s_resultado_neurona_fc_84_38 when cont_neuronas_84=38 else 
                s_resultado_neurona_fc_84_39 when cont_neuronas_84=39 else 
                s_resultado_neurona_fc_84_40 when cont_neuronas_84=40 else 
                s_resultado_neurona_fc_84_41 when cont_neuronas_84=41 else 
                s_resultado_neurona_fc_84_42 when cont_neuronas_84=42 else 
                s_resultado_neurona_fc_84_43 when cont_neuronas_84=43 else 
                s_resultado_neurona_fc_84_44 when cont_neuronas_84=44 else 
                s_resultado_neurona_fc_84_45 when cont_neuronas_84=45 else 
                s_resultado_neurona_fc_84_46 when cont_neuronas_84=46 else 
                s_resultado_neurona_fc_84_47 when cont_neuronas_84=47 else 
                s_resultado_neurona_fc_84_48 when cont_neuronas_84=48 else 
                s_resultado_neurona_fc_84_49 when cont_neuronas_84=49 else 
                s_resultado_neurona_fc_84_50 when cont_neuronas_84=50 else 
                s_resultado_neurona_fc_84_51 when cont_neuronas_84=51 else 
                s_resultado_neurona_fc_84_52 when cont_neuronas_84=52 else 
                s_resultado_neurona_fc_84_53 when cont_neuronas_84=53 else 
                s_resultado_neurona_fc_84_54 when cont_neuronas_84=54 else 
                s_resultado_neurona_fc_84_55 when cont_neuronas_84=55 else 
                s_resultado_neurona_fc_84_56 when cont_neuronas_84=56 else 
                s_resultado_neurona_fc_84_57 when cont_neuronas_84=57 else 
                s_resultado_neurona_fc_84_58 when cont_neuronas_84=58 else 
                s_resultado_neurona_fc_84_59 when cont_neuronas_84=59 else 
                s_resultado_neurona_fc_84_60 when cont_neuronas_84=60 else 
                s_resultado_neurona_fc_84_61 when cont_neuronas_84=61 else 
                s_resultado_neurona_fc_84_62 when cont_neuronas_84=62 else 
                s_resultado_neurona_fc_84_63 when cont_neuronas_84=63 else 
                s_resultado_neurona_fc_84_64 when cont_neuronas_84=64 else 
                s_resultado_neurona_fc_84_65 when cont_neuronas_84=65 else 
                s_resultado_neurona_fc_84_66 when cont_neuronas_84=66 else 
                s_resultado_neurona_fc_84_67 when cont_neuronas_84=67 else 
                s_resultado_neurona_fc_84_68 when cont_neuronas_84=68 else 
                s_resultado_neurona_fc_84_69 when cont_neuronas_84=69 else 
                s_resultado_neurona_fc_84_70 when cont_neuronas_84=70 else 
                s_resultado_neurona_fc_84_71 when cont_neuronas_84=71 else 
                s_resultado_neurona_fc_84_72 when cont_neuronas_84=72 else 
                s_resultado_neurona_fc_84_73 when cont_neuronas_84=73 else 
                s_resultado_neurona_fc_84_74 when cont_neuronas_84=74 else 
                s_resultado_neurona_fc_84_75 when cont_neuronas_84=75 else 
                s_resultado_neurona_fc_84_76 when cont_neuronas_84=76 else 
                s_resultado_neurona_fc_84_77 when cont_neuronas_84=77 else 
                s_resultado_neurona_fc_84_78 when cont_neuronas_84=78 else 
                s_resultado_neurona_fc_84_79 when cont_neuronas_84=79 else 
                s_resultado_neurona_fc_84_80 when cont_neuronas_84=80 else 
                s_resultado_neurona_fc_84_81 when cont_neuronas_84=81 else 
                s_resultado_neurona_fc_84_82 when cont_neuronas_84=82 else 
                s_resultado_neurona_fc_84_83; 

end Behavioral;
