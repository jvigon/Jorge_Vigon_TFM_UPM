LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
use work.Package_FC_120.all;

entity FC_120_top is
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           sol_from_84: in STD_LOGIC;
           act_layer_next_top : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           resultado_fc_120: out std_logic_vector(7 downto 0)
           );
end FC_120_top;

architecture Behavioral of FC_120_top is
 component Neurona_FC_120_0
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           act_layer_next : out STD_LOGIC;
           Solicitud_nuevo_valor_pooling : out STD_LOGIC;
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_1
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_2
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_3
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_4
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_5
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_6
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_7
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_8
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_9
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
  component Neurona_FC_120_10
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_11
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_12
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_13
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_14
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_15
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_16
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_17
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_18
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_19
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
   component Neurona_FC_120_20
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_21
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_22
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_23
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_24
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_25
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_26
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_27
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_28
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_29
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
    component Neurona_FC_120_30
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_31
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_32
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_33
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_34
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_35
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_36
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_37
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_38
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_39
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
    component Neurona_FC_120_40
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_41
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_42
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_43
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_44
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_45
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_46
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_47
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_48
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_49
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
    component Neurona_FC_120_50
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_51
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_52
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_53
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_54
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_55
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_56
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_57
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_58
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_59
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;   
    component Neurona_FC_120_60
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_61
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_62
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_63
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_64
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_65
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_66
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_67
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_68
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_69
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;   
    component Neurona_FC_120_70
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_71
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_72
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_73
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_74
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_75
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_76
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_77
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_78
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_79
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;   
    component Neurona_FC_120_80
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_81
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_82
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_83
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_84
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_85
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_86
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_87
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_88
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_89
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;  
    component Neurona_FC_120_90
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_91
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_92
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;

 component Neurona_FC_120_93
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_94
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_95
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;     
 component Neurona_FC_120_96
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_97
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_98
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_99
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component; 
 component Neurona_FC_120_100
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_101
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;            
 component Neurona_FC_120_102
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;        
 component Neurona_FC_120_103
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_104
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_105
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;    
 component Neurona_FC_120_106
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;            
       
 component Neurona_FC_120_107
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_108
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_109
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;    
 component Neurona_FC_120_110
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_111
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;            
 component Neurona_FC_120_112
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;        
 component Neurona_FC_120_113
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_114
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_115
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;    
 component Neurona_FC_120_116
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;            
       
 component Neurona_FC_120_117
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_118
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;
 component Neurona_FC_120_119
        Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           X_anterior_capa_procesar : in STD_LOGIC_VECTOR (7 downto 0);
           Start_g : in STD_LOGIC;
           Bias_Neurona : in STD_LOGIC_VECTOR(7 downto 0);
           resultado_neurona_fc_120: out std_logic_vector(7 downto 0)
           );
           end component;       
signal act_neurons: std_logic;
          
