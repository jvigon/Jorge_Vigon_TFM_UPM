LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
package Package_FC_84 is

    
    constant Dim_pesos_FC_84 : integer := 120; 
    constant Numero_Neuronas_FC_84 : integer := 84; 

        constant BIAS_FC_84_NEURON_0 : STD_LOGIC_VECTOR :="10000010"; 
constant BIAS_FC_84_NEURON_1 : STD_LOGIC_VECTOR :="10000000"; 
constant BIAS_FC_84_NEURON_2 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_3 : STD_LOGIC_VECTOR :="01111011"; 
constant BIAS_FC_84_NEURON_4 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_5 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_6 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_7 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_8 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_9 : STD_LOGIC_VECTOR :="10000001"; 
constant BIAS_FC_84_NEURON_10 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_11 : STD_LOGIC_VECTOR :="01111011"; 
constant BIAS_FC_84_NEURON_12 : STD_LOGIC_VECTOR :="10000000"; 
constant BIAS_FC_84_NEURON_13 : STD_LOGIC_VECTOR :="10000000"; 
constant BIAS_FC_84_NEURON_14 : STD_LOGIC_VECTOR :="10000000"; 
constant BIAS_FC_84_NEURON_15 : STD_LOGIC_VECTOR :="01111011"; 
constant BIAS_FC_84_NEURON_16 : STD_LOGIC_VECTOR :="10000010"; 
constant BIAS_FC_84_NEURON_17 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_18 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_19 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_20 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_21 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_22 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_23 : STD_LOGIC_VECTOR :="01111010"; 
constant BIAS_FC_84_NEURON_24 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_25 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_26 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_27 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_28 : STD_LOGIC_VECTOR :="01111010"; 
constant BIAS_FC_84_NEURON_29 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_30 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_31 : STD_LOGIC_VECTOR :="10000001"; 
constant BIAS_FC_84_NEURON_32 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_33 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_34 : STD_LOGIC_VECTOR :="10000010"; 
constant BIAS_FC_84_NEURON_35 : STD_LOGIC_VECTOR :="10000010"; 
constant BIAS_FC_84_NEURON_36 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_37 : STD_LOGIC_VECTOR :="01111011"; 
constant BIAS_FC_84_NEURON_38 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_39 : STD_LOGIC_VECTOR :="10000000"; 
constant BIAS_FC_84_NEURON_40 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_41 : STD_LOGIC_VECTOR :="10000010"; 
constant BIAS_FC_84_NEURON_42 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_43 : STD_LOGIC_VECTOR :="01111010"; 
constant BIAS_FC_84_NEURON_44 : STD_LOGIC_VECTOR :="10000001"; 
constant BIAS_FC_84_NEURON_45 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_46 : STD_LOGIC_VECTOR :="10000101"; 
constant BIAS_FC_84_NEURON_47 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_48 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_49 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_50 : STD_LOGIC_VECTOR :="10000001"; 
constant BIAS_FC_84_NEURON_51 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_52 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_53 : STD_LOGIC_VECTOR :="10000000"; 
constant BIAS_FC_84_NEURON_54 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_55 : STD_LOGIC_VECTOR :="01111010"; 
constant BIAS_FC_84_NEURON_56 : STD_LOGIC_VECTOR :="10000100"; 
constant BIAS_FC_84_NEURON_57 : STD_LOGIC_VECTOR :="01111011"; 
constant BIAS_FC_84_NEURON_58 : STD_LOGIC_VECTOR :="10000010"; 
constant BIAS_FC_84_NEURON_59 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_60 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_61 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_62 : STD_LOGIC_VECTOR :="10000000"; 
constant BIAS_FC_84_NEURON_63 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_64 : STD_LOGIC_VECTOR :="10000001"; 
constant BIAS_FC_84_NEURON_65 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_66 : STD_LOGIC_VECTOR :="10000000"; 
constant BIAS_FC_84_NEURON_67 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_68 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_69 : STD_LOGIC_VECTOR :="01111010"; 
constant BIAS_FC_84_NEURON_70 : STD_LOGIC_VECTOR :="10000001"; 
constant BIAS_FC_84_NEURON_71 : STD_LOGIC_VECTOR :="01111010"; 
constant BIAS_FC_84_NEURON_72 : STD_LOGIC_VECTOR :="01111110"; 
constant BIAS_FC_84_NEURON_73 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_74 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_75 : STD_LOGIC_VECTOR :="01111100"; 
constant BIAS_FC_84_NEURON_76 : STD_LOGIC_VECTOR :="01111101"; 
constant BIAS_FC_84_NEURON_77 : STD_LOGIC_VECTOR :="01111111"; 
constant BIAS_FC_84_NEURON_78 : STD_LOGIC_VECTOR :="10000011"; 
constant BIAS_FC_84_NEURON_79 : STD_LOGIC_VECTOR :="10000001"; 
constant BIAS_FC_84_NEURON_80 : STD_LOGIC_VECTOR :="01111001"; 
constant BIAS_FC_84_NEURON_81 : STD_LOGIC_VECTOR :="10000010"; 
constant BIAS_FC_84_NEURON_82 : STD_LOGIC_VECTOR :="10000000"; 
constant BIAS_FC_84_NEURON_83 : STD_LOGIC_VECTOR :="01111110"; 



    constant Factor_De_Correction : integer :=50;
    constant Division_valores : integer := 1; --NO NORMALIZO!
    function log2c(n: integer) return integer;
    	--para el cnn global
	 

end package Package_FC_84;

package body Package_FC_84 is

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

end package body Package_FC_84;
