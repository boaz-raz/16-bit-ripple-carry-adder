----------------------------------------------------------------------------------
-- Engineer: Boaz
-- Create Date: 02/22/2021
-- Project Name: Carry Ripple Adder Subtraction
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use IEEE.std_logic_unsigned.all;


entity ripple_adder_sub is

port( A :  in std_logic_vector(15 downto 0);  -- 16 bit input 1
      B :  in std_logic_vector(15 downto 0);  -- 16 bit input 2
      SUM :   out std_logic_vector(15 downto 0);   -- 16 bit SUM
      CARRY,OVERFLOW  : out std_logic   -- CARRY out.
);
end ripple_adder_sub;


architecture Behavioral of ripple_adder_sub is

--temporary signal declarations(for intermediate CARRY's).
signal c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15 : std_logic := '0';
signal TMP: std_logic_vector(15 downto 0);

begin

TMP <= not(B)+ "0000000000000001";

-- first full adder
SUM(0) <= A(0) xor TMP(0);  --SUM calculation
c0 <= A(0) and TMP(0);      --CARRY calculation
--second full adder
SUM(1) <= A(1) xor TMP(1) xor c0;
c1 <= (A(1) and TMP(1)) or (A(1) and c0) or (TMP(1) and c0);
--third full adder
SUM(2) <= A(2) xor TMP(2) xor c1;
c2 <= (A(2) and TMP(2)) or (A(2) and c1) or (TMP(2) and c1);
--fourth full adder
SUM(3) <= A(3) xor TMP(3) xor c2;
c3 <= (A(3) and TMP(3)) or (A(3) and c2) or (TMP(3) and c2);
----fifth full adder
SUM(4) <= A(4) xor TMP(4) xor c3;
c4 <= (A(4) and TMP(4)) or (A(4) and c3) or (TMP(4) and c3);
--sixth full adder
SUM(5) <= A(5) xor TMP(5) xor c4;
c5 <= (A(5) and TMP(5)) or (A(5) and c4) or (TMP(5) and c4);
--7 full adder
SUM(6) <= A(6) xor TMP(6) xor c5;
c6 <= (A(6) and TMP(6)) or (A(6) and c5) or (TMP(6) and c5);
--8 full adder
SUM(7) <= A(7) xor TMP(7) xor c6;
c7 <= (A(7) and TMP(7)) or (A(7) and c6) or (TMP(7) and c6);
--8 full adder
SUM(8) <= A(8) xor TMP(8) xor c7;
c8 <= (A(8) and TMP(8)) or (A(8) and c7) or (TMP(8) and c7);
--9 full adder
SUM(9) <= A(9) xor TMP(9) xor c8;
c9 <= (A(9) and TMP(9)) or (A(9) and c8) or (TMP(9) and c8);
--10 full adder
SUM(10) <= A(10) xor TMP(10) xor c9;
c10 <= (A(10) and TMP(10)) or (A(10) and c9) or (TMP(10) and c9);
--11 full adder
SUM(11) <= A(11) xor TMP(11) xor c10;
c11 <= (A(11) and TMP(11)) or (A(11) and c10) or (TMP(11) and c10);
--12 full adder
SUM(12) <= A(12) xor TMP(12) xor c11;
c12 <= (A(12) and TMP(12)) or (A(12) and c11) or (TMP(12) and c11);
--13 full adder
SUM(13) <= A(13) xor TMP(13) xor c12;
c13 <= (A(13) and TMP(13)) or (A(13) and c12) or (TMP(13) and c12);
--14 full adder
SUM(14) <= A(14) xor TMP(14) xor c13;
c14 <= (A(14) and TMP(14)) or (A(14) and c13) or (TMP(14) and c13);
--15 full adder
SUM(15) <= A(15) xor TMP(15) xor c14;
c15 <= (A(15) and TMP(15)) or (A(15) and c14) or (TMP(15) and c14);

OVERFLOW <= c14 xor c15 ;

--final CARRY assignment
CARRY <= c15;

-- check for overflow 

process(c15)
begin
	if c15 > '0' then
		report "overflow was found";
		else
			report "overflow was NOT found";
		end if;
end process;

end Behavioral;