signal s_resultado_neurona_fc_120_0,s_resultado_neurona_fc_120_1,s_resultado_neurona_fc_120_2,s_resultado_neurona_fc_120_3,s_resultado_neurona_fc_120_4,s_resultado_neurona_fc_120_5,s_resultado_neurona_fc_120_6,s_resultado_neurona_fc_120_7,s_resultado_neurona_fc_120_8,s_resultado_neurona_fc_120_9: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_10,s_resultado_neurona_fc_120_11,s_resultado_neurona_fc_120_12,s_resultado_neurona_fc_120_13,s_resultado_neurona_fc_120_14,s_resultado_neurona_fc_120_15,s_resultado_neurona_fc_120_16,s_resultado_neurona_fc_120_17,s_resultado_neurona_fc_120_18,s_resultado_neurona_fc_120_19: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_20,s_resultado_neurona_fc_120_21,s_resultado_neurona_fc_120_22,s_resultado_neurona_fc_120_23,s_resultado_neurona_fc_120_24,s_resultado_neurona_fc_120_25,s_resultado_neurona_fc_120_26,s_resultado_neurona_fc_120_27,s_resultado_neurona_fc_120_28,s_resultado_neurona_fc_120_29: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_30,s_resultado_neurona_fc_120_31,s_resultado_neurona_fc_120_32,s_resultado_neurona_fc_120_33,s_resultado_neurona_fc_120_34,s_resultado_neurona_fc_120_35,s_resultado_neurona_fc_120_36,s_resultado_neurona_fc_120_37,s_resultado_neurona_fc_120_38,s_resultado_neurona_fc_120_39: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_40,s_resultado_neurona_fc_120_41,s_resultado_neurona_fc_120_42,s_resultado_neurona_fc_120_43,s_resultado_neurona_fc_120_44,s_resultado_neurona_fc_120_45,s_resultado_neurona_fc_120_46,s_resultado_neurona_fc_120_47,s_resultado_neurona_fc_120_48,s_resultado_neurona_fc_120_49: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_50,s_resultado_neurona_fc_120_51,s_resultado_neurona_fc_120_52,s_resultado_neurona_fc_120_53,s_resultado_neurona_fc_120_54,s_resultado_neurona_fc_120_55,s_resultado_neurona_fc_120_56,s_resultado_neurona_fc_120_57,s_resultado_neurona_fc_120_58,s_resultado_neurona_fc_120_59: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_60,s_resultado_neurona_fc_120_61,s_resultado_neurona_fc_120_62,s_resultado_neurona_fc_120_63,s_resultado_neurona_fc_120_64,s_resultado_neurona_fc_120_65,s_resultado_neurona_fc_120_66,s_resultado_neurona_fc_120_67,s_resultado_neurona_fc_120_68,s_resultado_neurona_fc_120_69: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_70,s_resultado_neurona_fc_120_71,s_resultado_neurona_fc_120_72,s_resultado_neurona_fc_120_73,s_resultado_neurona_fc_120_74,s_resultado_neurona_fc_120_75,s_resultado_neurona_fc_120_76,s_resultado_neurona_fc_120_77,s_resultado_neurona_fc_120_78,s_resultado_neurona_fc_120_79: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_80,s_resultado_neurona_fc_120_81,s_resultado_neurona_fc_120_82,s_resultado_neurona_fc_120_83,s_resultado_neurona_fc_120_84,s_resultado_neurona_fc_120_85,s_resultado_neurona_fc_120_86,s_resultado_neurona_fc_120_87,s_resultado_neurona_fc_120_88,s_resultado_neurona_fc_120_89: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_90,s_resultado_neurona_fc_120_91,s_resultado_neurona_fc_120_92,s_resultado_neurona_fc_120_93,s_resultado_neurona_fc_120_94,s_resultado_neurona_fc_120_95,s_resultado_neurona_fc_120_96,s_resultado_neurona_fc_120_97,s_resultado_neurona_fc_120_98,s_resultado_neurona_fc_120_99: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_100,s_resultado_neurona_fc_120_101,s_resultado_neurona_fc_120_102,s_resultado_neurona_fc_120_103,s_resultado_neurona_fc_120_104,s_resultado_neurona_fc_120_105,s_resultado_neurona_fc_120_106,s_resultado_neurona_fc_120_107,s_resultado_neurona_fc_120_108,s_resultado_neurona_fc_120_109: std_logic_vector(7 downto 0);

signal s_resultado_neurona_fc_120_110,s_resultado_neurona_fc_120_111,s_resultado_neurona_fc_120_112,s_resultado_neurona_fc_120_113,s_resultado_neurona_fc_120_114,s_resultado_neurona_fc_120_115,s_resultado_neurona_fc_120_116,s_resultado_neurona_fc_120_117,s_resultado_neurona_fc_120_118,s_resultado_neurona_fc_120_119: std_logic_vector(7 downto 0);

--ESPERAR ACTIVACION
signal salida_act, wait_cycle : std_logic;
signal cont_act : unsigned (3 downto 0);

--CONTADOR NEURONAS
signal cont_neuronas : unsigned ((log2c(Numero_Neuronas_FC_120)-1) downto 0);--hasta 
begin
NEURONA_FC_120_0_Nueron: Neurona_FC_120_0
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_0,
        Solicitud_nuevo_valor_pooling => Solicitud_nuevo_valor_pooling,
        act_layer_next => act_neurons,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_0
        );  
 NEURONA_FC_120_1_Neuron: Neurona_FC_120_1
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_1,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_1
        );
