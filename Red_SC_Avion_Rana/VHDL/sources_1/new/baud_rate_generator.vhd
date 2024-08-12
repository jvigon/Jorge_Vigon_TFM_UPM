
-- Listing 4.11
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity baud_rate_generator is
   generic(
      n: integer := 8;     -- number of bits
      bit_stop : integer := 1; --number of stop bits
      M: integer := 163    -- mod-M
  );
   port(
      clk, reset: in std_logic;
      max_tick: out std_logic);
end baud_rate_generator;

architecture arch of baud_rate_generator is
   signal r_reg: unsigned(N-1 downto 0) := (others => '0');
   signal r_next: unsigned(N-1 downto 0) := (others => '0');
begin
   -- register
   process(clk,reset)
   begin
      if (reset='0') then
         r_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         r_reg <= r_next;
      end if;
   end process;
   -- next-state logic
   r_next <= (others=>'0') when r_reg=(M-1) else
             r_reg + 1;
   -- output logic
   max_tick <= '1' when r_reg=(M-1) else '0';
end arch;
