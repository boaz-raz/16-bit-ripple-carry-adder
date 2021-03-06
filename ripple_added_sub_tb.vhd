----------------------------------------------------------------------------------
-- Engineer: Boaz 
-- Create Date: 02/22/2021
-- Project Name: Ripple Adder Subtraction test bench
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder_sub_tb is
end ripple_adder_sub_tb;

architecture behavior of ripple_adder_sub_tb is

signal A,B,sum : std_logic_vector(15 downto 0) :=(others => '0');
signal CARRY,OVERFLOW :  std_logic:='0';


begin

UUT : entity work.ripple_adder_sub port map(A,B,sum,CARRY);

tb : process

begin
A<="1111101001010000";  --A =64080 
B<="0001100010000000";  --B =6272
-- sum = 57808 in hex = E1D0 
wait for 2 ns;

A <= "1111000000000000";  --A =61440 
B <= "0111111111111111";   --B =32767
-- sum = 28673 in hex 7001
wait for 2 ns;

end process tb;

end;