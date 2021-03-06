----------------------------------------------------------------------------------
-- Engineer: Boaz
-- Create Date: 02/22/2021
-- Project Name: Ripple Adder Addition test bench
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder_addition_tb is
end ripple_adder_addition_tb;

architecture behavior of ripple_adder_addition_tb is

signal A,B,SUM : std_logic_vector(15 downto 0) :=(others => '0');
signal CARRY,OVERFLOW :  std_logic:='0';


begin

UUT : entity work.ripple_adder_addition port map(A,B,SUM,CARRY);

tb : process

begin

A<="0011000000000001";  --A =12289    
B<="0001000000000010";  --B =4098 
-- SUM = 16387 in hex = 4003
wait for 2 ns;

A<="1111101001010000";  --A =64080  
B<="0001100010000000";  --B =6272
-- SUM = 70352 in hex = 112D0
wait for 2 ns;

A<="1111000000000000";  --A =61440   
B<="1111000000000000";  --B =61440 
-- SUM = 122880 in hex = 1E000
wait for 2 ns;




wait;
end process tb;

end;