NEURONA_FC_120_2_Neuron: Neurona_FC_120_2
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_2,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_2
        );
  NEURONA_FC_120_3_Neuron: Neurona_FC_120_3
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_3,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_3
        );
NEURONA_FC_120_4_Neuron: Neurona_FC_120_4
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_4,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_4
        );    
 NEURONA_FC_120_5_Neuron: Neurona_FC_120_5
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_5,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_5
        );
NEURONA_FC_120_6_Neuron: Neurona_FC_120_6
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_6,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_6
        ); 
 NEURONA_FC_120_7_Neuron: Neurona_FC_120_7
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_7,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_7
        );  
NEURONA_FC_120_8_Neuron: Neurona_FC_120_8
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_8,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_8
        ); 
 NEURONA_FC_120_9_Neuron: Neurona_FC_120_9
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_9,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_9
        );  
NEURONA_FC_120_10_Neuron: Neurona_FC_120_10
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_10,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_10
        ); 
 NEURONA_FC_120_11_Neuron: Neurona_FC_120_11
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_11,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_11
        );    
 NEURONA_FC_120_12_Neuron: Neurona_FC_120_12
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_12,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_12
        ); 
 NEURONA_FC_120_13_Neuron: Neurona_FC_120_13
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_13,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_13
        );       
  NEURONA_FC_120_14_Neuron: Neurona_FC_120_14
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_14,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_14
        ); 
 NEURONA_FC_120_15_Neuron: Neurona_FC_120_15
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_15,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_15
        );   
  NEURONA_FC_120_16_Neuron: Neurona_FC_120_16
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_16,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_16
        ); 
 NEURONA_FC_120_17_Neuron: Neurona_FC_120_17
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_17,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_17
        ); 
   NEURONA_FC_120_18_Neuron: Neurona_FC_120_18
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_18,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_18
        ); 
 NEURONA_FC_120_19_Neuron: Neurona_FC_120_19
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_19,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_19
        ); 
 NEURONA_FC_120_20_Neuron: Neurona_FC_120_20
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_20,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_20
        ); 
NEURONA_FC_120_21_Neuron: Neurona_FC_120_21
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_21,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_21
        ); 
  NEURONA_FC_120_22_Neuron: Neurona_FC_120_22
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_22,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_22
        ); 
NEURONA_FC_120_23_Neuron: Neurona_FC_120_23
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_23,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_23
        ); 
NEURONA_FC_120_24_Neuron: Neurona_FC_120_24
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_24,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_24
        ); 
NEURONA_FC_120_25_Neuron: Neurona_FC_120_25
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_25,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_25
        );
 NEURONA_FC_120_26_Neuron: Neurona_FC_120_26
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_26,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_26
        ); 
NEURONA_FC_120_27_Neuron: Neurona_FC_120_27
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_27,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_27
        );
NEURONA_FC_120_28_Neuron: Neurona_FC_120_28
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_28,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_28
        ); 
NEURONA_FC_120_29_Neuron: Neurona_FC_120_29
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_29,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_29
        );
 NEURONA_FC_120_30_Neuron: Neurona_FC_120_30
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_30,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_30
        ); 
