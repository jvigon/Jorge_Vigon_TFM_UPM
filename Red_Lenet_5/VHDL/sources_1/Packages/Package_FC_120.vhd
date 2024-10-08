LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
package Package_FC_120 is

    
    constant Dim_pesos_FC : integer := 256; 
    constant Numero_Neuronas_FC_120 : integer := 120; 
    --constant BIAS_FC_NEURON_0 : STD_LOGIC_VECTOR :="10000001";
    constant BIAS_FC_NEURON_0 : STD_LOGIC_VECTOR :="10000001"; 
    constant BIAS_FC_NEURON_1 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_2 : STD_LOGIC_VECTOR :="10001001"; 
    constant BIAS_FC_NEURON_3 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_4 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_5 : STD_LOGIC_VECTOR :="01111100"; 
    constant BIAS_FC_NEURON_6 : STD_LOGIC_VECTOR :="01111111"; 
    constant BIAS_FC_NEURON_7 : STD_LOGIC_VECTOR :="01111111"; 
    constant BIAS_FC_NEURON_8 : STD_LOGIC_VECTOR :="01111100"; 
    constant BIAS_FC_NEURON_9 : STD_LOGIC_VECTOR :="01110111"; 
    constant BIAS_FC_NEURON_10 : STD_LOGIC_VECTOR :="01111000"; 
    constant BIAS_FC_NEURON_11 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_12 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_13 : STD_LOGIC_VECTOR :="01111000"; 
    constant BIAS_FC_NEURON_14 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_15 : STD_LOGIC_VECTOR :="10000000"; 
    constant BIAS_FC_NEURON_16 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_17 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_18 : STD_LOGIC_VECTOR :="01111111"; 
    constant BIAS_FC_NEURON_19 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_20 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_21 : STD_LOGIC_VECTOR :="10000110"; 
    constant BIAS_FC_NEURON_22 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_23 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_24 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_25 : STD_LOGIC_VECTOR :="01110001"; 
    constant BIAS_FC_NEURON_26 : STD_LOGIC_VECTOR :="01111111"; 
    constant BIAS_FC_NEURON_27 : STD_LOGIC_VECTOR :="10000000"; 
    constant BIAS_FC_NEURON_28 : STD_LOGIC_VECTOR :="10000001"; 
    constant BIAS_FC_NEURON_29 : STD_LOGIC_VECTOR :="10000111"; 
    constant BIAS_FC_NEURON_30 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_31 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_32 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_33 : STD_LOGIC_VECTOR :="01111001"; 
    constant BIAS_FC_NEURON_34 : STD_LOGIC_VECTOR :="01111001"; 
    constant BIAS_FC_NEURON_35 : STD_LOGIC_VECTOR :="10000010"; 
    constant BIAS_FC_NEURON_36 : STD_LOGIC_VECTOR :="01110101"; 
    constant BIAS_FC_NEURON_37 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_38 : STD_LOGIC_VECTOR :="10000001"; 
    constant BIAS_FC_NEURON_39 : STD_LOGIC_VECTOR :="01111111"; 
    constant BIAS_FC_NEURON_40 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_41 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_42 : STD_LOGIC_VECTOR :="01111100"; 
    constant BIAS_FC_NEURON_43 : STD_LOGIC_VECTOR :="01111111"; 
    constant BIAS_FC_NEURON_44 : STD_LOGIC_VECTOR :="10000010"; 
    constant BIAS_FC_NEURON_45 : STD_LOGIC_VECTOR :="10000010"; 
    constant BIAS_FC_NEURON_46 : STD_LOGIC_VECTOR :="10000011"; 
    constant BIAS_FC_NEURON_47 : STD_LOGIC_VECTOR :="01111001"; 
    constant BIAS_FC_NEURON_48 : STD_LOGIC_VECTOR :="10000000"; 
    constant BIAS_FC_NEURON_49 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_50 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_51 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_52 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_53 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_54 : STD_LOGIC_VECTOR :="10000100"; 
    constant BIAS_FC_NEURON_55 : STD_LOGIC_VECTOR :="01110011"; 
    constant BIAS_FC_NEURON_56 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_57 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_58 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_59 : STD_LOGIC_VECTOR :="01111100"; 
    constant BIAS_FC_NEURON_60 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_61 : STD_LOGIC_VECTOR :="10000000"; 
    constant BIAS_FC_NEURON_62 : STD_LOGIC_VECTOR :="01111000"; 
    constant BIAS_FC_NEURON_63 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_64 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_65 : STD_LOGIC_VECTOR :="10000100"; 
    constant BIAS_FC_NEURON_66 : STD_LOGIC_VECTOR :="01110110"; 
    constant BIAS_FC_NEURON_67 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_68 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_69 : STD_LOGIC_VECTOR :="10000000"; 
    constant BIAS_FC_NEURON_70 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_71 : STD_LOGIC_VECTOR :="01111111"; 
    constant BIAS_FC_NEURON_72 : STD_LOGIC_VECTOR :="10000101"; 
    constant BIAS_FC_NEURON_73 : STD_LOGIC_VECTOR :="01111001"; 
    constant BIAS_FC_NEURON_74 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_75 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_76 : STD_LOGIC_VECTOR :="01110111"; 
    constant BIAS_FC_NEURON_77 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_78 : STD_LOGIC_VECTOR :="10000100"; 
    constant BIAS_FC_NEURON_79 : STD_LOGIC_VECTOR :="01111100"; 
    constant BIAS_FC_NEURON_80 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_81 : STD_LOGIC_VECTOR :="10000000"; 
    constant BIAS_FC_NEURON_82 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_83 : STD_LOGIC_VECTOR :="10000110"; 
    constant BIAS_FC_NEURON_84 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_85 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_86 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_87 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_88 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_89 : STD_LOGIC_VECTOR :="10000100"; 
    constant BIAS_FC_NEURON_90 : STD_LOGIC_VECTOR :="01111001"; 
    constant BIAS_FC_NEURON_91 : STD_LOGIC_VECTOR :="01110110"; 
    constant BIAS_FC_NEURON_92 : STD_LOGIC_VECTOR :="01111000"; 
    constant BIAS_FC_NEURON_93 : STD_LOGIC_VECTOR :="01111111"; 
    constant BIAS_FC_NEURON_94 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_95 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_96 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_97 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_98 : STD_LOGIC_VECTOR :="10000001"; 
    constant BIAS_FC_NEURON_99 : STD_LOGIC_VECTOR :="10000000"; 
    constant BIAS_FC_NEURON_100 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_101 : STD_LOGIC_VECTOR :="10000100"; 
    constant BIAS_FC_NEURON_102 : STD_LOGIC_VECTOR :="01111100"; 
    constant BIAS_FC_NEURON_103 : STD_LOGIC_VECTOR :="01111011"; 
    constant BIAS_FC_NEURON_104 : STD_LOGIC_VECTOR :="01111100"; 
    constant BIAS_FC_NEURON_105 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_106 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_107 : STD_LOGIC_VECTOR :="01111001"; 
    constant BIAS_FC_NEURON_108 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_109 : STD_LOGIC_VECTOR :="01110111"; 
    constant BIAS_FC_NEURON_110 : STD_LOGIC_VECTOR :="10000001"; 
    constant BIAS_FC_NEURON_111 : STD_LOGIC_VECTOR :="01111100"; 
    constant BIAS_FC_NEURON_112 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_113 : STD_LOGIC_VECTOR :="01111010"; 
    constant BIAS_FC_NEURON_114 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_115 : STD_LOGIC_VECTOR :="01111100"; 
    constant BIAS_FC_NEURON_116 : STD_LOGIC_VECTOR :="10000010"; 
    constant BIAS_FC_NEURON_117 : STD_LOGIC_VECTOR :="01111101"; 
    constant BIAS_FC_NEURON_118 : STD_LOGIC_VECTOR :="01111110"; 
    constant BIAS_FC_NEURON_119 : STD_LOGIC_VECTOR :="01111001";  

    constant Division_valores : integer := 2;--NORMALIZO POR 2
    
    --constant Factor_De_Correction : integer :=65;
    constant Factor_De_Correction : integer :=80;
    
    function log2c(n: integer) return integer;
    	--para el cnn global
	 

end package Package_FC_120;

package body Package_FC_120 is

    function log2c(n: integer) return integer is
        variable m, p: integer := 0;
    begin
        m := 0;
        p := 1;
        while p < n loop
            m := m + 1;
            p := p * 2;
        end loop;
        return m;
    end function log2c;

end package body Package_FC_120;
