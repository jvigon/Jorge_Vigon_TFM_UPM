LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
package Package_FC_10 is
    
    constant Maximo_numero_Detect : integer := 9;
    
    constant Dim_pesos_FC_10 : integer := 84; 
    constant Numero_Neuronas_FC_10 : integer := 10; 
    
    constant BIAS_FC_10_NEURON_0 : STD_LOGIC_VECTOR :="00111010"; 
    constant BIAS_FC_10_NEURON_1 : STD_LOGIC_VECTOR :="00111010"; 
    constant BIAS_FC_10_NEURON_2 : STD_LOGIC_VECTOR :="00111001"; 
    constant BIAS_FC_10_NEURON_3 : STD_LOGIC_VECTOR :="00111000"; 
    constant BIAS_FC_10_NEURON_4 : STD_LOGIC_VECTOR :="00111001"; 
    constant BIAS_FC_10_NEURON_5 : STD_LOGIC_VECTOR :="00111001"; 
    constant BIAS_FC_10_NEURON_6 : STD_LOGIC_VECTOR :="00111000"; 
    constant BIAS_FC_10_NEURON_7 : STD_LOGIC_VECTOR :="00111001"; 
    constant BIAS_FC_10_NEURON_8 : STD_LOGIC_VECTOR :="00011111"; 
    constant BIAS_FC_10_NEURON_9 : STD_LOGIC_VECTOR :="00111001"; 

    constant Division_valores : integer := 1;--NO NORMALIZO!!!
    constant Max_rango : integer := 2;--NO NORMALIZO!!!
    --constant Factor_De_Correction : integer :=25;
    function log2c(n: integer) return integer;
    	--para el cnn global
	 

end package Package_FC_10;

package body Package_FC_10 is

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

end package body Package_FC_10;