NEURONA_FC_120_31_Neuron: Neurona_FC_120_31
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_31,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_31
        );
 NEURONA_FC_120_32_Neuron: Neurona_FC_120_32
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_32,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_32
        );
 NEURONA_FC_120_33_Neuron: Neurona_FC_120_33
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_33,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_33
        );
 NEURONA_FC_120_34_Neuron: Neurona_FC_120_34
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_34,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_34
        );
 NEURONA_FC_120_35_Neuron: Neurona_FC_120_35
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_35,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_35
        );
 NEURONA_FC_120_36_Neuron: Neurona_FC_120_36
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_36,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_36
        );
  NEURONA_FC_120_37_Neuron: Neurona_FC_120_37
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_37,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_37
        );
 NEURONA_FC_120_38_Neuron: Neurona_FC_120_38
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_38,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_38
        );
  NEURONA_FC_120_39_Neuron: Neurona_FC_120_39
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_39,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_39
        );
  NEURONA_FC_120_40_Neuron: Neurona_FC_120_40
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_40,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_40
        ); 
   NEURONA_FC_120_41_Neuron: Neurona_FC_120_41
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_41,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_41
        ); 
  NEURONA_FC_120_42_Neuron: Neurona_FC_120_42
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_42,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_42
        ); 
   NEURONA_FC_120_43_Neuron: Neurona_FC_120_43
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_43,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_43
        ); 
  NEURONA_FC_120_44_Neuron: Neurona_FC_120_44
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_44,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_44
        ); 
   NEURONA_FC_120_45_Neuron: Neurona_FC_120_45
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_45,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_45
        ); 
   NEURONA_FC_120_46_Neuron: Neurona_FC_120_46
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_46,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_46
        ); 
   NEURONA_FC_120_47_Neuron: Neurona_FC_120_47
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_47,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_47
        );
   NEURONA_FC_120_48_Neuron: Neurona_FC_120_48
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_48,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_48
        ); 
   NEURONA_FC_120_49_Neuron: Neurona_FC_120_49
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_49,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_49
        ); 
   NEURONA_FC_120_50_Neuron: Neurona_FC_120_50
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_50,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_50
        ); 
   NEURONA_FC_120_51_Neuron: Neurona_FC_120_51
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_51,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_51
        ); 
   NEURONA_FC_120_52_Neuron: Neurona_FC_120_52
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_52,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_52
        ); 
   NEURONA_FC_120_53_Neuron: Neurona_FC_120_53
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_53,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_53
        ); 
   NEURONA_FC_120_54_Neuron: Neurona_FC_120_54
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_54,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_54
        ); 
   NEURONA_FC_120_55_Neuron: Neurona_FC_120_55
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_55,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_55
        ); 
   NEURONA_FC_120_56_Neuron: Neurona_FC_120_56
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_56,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_56
        ); 
   NEURONA_FC_120_57_Neuron: Neurona_FC_120_57
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_57,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_57
        ); 
   NEURONA_FC_120_58_Neuron: Neurona_FC_120_58
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_58,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_58
        ); 
   NEURONA_FC_120_59_Neuron: Neurona_FC_120_59
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_59,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_59
        );
    NEURONA_FC_120_60_Neuron: Neurona_FC_120_60
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_60,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_60
        );
    NEURONA_FC_120_61_Neuron: Neurona_FC_120_61
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_61,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_61
        ); 
    NEURONA_FC_120_62_Neuron: Neurona_FC_120_62
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_62,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_62
        );
    NEURONA_FC_120_63_Neuron: Neurona_FC_120_63
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_63,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_63
        ); 
    NEURONA_FC_120_64_Neuron: Neurona_FC_120_64
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_64,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_64
        );
    NEURONA_FC_120_65_Neuron: Neurona_FC_120_65
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_65,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_65
        ); 
    NEURONA_FC_120_66_Neuron: Neurona_FC_120_66
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_66,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_66
        );
    NEURONA_FC_120_67_Neuron: Neurona_FC_120_67
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_67,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_67
        ); 
    NEURONA_FC_120_68_Neuron: Neurona_FC_120_68
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_68,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_68
        );
    NEURONA_FC_120_69_Neuron: Neurona_FC_120_69
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_69,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_69
        ); 
    NEURONA_FC_120_70_Neuron: Neurona_FC_120_70
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_70,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_70
        ); 
    NEURONA_FC_120_71_Neuron: Neurona_FC_120_71
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_71,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_71
        );
    NEURONA_FC_120_72_Neuron: Neurona_FC_120_72
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_72,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_72
        ); 
    NEURONA_FC_120_73_Neuron: Neurona_FC_120_73
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_73,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_73
        );
    NEURONA_FC_120_74_Neuron: Neurona_FC_120_74
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_74,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_74
        ); 
    NEURONA_FC_120_75_Neuron: Neurona_FC_120_75
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_75,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_75
        );
     NEURONA_FC_120_76_Neuron: Neurona_FC_120_76
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_76,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_76
        );
    NEURONA_FC_120_77_Neuron: Neurona_FC_120_77
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_77,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_77
        );
     NEURONA_FC_120_78_Neuron: Neurona_FC_120_78
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_78,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_78
        );
    NEURONA_FC_120_79_Neuron: Neurona_FC_120_79
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_79,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_79
        );
    NEURONA_FC_120_80_Neuron: Neurona_FC_120_80
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_80,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_80
        );
    NEURONA_FC_120_81_Neuron: Neurona_FC_120_81
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_81,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_81
        );
    NEURONA_FC_120_82_Neuron: Neurona_FC_120_82
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_82,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_82
        );
    NEURONA_FC_120_83_Neuron: Neurona_FC_120_83
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_83,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_83
        );
    NEURONA_FC_120_84_Neuron: Neurona_FC_120_84
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_84,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_84
        );
    NEURONA_FC_120_85_Neuron: Neurona_FC_120_85
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_85,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_85
        );
    NEURONA_FC_120_86_Neuron: Neurona_FC_120_86
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_86,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_86
        );
    NEURONA_FC_120_87_Neuron: Neurona_FC_120_87
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_87,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_87
        );
     NEURONA_FC_120_88_Neuron: Neurona_FC_120_88
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_88,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_88
        );
    NEURONA_FC_120_89_Neuron: Neurona_FC_120_89
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_89,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_89
        );
    NEURONA_FC_120_90_Neuron: Neurona_FC_120_90
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_90,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_90
        );
    NEURONA_FC_120_91_Neuron: Neurona_FC_120_91
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_91,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_91
        );
    NEURONA_FC_120_92_Neuron: Neurona_FC_120_92
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_92,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_92
        );
    NEURONA_FC_120_93_Neuron: Neurona_FC_120_93
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_93,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_93
        );
    NEURONA_FC_120_94_Neuron: Neurona_FC_120_94
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_94,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_94
        );
    NEURONA_FC_120_95_Neuron: Neurona_FC_120_95
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_95,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_95
        );
 NEURONA_FC_120_96_Neuron: Neurona_FC_120_96
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_96,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_96
        );
    NEURONA_FC_120_97_Neuron: Neurona_FC_120_97
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_97,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_97
        );
 NEURONA_FC_120_98_Neuron: Neurona_FC_120_98
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_98,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_98
        );
    NEURONA_FC_120_99_Neuron: Neurona_FC_120_99
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_99,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_99
        );
 NEURONA_FC_120_100_Neuron: Neurona_FC_120_100
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_100,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_100
        );
 NEURONA_FC_120_101_Neuron: Neurona_FC_120_101
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_101,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_101
        );
 NEURONA_FC_120_102_Neuron: Neurona_FC_120_102
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_102,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_102
        );
 NEURONA_FC_120_103_Neuron: Neurona_FC_120_103
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_103,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_103
        );
 NEURONA_FC_120_104_Neuron: Neurona_FC_120_104
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_104,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_104
        );
 NEURONA_FC_120_105_Neuron: Neurona_FC_120_105
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_105,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_105
        ); 
 NEURONA_FC_120_106_Neuron: Neurona_FC_120_106
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_106,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_106
        );
 NEURONA_FC_120_107_Neuron: Neurona_FC_120_107
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_107,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_107
        );
 NEURONA_FC_120_108_Neuron: Neurona_FC_120_108
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_108,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_108
        );
 NEURONA_FC_120_109_Neuron: Neurona_FC_120_109
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_109,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_109
        );
 NEURONA_FC_120_110_Neuron: Neurona_FC_120_110
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_110,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_110
        );    
 NEURONA_FC_120_111_Neuron: Neurona_FC_120_111
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_111,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_111
        );  
 NEURONA_FC_120_112_Neuron: Neurona_FC_120_112
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_112,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_112
        );    
 NEURONA_FC_120_113_Neuron: Neurona_FC_120_113
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_113,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_113
        );    
 NEURONA_FC_120_114_Neuron: Neurona_FC_120_114
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_114,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_114
        );    
 NEURONA_FC_120_115_Neuron: Neurona_FC_120_115
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_115,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_115
        );
 NEURONA_FC_120_116_Neuron: Neurona_FC_120_116
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_116,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_116
        );    
 NEURONA_FC_120_117_Neuron: Neurona_FC_120_117
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_117,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_117
        );        
 NEURONA_FC_120_118_Neuron: Neurona_FC_120_118
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_118,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_118
        );    
 NEURONA_FC_120_119_Neuron: Neurona_FC_120_119
    port map (
        Reset => Reset,
        Clk => Clk,
        X_anterior_capa_procesar =>X_anterior_capa_procesar,
        Start_g =>  Start_g,
        Bias_Neurona => BIAS_FC_NEURON_119,
        resultado_neurona_fc_120 => s_resultado_neurona_fc_120_119
        );                                   
 --para activar siguiente capa esperamos diez ciclos por si acaso       
 ESPERAR_ACTIVATION :process (clk, reset)
    begin
        if reset = '0' then
            cont_act <= (others => '0');
            salida_act <= '0';
            wait_cycle <= '0';
        elsif rising_edge(clk) then
            -- Detect edge of act_neurons
            if act_neurons = '1' and wait_cycle = '0' then
                wait_cycle <= '1';
                cont_act <=(others => '0');
            end if;
            if wait_cycle = '1' then
                if cont_act = 10 then
                    salida_act <= '1';
                    wait_cycle <= '0';
                    cont_act<=(others => '0');
                else
                    salida_act <= '0';
                    cont_act <= cont_act + 1;
                end if;
            else
                salida_act <= '0';
            end if;
        end if;
    end process;
act_layer_next_top<=salida_act;
--contador para llevar el control de las salidas a la siguiente capa FC 84
 CONTADOR_SALIDAS:  process (clk, reset)
    begin
        if reset = '0' then
            cont_neuronas <= (others => '0'); -- Reiniciar el contador a 0
        elsif rising_edge(clk) then
            if sol_from_84 = '1' then
                if cont_neuronas < 119 then
                    cont_neuronas <= cont_neuronas + 1;
                else
                    cont_neuronas <= (others => '0'); -- Mantener en 119 si ya está en el máximo
                end if;
            end if;
        end if;
    end process;
resultado_fc_120 <=s_resultado_neurona_fc_120_0 when cont_neuronas=0 else 
                    s_resultado_neurona_fc_120_1 when cont_neuronas=1 else 
                    s_resultado_neurona_fc_120_2 when cont_neuronas=2 else 
                    s_resultado_neurona_fc_120_3 when cont_neuronas=3 else 
                    s_resultado_neurona_fc_120_4 when cont_neuronas=4 else 
                    s_resultado_neurona_fc_120_5 when cont_neuronas=5 else 
                    s_resultado_neurona_fc_120_6 when cont_neuronas=6 else 
                    s_resultado_neurona_fc_120_7 when cont_neuronas=7 else 
                    s_resultado_neurona_fc_120_8 when cont_neuronas=8 else 
                    s_resultado_neurona_fc_120_9 when cont_neuronas=9 else 
                    s_resultado_neurona_fc_120_10 when cont_neuronas=10 else 
                    s_resultado_neurona_fc_120_11 when cont_neuronas=11 else 
                    s_resultado_neurona_fc_120_12 when cont_neuronas=12 else 
                    s_resultado_neurona_fc_120_13 when cont_neuronas=13 else 
                    s_resultado_neurona_fc_120_14 when cont_neuronas=14 else 
                    s_resultado_neurona_fc_120_15 when cont_neuronas=15 else 
                    s_resultado_neurona_fc_120_16 when cont_neuronas=16 else 
                    s_resultado_neurona_fc_120_17 when cont_neuronas=17 else 
                    s_resultado_neurona_fc_120_18 when cont_neuronas=18 else 
                    s_resultado_neurona_fc_120_19 when cont_neuronas=19 else 
                    s_resultado_neurona_fc_120_20 when cont_neuronas=20 else 
                    s_resultado_neurona_fc_120_21 when cont_neuronas=21 else 
                    s_resultado_neurona_fc_120_22 when cont_neuronas=22 else 
                    s_resultado_neurona_fc_120_23 when cont_neuronas=23 else 
                    s_resultado_neurona_fc_120_24 when cont_neuronas=24 else 
                    s_resultado_neurona_fc_120_25 when cont_neuronas=25 else 
                    s_resultado_neurona_fc_120_26 when cont_neuronas=26 else 
                    s_resultado_neurona_fc_120_27 when cont_neuronas=27 else 
                    s_resultado_neurona_fc_120_28 when cont_neuronas=28 else 
                    s_resultado_neurona_fc_120_29 when cont_neuronas=29 else 
                    s_resultado_neurona_fc_120_30 when cont_neuronas=30 else 
                    s_resultado_neurona_fc_120_31 when cont_neuronas=31 else 
                    s_resultado_neurona_fc_120_32 when cont_neuronas=32 else 
                    s_resultado_neurona_fc_120_33 when cont_neuronas=33 else 
                    s_resultado_neurona_fc_120_34 when cont_neuronas=34 else 
                    s_resultado_neurona_fc_120_35 when cont_neuronas=35 else 
                    s_resultado_neurona_fc_120_36 when cont_neuronas=36 else 
                    s_resultado_neurona_fc_120_37 when cont_neuronas=37 else 
                    s_resultado_neurona_fc_120_38 when cont_neuronas=38 else 
                    s_resultado_neurona_fc_120_39 when cont_neuronas=39 else 
                    s_resultado_neurona_fc_120_40 when cont_neuronas=40 else 
                    s_resultado_neurona_fc_120_41 when cont_neuronas=41 else 
                    s_resultado_neurona_fc_120_42 when cont_neuronas=42 else 
                    s_resultado_neurona_fc_120_43 when cont_neuronas=43 else 
                    s_resultado_neurona_fc_120_44 when cont_neuronas=44 else 
                    s_resultado_neurona_fc_120_45 when cont_neuronas=45 else 
                    s_resultado_neurona_fc_120_46 when cont_neuronas=46 else 
                    s_resultado_neurona_fc_120_47 when cont_neuronas=47 else 
                    s_resultado_neurona_fc_120_48 when cont_neuronas=48 else 
                    s_resultado_neurona_fc_120_49 when cont_neuronas=49 else 
                    s_resultado_neurona_fc_120_50 when cont_neuronas=50 else 
                    s_resultado_neurona_fc_120_51 when cont_neuronas=51 else 
                    s_resultado_neurona_fc_120_52 when cont_neuronas=52 else 
                    s_resultado_neurona_fc_120_53 when cont_neuronas=53 else 
                    s_resultado_neurona_fc_120_54 when cont_neuronas=54 else 
                    s_resultado_neurona_fc_120_55 when cont_neuronas=55 else 
                    s_resultado_neurona_fc_120_56 when cont_neuronas=56 else 
                    s_resultado_neurona_fc_120_57 when cont_neuronas=57 else 
                    s_resultado_neurona_fc_120_58 when cont_neuronas=58 else 
                    s_resultado_neurona_fc_120_59 when cont_neuronas=59 else 
                    s_resultado_neurona_fc_120_60 when cont_neuronas=60 else 
                    s_resultado_neurona_fc_120_61 when cont_neuronas=61 else 
                    s_resultado_neurona_fc_120_62 when cont_neuronas=62 else 
                    s_resultado_neurona_fc_120_63 when cont_neuronas=63 else 
                    s_resultado_neurona_fc_120_64 when cont_neuronas=64 else 
                    s_resultado_neurona_fc_120_65 when cont_neuronas=65 else 
                    s_resultado_neurona_fc_120_66 when cont_neuronas=66 else 
                    s_resultado_neurona_fc_120_67 when cont_neuronas=67 else 
                    s_resultado_neurona_fc_120_68 when cont_neuronas=68 else 
                    s_resultado_neurona_fc_120_69 when cont_neuronas=69 else 
                    s_resultado_neurona_fc_120_70 when cont_neuronas=70 else 
                    s_resultado_neurona_fc_120_71 when cont_neuronas=71 else 
                    s_resultado_neurona_fc_120_72 when cont_neuronas=72 else 
                    s_resultado_neurona_fc_120_73 when cont_neuronas=73 else 
                    s_resultado_neurona_fc_120_74 when cont_neuronas=74 else 
                    s_resultado_neurona_fc_120_75 when cont_neuronas=75 else 
                    s_resultado_neurona_fc_120_76 when cont_neuronas=76 else 
                    s_resultado_neurona_fc_120_77 when cont_neuronas=77 else 
                    s_resultado_neurona_fc_120_78 when cont_neuronas=78 else 
                    s_resultado_neurona_fc_120_79 when cont_neuronas=79 else 
                    s_resultado_neurona_fc_120_80 when cont_neuronas=80 else 
                    s_resultado_neurona_fc_120_81 when cont_neuronas=81 else 
                    s_resultado_neurona_fc_120_82 when cont_neuronas=82 else 
                    s_resultado_neurona_fc_120_83 when cont_neuronas=83 else 
                    s_resultado_neurona_fc_120_84 when cont_neuronas=84 else 
                    s_resultado_neurona_fc_120_85 when cont_neuronas=85 else 
                    s_resultado_neurona_fc_120_86 when cont_neuronas=86 else 
                    s_resultado_neurona_fc_120_87 when cont_neuronas=87 else 
                    s_resultado_neurona_fc_120_88 when cont_neuronas=88 else 
                    s_resultado_neurona_fc_120_89 when cont_neuronas=89 else 
                    s_resultado_neurona_fc_120_90 when cont_neuronas=90 else 
                    s_resultado_neurona_fc_120_91 when cont_neuronas=91 else 
                    s_resultado_neurona_fc_120_92 when cont_neuronas=92 else 
                    s_resultado_neurona_fc_120_93 when cont_neuronas=93 else 
                    s_resultado_neurona_fc_120_94 when cont_neuronas=94 else 
                    s_resultado_neurona_fc_120_95 when cont_neuronas=95 else 
                    s_resultado_neurona_fc_120_96 when cont_neuronas=96 else 
                    s_resultado_neurona_fc_120_97 when cont_neuronas=97 else 
                    s_resultado_neurona_fc_120_98 when cont_neuronas=98 else 
                    s_resultado_neurona_fc_120_99 when cont_neuronas=99 else 
                    s_resultado_neurona_fc_120_100 when cont_neuronas=100 else 
                    s_resultado_neurona_fc_120_101 when cont_neuronas=101 else 
                    s_resultado_neurona_fc_120_102 when cont_neuronas=102 else 
                    s_resultado_neurona_fc_120_103 when cont_neuronas=103 else 
                    s_resultado_neurona_fc_120_104 when cont_neuronas=104 else 
                    s_resultado_neurona_fc_120_105 when cont_neuronas=105 else 
                    s_resultado_neurona_fc_120_106 when cont_neuronas=106 else 
                    s_resultado_neurona_fc_120_107 when cont_neuronas=107 else 
                    s_resultado_neurona_fc_120_108 when cont_neuronas=108 else 
                    s_resultado_neurona_fc_120_109 when cont_neuronas=109 else 
                    s_resultado_neurona_fc_120_110 when cont_neuronas=110 else 
                    s_resultado_neurona_fc_120_111 when cont_neuronas=111 else 
                    s_resultado_neurona_fc_120_112 when cont_neuronas=112 else 
                    s_resultado_neurona_fc_120_113 when cont_neuronas=113 else 
                    s_resultado_neurona_fc_120_114 when cont_neuronas=114 else 
                    s_resultado_neurona_fc_120_115 when cont_neuronas=115 else 
                    s_resultado_neurona_fc_120_116 when cont_neuronas=116 else 
                    s_resultado_neurona_fc_120_117 when cont_neuronas=117 else 
                    s_resultado_neurona_fc_120_118 when cont_neuronas=118 else 
                    s_resultado_neurona_fc_120_119;

end Behavioral;
